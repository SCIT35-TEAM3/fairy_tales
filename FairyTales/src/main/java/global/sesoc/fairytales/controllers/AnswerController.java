package global.sesoc.fairytales.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.fairytales.dao.AnswerRepository;
import global.sesoc.fairytales.dao.Board_1to1_Repository;
import global.sesoc.fairytales.dao.Reply_1to1_Repository;
import global.sesoc.fairytales.dto.Board_1to1;
import global.sesoc.fairytales.dto.SinScreen;

@Controller
public class AnswerController {
	
	@Autowired // 리플 레파지토리
	AnswerRepository answer_repository;
	
	//window.open("idCheck","newidwindow","top=200,left=300,width=400,height=400,resizable=no");
	@RequestMapping(value = "/cendrillon_screen1")
	public String write(Model model) {
		return "./fairy/3high/cendrillon/screen1";
	}
	
	@RequestMapping(value = "/cendrillon_screen2")
	public String write2(Model model) {
		return "./fairy/3high/cendrillon/screen2";
	}
	
	@ResponseBody
	@RequestMapping(value = "/first_answer", method = RequestMethod.POST)	// 빈칸 2개짜리 받는곳
	public String first_answer(String answer) {
		boolean ret_value = true;		//비교리턴값
		String[] st = answer.split(",");
		
		SinScreen ss = new SinScreen();
		
		ss.setScreenNum(st[st.length-3]);
		ss.setSinNum(st[st.length-2]);
		ss.setFairy_Pk(st[st.length-1]);
		ss.setQuestion_type("1");
		
		System.out.println(ss);
		
		String answer_list = answer_repository.getAnswer(ss);
		
		int first_num = Integer.parseInt(st[st.length-5]);
		int second_num = Integer.parseInt(st[st.length-4]);
		int first_answer = Integer.parseInt(answer_list)/10;
		int second_answer = Integer.parseInt(answer_list)%10;

		if(first_num == first_answer) {
			if(second_num == second_answer) {
				return "1";
			}
			else {
				return "0";
			}
		}else {
			return "0";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/second_answer", method = RequestMethod.POST)	//빈칸 1개짜리 받는곳
	public String second_answer(String answer) {
		
		String[] st = answer.split(",");
		System.out.println("혼자값 : " + answer);
		
		SinScreen ss = new SinScreen();
		
		ss.setScreenNum(st[st.length-3]);
		ss.setSinNum(st[st.length-2]);
		ss.setFairy_Pk(st[st.length-1]);
		ss.setQuestion_type("1");
		
		String answer_list = answer_repository.getAnswer_one(ss);
		
		int first_num = Integer.parseInt(st[st.length-4]);
		int first_answer = Integer.parseInt(answer_list)%10;
		
		System.out.println(first_num + " : " + first_answer);
		//여기서 디비에서 값 기져와서 비교

		if(first_num == first_answer) {
			return "1";
		}else {
			return "0";
		}
	}
}
