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
 * @author Hyunil エディター·コントローラ
 */

@Controller
public class EditorController {
	
	@Autowired
	Editor_Repository repository;
	
	// セーブ位置
	static final String FT_UPLOAD_PATH = "/FairyTales/";
	
	//童話の全リスト
	@RequestMapping(value = "/editorList", method = RequestMethod.GET)
	public String editorList(Model model) {
		
		List<Fairytales> fairytales = repository.selectFairytales();
		model.addAttribute("fairytales", fairytales);
		return "editorList";
	}
	
	//童話チャプターの全リスト
	@RequestMapping(value = "/editorAdd", method = RequestMethod.GET)
	public String editorAdd(Integer fpk, Model model) {
		
		//pk値がない場合
		if(fpk == null) {
			return "redirect:/editorList";
		}
		
		Fairytales ft = new Fairytales();
		ft.setFairy_pk(fpk);
		Fairytales fairytales = repository.selectFairytales(ft);

		model.addAttribute("fairytales", fairytales);
		return "editorAdd";
	}
	
	//editor
	@RequestMapping(value = "/editor", method = RequestMethod.GET)
	public String editor(Integer fpk, Integer chapter, Model model) {
		Fairytales fairytales = new Fairytales();
		fairytales.setFairy_pk(fpk);
		fairytales = repository.selectFairytales(fairytales);

		model.addAttribute("fairytales", fairytales);
		
		model.addAttribute("fpk", fpk);
		model.addAttribute("chapter", chapter);
		
		//json変換
		String chapterJson = FileService.readJson(FT_UPLOAD_PATH + fpk + "/" + chapter + "/chapter.json");
		String objListJson = FileService.readJson(FT_UPLOAD_PATH + fpk + "/" + chapter + "/objList.json");
		String exampleJson = FileService.readJson(FT_UPLOAD_PATH + fpk + "/" + chapter + "/example.json");
		String anwserJson = FileService.readJson(FT_UPLOAD_PATH + fpk + "/" + chapter + "/anwser.json");
		
		model.addAttribute("getChapter",chapterJson);
		model.addAttribute("getObjList",objListJson);
		model.addAttribute("getExample",exampleJson);
		model.addAttribute("getAnwser",anwserJson);
		
		return "editor";
	}
	
	// イメージ セーブ
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
	
	//設定Json セーブ
	@RequestMapping(value = "/saveFairy", method = RequestMethod.POST)
	public String saveFairy(String questionType, String fpkNum, String chapterNum,String chapter,String objList,String exampleBox,String anwserBox){
		FileService.saveJson(chapter,FT_UPLOAD_PATH + fpkNum + "/" + chapterNum + "/chapter.json");
		FileService.saveJson(objList,FT_UPLOAD_PATH + fpkNum + "/" + chapterNum +  "/objList.json");
		FileService.saveJson(exampleBox,FT_UPLOAD_PATH + fpkNum + "/" + chapterNum +  "/example.json");
		FileService.saveJson(anwserBox,FT_UPLOAD_PATH + fpkNum + "/" + chapterNum +  "/anwser.json");
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			
			List<Question> qt = mapper.readValue(anwserBox, new TypeReference<List<Question>>(){});
			
			String notIn = "";
			
			//주의점 정답은 _ 가 안들어가도록 // 동화 setQuestion_type은 동화 타입이 바뀌면 바뀌도록 해야하는데..
			for(int i = 0; i < qt.size(); ++i) {
				qt.get(i).setFairy_pk(Integer.parseInt(fpkNum));
				qt.get(i).setChapter(Integer.parseInt(chapterNum));
				
				if(questionType.equals("jp") ) {
					qt.get(i).setQuestion_type("1");
				}else {
					qt.get(i).setQuestion_type("2");
				}
				
				int re = repository.update_question(qt.get(i));
				System.out.println("qt :" + qt + " re :" + re);
				if(re == 0){
					repository.insert_question(qt.get(i));
				}
				if(i != 0) {
					notIn += ",";
				}
				notIn += qt.get(i).getObj_id();
			}
			
			Question delQt = new Question();			
			delQt.setFairy_pk(Integer.parseInt(fpkNum));
			delQt.setChapter(Integer.parseInt(chapterNum));
			delQt.setDelidset(notIn);
			repository.delete_question(delQt);
			
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
		
		return "redirect:/editorList";
	}
	
	//童話情報DB情報/修整
	@RequestMapping(value = "/inFT", method = RequestMethod.POST)
	public @ResponseBody String inFT(@RequestBody  Fairytales fairytales)  {
		
		int key = 0;
		if(fairytales.getFairy_pk() != null) {
			//System.out.println("update");
			key = repository.update_editor(fairytales);
		}else {
			//System.out.println("insert");
			key = repository.insert_editor(fairytales);
		}
		
		String re = "NO";
		if(key > 0) {
			re = "OK";
		}
		
		return re;
	}
	//童話情報DB削除
	@RequestMapping(value = "/deleteFT", method = RequestMethod.POST)
	public @ResponseBody String deleteFT(Integer fpk)  {
		int key = repository.delete_editor(fpk);
		
		String re = "NO";
		if(key > 0) {
			re = "OK";
		}
		return re;
	}
	
	// イメージを見せる
	@RequestMapping(value = "/image", method = RequestMethod.GET, produces = "image/jpg")
	public @ResponseBody byte[] getFile(String tmpImg,Integer fpk, Integer chapter)  {
		if(tmpImg == null || tmpImg.equals("")) {
			return null;
		}
		String imgName[] = tmpImg.split("\\.");
		
	    try {
	        // Path設定
	    	String getPath = FT_UPLOAD_PATH + "/" + tmpImg;
	    	if(fpk != null) {
	    		getPath = FT_UPLOAD_PATH + fpk + "/" + chapter + "/" + tmpImg;
	    	}
	    	
	        File path = new File(getPath);
			if (!path.isDirectory()) {
				path.mkdirs();
			}
	        
			//イメージ アウトプット
	        BufferedImage img = ImageIO.read(path);

	        ByteArrayOutputStream bao = new ByteArrayOutputStream();
	        
	        ImageIO.write(img, imgName[imgName.length-1] , bao);

	        return bao.toByteArray();
	    } catch (IOException e) {
	        System.out.println(e);
	        throw new RuntimeException(e);
	    }
	}
}
