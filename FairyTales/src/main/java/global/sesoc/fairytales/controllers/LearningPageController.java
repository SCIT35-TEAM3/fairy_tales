package global.sesoc.fairytales.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LearningPageController {

	// japanese_fairy 요청
	@RequestMapping(value = "/japanese_fairy", method = RequestMethod.GET)
	public String japanese_fairy() {

		System.out.println("japanese_fairy 페이지 요청");

		return "learning/japanese_fairy";
	}

	// codding_puzzle 요청
	@RequestMapping(value = "/coding_puzzle", method = RequestMethod.GET)
	public String coding_puzzle() {

		System.out.println("codding_puzzle 페이지 요청");

		return "learning/coding_puzzle";
	}
	// codding_puzzle 요청
		@RequestMapping(value = "/puzzle_test", method = RequestMethod.GET)
		public String puzzle_test() {

			System.out.println("codding_puzzle 페이지 요청");

			return "learning/puzzle_test";
		}
}
