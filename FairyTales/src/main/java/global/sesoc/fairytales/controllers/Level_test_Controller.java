package global.sesoc.fairytales.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Level_test_Controller {
	
	@RequestMapping(value="j_test")
	public String japenese() {
		
		return "test/japanese_test";
	}
	@RequestMapping(value="it_test")
	public String it() {
		
		return "test/it_test";
	}
	

}
