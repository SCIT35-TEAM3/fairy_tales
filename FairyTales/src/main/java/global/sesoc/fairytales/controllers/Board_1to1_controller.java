package global.sesoc.fairytales.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import global.sesoc.fairytales.dao.Board_1to1_Repository;
import global.sesoc.fairytales.dao.Reply_1to1_Repository;
import global.sesoc.fairytales.dto.Board_1to1;
import global.sesoc.fairytales.util.FileService;
import global.sesoc.fairytales.util.PageNavigator;

/**
 * 1대1 게시판 컨트롤러
 * 
 * @author CHEON
 */

@Controller
public class Board_1to1_controller {

	@Autowired // 리플 레파지토리
	Reply_1to1_Repository reply_repository;
	@Autowired // 보드 레파지토리
	Board_1to1_Repository board_repository;

	final String UPLOADPATH = "/boardfile";

	// 보드 메인화면
	@RequestMapping(value = "/board_1to1")
	public String board_1to1(@RequestParam(value = "searchItem", defaultValue = "user_id") String searchItem,
			@RequestParam(value = "searchWord", defaultValue = "") String searchWord, Model model,
			@RequestParam(value = "currentPage", defaultValue = "0") int currentPage) {

		List<Board_1to1> board_list = board_repository.select_all_board_1to1();
		model.addAttribute("board_list", board_list);

		int totalRecordCount = board_repository.getTotalBoard(searchItem, searchWord);
		System.out.println(totalRecordCount);
		PageNavigator navi = new PageNavigator(currentPage, totalRecordCount);
		List<Board_1to1> list = board_repository.select(searchItem, searchWord, navi.getStartRecord(),
				navi.getCountPerPage());

		model.addAttribute("list", list);
		model.addAttribute("searchItem", searchItem);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("navi", navi);
		model.addAttribute("currentPage", currentPage);

		return "board_1to1";
	}

	// 글쓰기 진입
	@RequestMapping(value = "/write")
	public String write(Model model) {
		model.addAttribute("login_id", "aa");

		return "write";
	}

	// 글 등록
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(Model model, Board_1to1 board_1to1, HttpSession session, MultipartFile upload) {

		board_1to1.setUser_id("aa"); // ■■■■■■■■■■■■ 임시 ■■■■■■■■■■■■
		// board_1to1.setUser_id(String.valueOf(session.getAttribute("login_id")));
		String user_id = (String) session.getAttribute("login_id");

		String origin_file_name = upload.getOriginalFilename();
		String save_file = FileService.saveFile(upload, UPLOADPATH);
		// board_1to1.setUser_id(user_id);
		board_1to1.setOrigin_file_name(origin_file_name);
		board_1to1.setSave_file_name(save_file);

		System.out.println("글쓰기>>>>>>>>>>>" + board_1to1);

		int result = board_repository.insert_board_1to1(board_1to1);

		return "redirect:board_1to1";

	}

	// 상세글 진입
	@Transactional
	@RequestMapping(value = "/post")
	public String post(Model model, int board_num) {
		model.addAttribute("login_id", "aa"); // 시험용
		Board_1to1 board_1to1 = new Board_1to1();
		board_repository.hitcount(board_num);
		board_1to1.setBoard_num(board_num);
		Board_1to1 board_1to12 = board_repository.select_one_board_1to1(board_1to1);
		model.addAttribute("board_1to1", board_1to12);
		return "post";
	}

	// 글 수정
	@RequestMapping(value = "board_update")
	public String update(Board_1to1 board_1to1, Model model, int board_num) {

		System.out.println(">>>>>>>>>>>>>>>>>>>" + board_num);
		Board_1to1 board_1to11 = new Board_1to1();
		board_1to11.setBoard_num(board_num);

		Board_1to1 board_1to12 = board_repository.select_one_board_1to1(board_1to11);
		model.addAttribute("board_1to1", board_1to12);
		return "board_update";

	}

	// 글 수정 완료
	@RequestMapping(value = "board_update", method = RequestMethod.POST)
	public String update(Board_1to1 board_1to1) {
		System.out.println(board_1to1);
		board_1to1.setUser_id("aa");// 임시용
		board_repository.update_board_1to1(board_1to1);

		return "redirect:board_1to1";
	}

	// 글 삭제
	@RequestMapping(value = "board_delete")
	public String delete(int board_num) {
		System.out.println("삭제" + board_num);

		int result = board_repository.delete_board_1to1(board_num);

		return "redirect:board_1to1";

	}

	// 파일 삭제 .
	@RequestMapping(value = "/delete_file", method = RequestMethod.GET)
	public String deleteFile(int board_num, RedirectAttributes red) {

		Board_1to1 board_1to1 = new Board_1to1();
		board_1to1.setBoard_num(board_num);
		Board_1to1 board_1to12 = board_repository.select_one_board_1to1(board_1to1);

		String origin_file = board_1to12.getOrigin_file_name();
		String save_file = board_1to12.getSave_file_name();

		String fullpath = UPLOADPATH + "/" + save_file;

		FileService.deleteFile(fullpath);

		board_1to12.setOrigin_file_name("");
		board_1to12.setSave_file_name("");

		// repository.update(board);

		red.addAttribute("board_num", board_num);
		red.addAttribute("user_id", board_1to12.getUser_id());

		return "redirect:/update";

	}

}
