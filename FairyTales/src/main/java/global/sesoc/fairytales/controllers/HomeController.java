package global.sesoc.fairytales.controllers;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	/*
	@Autowired
	testRepository repository;
	*/
	
	/* 셈플입니다 새로운 Controller를 만들어 사용해주세요 !! */
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest request, HttpSession session) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		// contextPath
		String contextPath = request.getContextPath();
		model.addAttribute("contextPath", contextPath );
		
		// session
		session.setAttribute("Team3", "남정임, 박가원, 이준범, 천리성, 백현일");
		
		return "home";
	}
	
	/**
	 * Ajax
	 * @param word
	 * @return String
	 */
	@ResponseBody
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String home(@RequestBody String word) {
		logger.info("word >|" + word + "|");
		return word + " OK";
	}
	
	
	/**
	 * 화면을 거치지 않고 다른 컨트롤러에 존재하는 RequestMapping으로 이동시
		RedirectAttributes를 이용해 속성을 만들어 값을 넘겨주기
	 * @param rttr
	 * @return
	 */
	//@RequestMapping(value="/testtest", method=RequestMethod.POST)
	public String testtest(RedirectAttributes rttr) {
		
		/* /dtail 로 boardnum라는 속성값을 넘겨줌 /dtail에는 boardnum라는 속성을 받을 준비가 되어있어야함*/
		rttr.addAttribute("boardnum", "넘겨줄 값");
		
		/* 컨트롤러에 존재하는 /dtail로 이동 예시이므로 이 프로젝트 컨트롤러에는 존재하지 않습니다.*/
		return "redirect:/detail";
	}
	
	
	/* 셈플입니다 새로운 Controller를 만들어 사용해주세요 !! */
	
	//남정임
		@RequestMapping(value = "/index", method = RequestMethod.GET)
		public String index() {
		
			return "/index";
		}
}
