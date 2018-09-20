package global.sesoc.fairytales.controllers;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
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

import global.sesoc.fairytales.dao.Editor_Repository;
import global.sesoc.fairytales.dto.Fairytales;
import global.sesoc.fairytales.util.FileService;

/**
 * 
 * @author Hyunil 에디터 컨트롤러
 */

@Controller
public class EditorController {
	
	@Autowired
	Editor_Repository repository;
	
	// 임시 저장소
	static final String FT_TEMP_PATH = "/FairyTales/TEMP/";
	// 저장소
	static final String FT_UPLOAD_PATH = "/FairyTales/";
	
	
	//에디터 리스트
	@RequestMapping(value = "/editorList", method = RequestMethod.GET)
	public String editorList(Model model) {
		
		List<Fairytales> fairytales = repository.selectFairytales();
		System.out.println(fairytales);
		model.addAttribute("fairytales", fairytales);
		return "editorList";
	}
	
	//에디터
	@RequestMapping(value = "/editor", method = RequestMethod.GET)
	public String editor() {
		return "editor";
	}
	
	// 이미지 저장
	@ResponseBody
	@RequestMapping(value = "/editdata", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public String editdata(MultipartFile file) {
		System.out.println("file : " + file);

		// String origin_file_name = file.getOriginalFilename();
		String save_file = FileService.saveFile(file, FT_TEMP_PATH);

		return save_file;
	}
	
	@RequestMapping(value = "/saveFairy", method = RequestMethod.POST)
	public String saveFairy(String chapter,String objList){
		FileService.saveJson(chapter,FT_UPLOAD_PATH + "/chapter.json");
		FileService.saveJson(objList,FT_UPLOAD_PATH + "/objList.json");
		
		return "redirect:/";
	}
	
	//동화 생성
	@RequestMapping(value = "/inFT", method = RequestMethod.POST)
	public @ResponseBody String inFT(@RequestBody  Fairytales fairytales)  {
		
		System.out.println("fairytales : " + fairytales);
		
		int key = repository.insert_editor(fairytales);
		
		System.out.println("key : " + key);
		
		return "";
	}
	
	//이미지 보기
	@RequestMapping(value = "/image", method = RequestMethod.GET, produces = "image/jpg")
	public @ResponseBody byte[] getFile(String tmpImg)  {
		if(tmpImg == null || tmpImg.equals("")) {
			return null;
		}
		String imgName[] = tmpImg.split("\\.");
		
	    try {
	        // Retrieve image from the classpath.
	        //InputStream is = this.getClass().getResourceAsStream(FT_TEMP_PATH + tmpImg); 
	        
	        File path = new File(FT_TEMP_PATH + tmpImg);
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
