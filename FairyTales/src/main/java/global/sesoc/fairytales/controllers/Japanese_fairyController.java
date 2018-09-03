package global.sesoc.fairytales.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class Japanese_fairyController {

	
	// japanese_fairy 요청
		@RequestMapping(value = "/japanese_fairy", method = RequestMethod.GET)
		public String japanese_fairy() {

			System.out.println("japanese_fairy 페이지 요청");

			return "learning/japanese_fairy";
		}
}
