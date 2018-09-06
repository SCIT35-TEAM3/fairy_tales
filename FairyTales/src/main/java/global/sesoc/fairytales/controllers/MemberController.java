package global.sesoc.fairytales.controllers;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.fairytales.dao.MemberRepository;
import global.sesoc.fairytales.dto.Member;



@Controller
public class MemberController {

	@Autowired
	MemberRepository repository;

	// index.jsp에 join(회원가입) 요청
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {

		System.out.println("join 정상작동");

		return "member/join";
	}

	// 회원가입
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(Member member) {
		System.out.println("가입 완료" + member);
		repository.join(member);

		return "redirect:/";

	}

	// id중복체크
	@RequestMapping(value = "id_check", method = RequestMethod.POST)
	public @ResponseBody String id_check(Member member) {
		// System.out.println(member);
		Member m = repository.selectOne(member);

		if (m != null)
			return "1"; // 사용 불가능한 아이디
		else
			return "0"; // 사용 가능한 아이디
	}

	/*
	 * //email중복체크
	 * 
	 * @RequestMapping(value="email_check", method=RequestMethod.POST)
	 * public @ResponseBody String email_check(Member member) {
	 * System.out.println(member); Member m = repository.selectOne(member);
	 * 
	 * if(m != null) return "1"; // 사용 불가능한 email else return "0"; // 사용 가능한 email }
	 */

	// index.jsp에 login(로그인) 요청
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {

		System.out.println("login 정상작동");

		return "member/login";
	}

	// login(로그인) 요청
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Member member, Model model, HttpSession session) {
		Member m = repository.selectOne(member);

		if (m != null) {
			session.setAttribute("loginid", m.getUser_id());
			session.setAttribute("loginname", m.getUser_name());
			session.setAttribute("user_level", m.getUser_level());
			return "redirect:/";

		} else {
			model.addAttribute("message", "해당 아이디나 비밀번호가 없습니다.");
			return "member/login";
		}

	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "home";
	}

	// 마이페이지 요청
	@RequestMapping(value = "/my_info_detail", method = RequestMethod.GET)
	public String my_info_detail(Model model, HttpSession session) {
		// 로그인이 되어있는 session의 값을 받아와야한다.
		String userid = (String) session.getAttribute("loginid");

		Member member = new Member();
		member.setUser_id(userid);
		Member detail = repository.selectOne(member);
		System.out.println("my_info_detail 정상작동" + detail);
		model.addAttribute("memberdetail", detail);
		return "member/my_info_detail";
	}
	
	// 회원정보수정 - 페이지요청
	@RequestMapping(value = "/my_info_update", method = RequestMethod.GET)
	public String my_info_update(Model model, HttpSession session) {
		
		String detail = my_info_detail(model,session);
		System.out.println("my_info_update 페이지 열림");
	
		return "member/my_info_update";
	}
	
	// 회원정보수정 
	@RequestMapping(value = "/my_info_update", method = RequestMethod.POST)
	public @ResponseBody String my_info_update(Member member) {
	
		System.out.println(member);
		int update = repository.update(member);// 수정을 한 다음
		if (update == 1)
			return "ok";
		else
			return "no";
	}
	
	@RequestMapping(value="gomain",method=RequestMethod.GET)
	public String gomain() {
		System.out.println("method 접근");
		return"redirect: /";
	}
	
	@RequestMapping(value = "/pwCheck", method = RequestMethod.POST)
	public @ResponseBody String password_check(Member member) {
		System.out.println(member);
		Member m = repository.selectOne(member);
		
		if(m!=null) {
			//비번 일치
			 return "true";
		}
		//비번 불일치
		return "false";
	}
	
	//통계 페이지로 이동
	@RequestMapping(value="/my_chart_page", method = RequestMethod.GET)
	public String my_chart_page() {
		
		return "member/my_chart_page";
	}
	
	

	/*
	 * // 중복확인(이메일)
	 * 
	 * @RequestMapping(value = "/emailcheck", method = RequestMethod.GET)
	 * public @ResponseBody Map<String, String> emailAuth(@RequestParam("email")
	 * String email) { return repository.emailcheck(email); }
	 */

	/*
	 * //회원정보수정
	 * 
	 * @RequestMapping(value = "/memberUpdate", method = RequestMethod.POST) public
	 * String memberUpdate(Member member, Model model) { String user =
	 * member.getUser_id(); int update = repository.update(member);// 수정을 한 다음
	 * System.out.println(update);
	 * 
	 * // model.addAttribute("hit", "hit"); String result = boardDetail(model,
	 * member);
	 * 
	 * return result; // return "redirect:/boardlist"; }
	 */

}
