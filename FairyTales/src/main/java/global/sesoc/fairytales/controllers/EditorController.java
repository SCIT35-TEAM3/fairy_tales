package global.sesoc.fairytales.controllers;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.imageio.ImageIO;

import org.apache.commons.io.output.ByteArrayOutputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import global.sesoc.fairytales.dao.Editor_Repository;
import global.sesoc.fairytales.dto.Fairytales;
import global.sesoc.fairytales.dto.Question;
import global.sesoc.fairytales.util.FileService;

/**
 * 
 * @author Hyunil 에디터 컨트롤러
 */

@Controller
public class EditorController {
	
	@Autowired
	Editor_Repository repository;
	
	/*/ 임시 저장소 폐쇠
	static final String FT_TEMP_PATH = "/FairyTales/TEMP/";
	*/
	// 저장소
	static final String FT_UPLOAD_PATH = "/FairyTales/";
	
	
	//동화 전체 리스트
	@RequestMapping(value = "/editorList", method = RequestMethod.GET)
	public String editorList(Model model) {
		
		List<Fairytales> fairytales = repository.selectFairytales();
		model.addAttribute("fairytales", fairytales);
		return "editorList";
	}
	
	//동화 챕터리스트 리스트
	@RequestMapping(value = "/editorAdd", method = RequestMethod.GET)
	public String editorAdd(Integer fpk, Model model) {
		
		//넘어온 pk가 없을경우
		if(fpk == null) {
			return "redirect:/editorList";
		}
		
		Fairytales ft = new Fairytales();
		ft.setFairy_pk(fpk);
		Fairytales fairytales = repository.selectFairytales(ft);
		System.out.println("fairytales : " + fairytales);

		model.addAttribute("fairytales", fairytales);
		return "editorAdd";
	}
	
	//에디터
	@RequestMapping(value = "/editor", method = RequestMethod.GET)
	public String editor(Integer fpk, Integer chapter, Model model) {
		model.addAttribute("fpk", fpk);
		model.addAttribute("chapter", chapter);
		return "editor";
	}
	
	// 이미지 저장
	@ResponseBody
	@RequestMapping(value = "/editdata", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public String editdata(MultipartHttpServletRequest multi) {
		
		String fpkNum = multi.getParameter("fpkNum");
		String chapterNum = multi.getParameter("chapterNum");
		
		MultipartFile file = null;
		//파일불러오기
		Iterator<String> files = multi.getFileNames();
		while(files.hasNext()){
			String uploadFile = files.next();
			file = multi.getFile(uploadFile);
		}
		
		String save_file = FileService.saveFile(file, FT_UPLOAD_PATH + fpkNum + "/" + chapterNum + "/");
		
		return save_file;
	}
	
	/*@RequestMapping(value = "/saveFairy", method = RequestMethod.POST)
	public String saveFairy(String fpkNum, String chapterNum,String chapter,String objList,String exampleBox,String anwserBox){
		FileService.saveJson(chapter,FT_UPLOAD_PATH + fpkNum + "/" + chapterNum + "/chapter.json");
		FileService.saveJson(objList,FT_UPLOAD_PATH + fpkNum + "/" + chapterNum +  "/objList.json");
		FileService.saveJson(exampleBox,FT_UPLOAD_PATH + fpkNum + "/" + chapterNum +  "/example.json");
		FileService.saveJson(anwserBox,FT_UPLOAD_PATH + fpkNum + "/" + chapterNum +  "/anwser.json");
		
		return "redirect:/";
	}*/
	
	@RequestMapping(value = "/saveFairy", method = RequestMethod.POST)
	public String saveFairy(String fpkNum, String chapterNum,String chapter,String objList,String exampleBox,String anwserBox){
		FileService.saveJson(chapter,FT_UPLOAD_PATH + fpkNum + "/" + chapterNum + "/chapter.json");
		FileService.saveJson(objList,FT_UPLOAD_PATH + fpkNum + "/" + chapterNum +  "/objList.json");
		FileService.saveJson(exampleBox,FT_UPLOAD_PATH + fpkNum + "/" + chapterNum +  "/example.json");
		FileService.saveJson(anwserBox,FT_UPLOAD_PATH + fpkNum + "/" + chapterNum +  "/anwser.json");
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			
			List<Question> qt = mapper.readValue(anwserBox, new TypeReference<List<Question>>(){});
			
			System.out.println("Answer" + qt.toString());
			
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("anwserBox : " + anwserBox);
		
		return "redirect:/";
	}
	
	//동화 생성
	@RequestMapping(value = "/inFT", method = RequestMethod.POST)
	public @ResponseBody String inFT(@RequestBody  Fairytales fairytales)  {
		
		int key = 0;
		if(fairytales.getFairy_pk() != null) {
			System.out.println("update");
			key = repository.update_editor(fairytales);
		}else {
			System.out.println("insert");
			key = repository.insert_editor(fairytales);
		}
		
		String re = "NO";
		if(key > 0) {
			re = "OK";
		}
		
		return re;
	}
	//동화 생성
	@RequestMapping(value = "/deleteFT", method = RequestMethod.POST)
	public @ResponseBody String deleteFT(Integer fpk)  {
		int key = repository.delete_editor(fpk);
		
		String re = "NO";
		if(key > 0) {
			re = "OK";
		}
		return re;
	}
	//이미지 보기
	@RequestMapping(value = "/image", method = RequestMethod.GET, produces = "image/jpg")
	public @ResponseBody byte[] getFile(String tmpImg,Integer fpk, Integer chapter)  {
		if(tmpImg == null || tmpImg.equals("")) {
			return null;
		}
		String imgName[] = tmpImg.split("\\.");
		
	    try {
	        // Retrieve image from the classpath.
	    	//InputStream is = this.getClass().getResourceAsStream(FT_UPLOAD_PATH + tmpImg); 
	        
	        File path = new File(FT_UPLOAD_PATH + fpk + "/" + chapter + "/" + tmpImg);
			if (!path.isDirectory()) {
				path.mkdirs();
			}
	        
	        // Prepare buffered image.
	        BufferedImage img = ImageIO.read(path);

	        // Create a byte array output stream.
	        ByteArrayOutputStream bao = new ByteArrayOutputStream();

	        // Write to output stream
	        ImageIO.write(img, imgName[imgName.length-1] , bao);

	        return bao.toByteArray();
	    } catch (IOException e) {
	        System.out.println(e);
	        throw new RuntimeException(e);
	    }
	}
}
