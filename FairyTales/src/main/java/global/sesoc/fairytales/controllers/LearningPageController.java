package global.sesoc.fairytales.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import global.sesoc.fairytales.dao.Editor_Repository;
import global.sesoc.fairytales.dto.Chapter;
import global.sesoc.fairytales.dto.Fairytales;
import global.sesoc.fairytales.util.FileService;

@Controller
public class LearningPageController {
	
	@Autowired
	Editor_Repository repository;
	
	// 저장소
	static final String FT_UPLOAD_PATH = "/FairyTales/";
	
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

		System.out.println("japanese_fairy 초급페이지 요청");

		return "learning/japanese_fairy_1beginner";
	}

	// japanese_fairy 중급동화 요청
	@RequestMapping(value = "/japanese_fairy_2intermediate", method = RequestMethod.GET)
	public String japanese_fairy_2intermediate() {

		System.out.println("japanese_fairy 중급페이지 요청");

		return "learning/japanese_fairy_2intermediate";
	}
	
	/**
	 * 고급동화 백현일 수정
	 * @return
	 */
	// japanese_fairy 고급동화 요청
	@RequestMapping(value = "/japanese_fairy_3high", method = RequestMethod.GET)
	public String japanese_fairy_3high() {

		System.out.println("japanese_fairy 고급페이지 요청");
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

		System.out.println("codding_puzzle 초급페이지 요청");

		return "learning/coding_fairy_1beginner";
	}

	// 코딩 중급동화 요청
	@RequestMapping(value = "/coding_fairy_2intermediate", method = RequestMethod.GET)
	public String coding_fairy_2intermediate() {

		System.out.println("codding_puzzle 중급페이지 요청");

		return "learning/coding_fairy_2intermediate";
	}

	// 코딩 고급동화 요청
	@RequestMapping(value = "/coding_fairy_3high", method = RequestMethod.GET)
	public String coding_fairy_3high(Model model) {

		System.out.println("codding_puzzle 고급페이지 요청");
		

		List<Fairytales> ft = repository.selectFairytalesC3();
		List<Chapter> chapterList = new ArrayList<Chapter>();
		
		for(int j=0; j < ft.size(); ++j) {
			for(int i=0; i < ft.get(j).getFairy_chapter(); ++i) {
				String chapterJson = FileService.readJson(FT_UPLOAD_PATH + ft.get(j).getFairy_pk() + "/" + (i+1) + "/chapter.json");
				System.out.println("chapterJson : " + chapterJson);
				if(chapterJson != null && !(chapterJson.equals(""))) {
					ObjectMapper mapper = new ObjectMapper();
						try {
							Chapter chapter = mapper.readValue(chapterJson, new TypeReference<Chapter>(){});
							chapter.setFairy_pk(ft.get(j).getFairy_pk());
							chapter.setChapter(i+1);
							chapterList.add(chapter);
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
				}else {
					//없다면..
					chapterList.add(null);
				}
			}
		}
		model.addAttribute("ft", ft);
		model.addAttribute("chapterList", chapterList);
		
		System.out.println("ft :"+ ft);
		System.out.println("chapterList :"+ chapterList);
		
		
		return "learning/coding_fairy_3high";
	}

}
