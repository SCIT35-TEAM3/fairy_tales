package global.sesoc.fairytales.controllers;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.apache.commons.io.output.ByteArrayOutputStream;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.fairytales.util.FileService;

/**
 * 
 * @author Hyunil 에디터 컨트롤러
 */

@Controller
public class EditorController {

	// 임시 저장소
	static final String FT_TEMP_PATH = "/FairyTales/TEMP/";
	// 저장소
	static final String FT_UPLOAD_PATH = "/FairyTales/";

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
