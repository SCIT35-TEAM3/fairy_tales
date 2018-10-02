package global.sesoc.fairytales.controllers;

import java.io.FileReader;
import java.util.ArrayList;
import java.util.Iterator;
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
public class EditorAddController {
	
	@Autowired // 리플 레파지토리
	AnswerRepository answer_repository;
	
	//window.open("idCheck","newidwindow","top=200,left=300,width=400,height=400,resizable=no");
	@RequestMapping(value = "/custom_screen1", method=RequestMethod.GET)
	public String write(Model model,String sin,String screen) {
		
		JSONParser parser = new JSONParser();

		 System.out.println("커스텀 스크린");

        try {
               // myJson.json파일을 읽어와 Object로 파싱 \FairyTales\49\1\json
        	String link = "C:\\FairyTales\\" + sin + "\\" + screen + "\\text.json";
        	System.out.println(sin + " : " + screen);
               Object obj = parser.parse(new FileReader(link));
               

               JSONObject jsonObject =(JSONObject) obj;

               // list가져오기

               JSONArray msgList =(JSONArray) jsonObject.get("screen");
               System.out.println(msgList.size());
               
               for(int i = 0 ; i < msgList.size();i++) {
            	   System.out.println(msgList.get(i));
               }
               model.addAttribute("playlist", msgList);

               System.out.println("**JsonList**");

              /* while(iterator.hasNext()) {

                      System.out.println(iterator.next());

               }*/

        } catch (Exception e) {

               e.printStackTrace();

        }
		//model.addAttribute(attributeName, attributeValue);
		return "1";
	}
}
