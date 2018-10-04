package global.sesoc.fairytales.controllers;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import global.sesoc.fairytales.dao.CodeAnswerRepository;
import global.sesoc.fairytales.dto.Chapter;
import global.sesoc.fairytales.dto.Code;
import global.sesoc.fairytales.dto.Example;
import global.sesoc.fairytales.dto.ObjectList;
import global.sesoc.fairytales.dto.Question;
import global.sesoc.fairytales.util.FileService;

@Controller
public class CodeController {
	
	@Autowired // 리플 레파지토리
	CodeAnswerRepository answer_repository;
	
	// 저장소
	static final String FT_UPLOAD_PATH = "/FairyTales/";

	@RequestMapping(value = "/cendrillon_code1")
	public String start(Model model) {
		return "./coding/3high/cendrillon/code1";
	}
	
	@ResponseBody
	@RequestMapping(value = "/first_code_answer2", method = RequestMethod.POST)	// 빈칸 2개짜리 받는곳
	public String first_code_answer(String answer) {
		
		String[] st = answer.split(",");
		
		System.out.println("answer : "  + answer);
		Code c = new Code();

		
		c.setObjid(st[st.length-4]);
		c.setChapter(st[st.length-3]);
		c.setFairy_Pk(st[st.length-2]);
		c.setQuestion_type(st[st.length-1]);
		System.out.println(c);
		String answer_list = answer_repository.getAnswer(c);
		
		System.out.println("answer_list : "  + answer_list);
		String[] answerSplit = answer_list.split("_");
		
		if(answerSplit.length != (st.length-4)) {
			//갯수가 잘못됨 
			System.out.println("갯수가 잘못됨 ");
			return "0";
		}
		
		boolean check = true;
		
		for(int i = 0; i < answerSplit.length; ++i) {
			if(!answerSplit[i].equals(st[i])) {
				check = false;
			}
		}
		
		if(check) {
			// 정답?
			return "1";
		}else {
			return "0";
		}
	}
	
	/**editor_player?ft=69&chap=1
	 * 변종 생성 - 백현일
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/editor_player")
	public String player(Model model,String ft,String chap,String qt) {
		System.out.println("ft :" + ft + " , chap :" +  chap);
		
		model.addAttribute("ft", ft);		//동화 pk
		model.addAttribute("chap", chap);	//챕터
		model.addAttribute("qt", qt);		//java 일본어 분류
		
		String chapterJson = FileService.readJson(FT_UPLOAD_PATH + ft + "/" + chap + "/chapter.json");
		String objListJson = FileService.readJson(FT_UPLOAD_PATH + ft + "/" + chap + "/objList.json");
		String exampleJson = FileService.readJson(FT_UPLOAD_PATH + ft + "/" + chap + "/example.json");
		//String anwserJson = FileService.readJson(FT_UPLOAD_PATH + ft + "/" + chap + "/anwser.json");
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			Chapter chapter = mapper.readValue(chapterJson, new TypeReference<Chapter>(){});
			List<Example> example = mapper.readValue(exampleJson, new TypeReference<List<Example>>(){});
			List<ObjectList> objectList = mapper.readValue(objListJson, new TypeReference<List<ObjectList>>(){});
			//Chapter chapter = mapper.readValue(objListJson, new TypeReference<Chapter>(){});
			/*
			System.out.println("chapter :" + chapter);
			System.out.println();
			System.out.println("example :" + example);
			System.out.println();
			System.out.println("objectList :" + objectList);
			*/
			model.addAttribute("chapter", chapter);
			model.addAttribute("example", example);
			model.addAttribute("objectList", objectList);
			
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
		
		return "./coding/3high/cendrillon/editor_player";
	}
}
