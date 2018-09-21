package global.sesoc.fairytales.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.fairytales.dao.Board_1to1_Repository;
import global.sesoc.fairytales.dao.Reply_1to1_Repository;

@Controller
public class beginnerController {
	
	@Autowired // 리플 레파지토리
	Reply_1to1_Repository reply_repository;
	@Autowired // 보드 레파지토리
	Board_1to1_Repository board_repository;
	
	//window.open("idCheck","newidwindow","top=200,left=300,width=400,height=400,resizable=no");
	@RequestMapping(value = "/cendrillon_screen1")
	public String write(Model model) {
		return "./fairy/3high/cendrillon/screen1";
	}
	
	@ResponseBody
	@RequestMapping(value = "/first_answer", method = RequestMethod.POST)	//받는곳
	public String sample_answer(String answer) {
		
		boolean ret_value = true;		//비교리턴값
		String[] st = answer.split(",");

		for(int i = 0 ; i<st.length;i++) {
			System.out.print(st[i]);
		}
		//여기서 디비에서 값 기져와서 비교
		for(int i = 0; i<st.length;i++) {
			//비교비교
		}
		if(ret_value) {
			return "1";
		}else {
			return "0";
		}
	}
}
