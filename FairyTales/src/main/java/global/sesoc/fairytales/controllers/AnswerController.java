package global.sesoc.fairytales.controllers;

import java.io.FileReader;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
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
	
	@RequestMapping(value = "/cendrillon_screen3", method = RequestMethod.GET)
	public String write3(Model model, String ft, String chapter) {
		
		System.out.println(ft + " : " + chapter);
		
		JSONParser parser = new JSONParser();

		System.out.println("커스텀 스크린");

       try {
              // myJson.json파일을 읽어와 Object로 파싱 \FairyTales\49\1\json
       	String link = "C:\\FairyTales\\" + ft + "\\" + chapter + "\\chapter.json";
       	String objft = "C:\\FairyTales\\" + ft + "\\" + chapter + "\\objList.json";
       	String example = "C:\\FairyTales\\" + ft + "\\" + chapter + "\\example.json";
       	String anwser = "C:\\FairyTales\\" + ft + "\\" + chapter + "\\anwser.json";
       	
       	System.out.println(ft + " : " + chapter);
              Object obj1 = parser.parse(new FileReader(link));
              Object obj2 = parser.parse(new FileReader(objft));
              Object obj3 = parser.parse(new FileReader(example));
              Object obj4 = parser.parse(new FileReader(anwser));
              
              JSONObject jsonObject1 =(JSONObject) obj1;
              //JSONObject jsonObject2 =(JSONObject) obj2;
              // list가져오기
            
              JSONArray msgList1 =(JSONArray) jsonObject1.get("screen");

              //JSONArray msgList2 =(JSONArray) jsonObject2.get("objId");
              //JSONArray msgList3 =(JSONArray) jsonObject2.get("obj");
              System.out.println(msgList1.size());
              
              for(int i = 0 ; i < msgList1.size();i++) {
           	   System.out.println(msgList1.get(i));
           	  
              }
              System.out.println(obj2);
          	   System.out.println(obj3);
          	   System.out.println(obj4);
          	   System.out.println(obj1);
          	   
              model.addAttribute("playlist", msgList1);	//붙임
              model.addAttribute("objList", obj2);
              model.addAttribute("questionList", obj3);
              model.addAttribute("answerList", obj4);
              model.addAttribute("someList", obj1);
 
              System.out.println("**JsonList**");

             /* while(iterator.hasNext()) {

                     System.out.println(iterator.next());

              }*/

       } catch (Exception e) {

              e.printStackTrace();

       }
       
		return "./fairy/3high/cendrillon/screen3";
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
		
		System.out.println("answer_list : " + answer_list);
		
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
	
	@ResponseBody
	@RequestMapping(value = "/editor_answer", method = RequestMethod.POST)	//빈칸 1개짜리 받는곳
	public String editor_answer(String answer) {
		
		String[] st = answer.split(",");
		System.out.println("혼자값 : " + answer);
		
		return "1";
	}
}
