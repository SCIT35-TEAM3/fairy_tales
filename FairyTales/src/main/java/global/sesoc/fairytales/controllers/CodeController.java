package global.sesoc.fairytales.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.fairytales.dao.CodeAnswerRepository;
import global.sesoc.fairytales.dto.Code;

@Controller
public class CodeController {
	
	@Autowired // 리플 레파지토리
	CodeAnswerRepository answer_repository;

	@RequestMapping(value = "/cendrillon_code1")
	public String start(Model model) {
		return "./coding/3high/cendrillon/code1";
	}
	
	@ResponseBody
	@RequestMapping(value = "/first_code_answer", method = RequestMethod.POST)	// 빈칸 2개짜리 받는곳
	public String first_code_answer(String answer) {
		
		String[] st = answer.split(",");
		
		Code c = new Code();

		c.setFairy_Pk(st[st.length-1]);
		c.setSinNum(st[st.length-2]);
		c.setScreenNum(st[st.length-3]);
		c.setQuestion_type("2");
		System.out.println(c);
		String answer_list = answer_repository.getAnswer(c);
		
		int first_num = Integer.parseInt(st[0]);
		int second_num = Integer.parseInt(st[1]);
		int third_num = Integer.parseInt(st[2]);
		int first_answer = Integer.parseInt(answer_list)/100;
		int second_answer = Integer.parseInt(answer_list)/10 - first_answer*10;
		int third_answer = Integer.parseInt(answer_list) - first_answer*100 - second_answer*10;
		
		System.out.println(first_answer + " : " + second_answer + " : " + third_answer);
		if((first_num == first_answer) && (second_num == second_answer) && (third_num == third_answer)) {
			return "1";
		}else {
			return "0";
		}
	}
}
