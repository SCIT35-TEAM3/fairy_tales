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

		return "learning/japanese_fairy_1beginner";
	}

	// codding_puzzle 요청
	@RequestMapping(value = "/puzzle_test", method = RequestMethod.GET)
	public String puzzle_test() {

		System.out.println("codding_puzzle 페이지 요청");

		return "learning/puzzle_test";
	}

	// japanese_fairy 초급동화 요청
	@RequestMapping(value = "/japanese_fairy_1beginner", method = RequestMethod.GET)
	public String japanese_fairy_1beginner() {

		System.out.println("japanese_fairy 페이지 요청");

		return "learning/japanese_fairy_1beginner";
	}

	// japanese_fairy 중급동화 요청
	@RequestMapping(value = "/japanese_fairy_2intermediate", method = RequestMethod.GET)
	public String japanese_fairy_2intermediate() {

		System.out.println("japanese_fairy 페이지 요청");

		return "learning/japanese_fairy_2intermediate";
	}

	// japanese_fairy 고급동화 요청
	@RequestMapping(value = "/japanese_fairy_3high", method = RequestMethod.GET)
	public String japanese_fairy_3high() {

		System.out.println("japanese_fairy 페이지 요청");

		return "learning/japanese_fairy_3high";
	}

	// codding_puzzle 요청
	@RequestMapping(value = "/coding_puzzle", method = RequestMethod.GET)
	public String coding_puzzle() {

		System.out.println("codding_puzzle 페이지 요청");

		return "learning/coding_fairy_1beginner";
	}

	// 코딩 초급동화 요청
	@RequestMapping(value = "/coding_fairy_1beginner", method = RequestMethod.GET)
	public String coding_fairy_1beginner() {

		System.out.println("codding_puzzle 페이지 요청");

		return "learning/coding_fairy_1beginner";
	}

	// 코딩 중급동화 요청
	@RequestMapping(value = "/coding_fairy_2intermediate", method = RequestMethod.GET)
	public String coding_fairy_2intermediate() {

		System.out.println("codding_puzzle 페이지 요청");

		return "learning/coding_fairy_2intermediate";
	}

	// 코딩 고급동화 요청
	@RequestMapping(value = "/coding_fairy_3high", method = RequestMethod.GET)
	public String coding_fairy_3high() {

		System.out.println("codding_puzzle 페이지 요청");

		return "learning/coding_fairy_3high";
	}

}
