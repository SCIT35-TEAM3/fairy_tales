package global.sesoc.fairytales.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.fairytales.dto.FTObj;

/**
 * 
 * @author Hyunil
 * 에디터 컨트롤러
 */

@Controller
public class EditorController {

	static final String UPLOADPATH = "/boardfile";
	
	@RequestMapping(value = "/editor", method = RequestMethod.GET)
	public String editor() {
		return "editor";
	}
	
	//@RequestPart 
	// 글 등록
	//public String editdata(@RequestBody ArrayList<FTObj> objList) {
	@ResponseBody
	@RequestMapping(value = "/editdata", method = RequestMethod.POST)
	public String editdata(@RequestPart("objList") FTObj objList) {
		//System.out.println("chapter : " + chapter);
		System.out.println("objList : " + objList);
		//String origin_file_name = upload.getOriginalFilename();
		//String save_file = FileService.saveFile(upload, UPLOADPATH);
		return "!!";
	}
	
}
