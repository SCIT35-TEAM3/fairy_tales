package global.sesoc.fairytales.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.fairytales.dao.BoardRepository;
import global.sesoc.fairytales.dto.Board;
import global.sesoc.fairytales.util.PageNavigator;


@Controller
public class Board_noticeController {


	@Autowired
	BoardRepository repository;

	@RequestMapping(value = "/board_list", method = RequestMethod.GET)
	public String board_list(Model model, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			// null값 자동 생성, 데이터가 안들어 왔을 경우 기본값 userid
			@RequestParam(value = "searchItem", defaultValue = "userid") String searchItem,
			// null값 자동 생성, 데이터가 안들어 왔을 경우 기본값 ""
			@RequestParam(value = "searchWord", defaultValue = "") String searchWord) {

		int totalRecordCount = repository.getTotalBoard(searchItem, searchWord);
		PageNavigator navi = new PageNavigator(currentPage, totalRecordCount);
		List<Board> list = repository.selectAll(searchItem, searchWord, navi.getStartRecord(), navi.getCountPerPage());

		System.out.println(list.size());
		model.addAttribute("list", list);
		model.addAttribute("searchItem", searchItem);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("navi", navi);

		return "board_notice/board_list";
	}

	@RequestMapping(value = "/boardWrite", method = RequestMethod.GET)
	public String boardWrite() {

		return "board_notice/boardWrite";
	}

	@RequestMapping(value = "/boardWrite", method = RequestMethod.POST)
	public String boardWrite(Board board, HttpSession session, MultipartFile upload) {
		System.out.println(board);
		repository.insert(board);
		return "redirect:/board_list";
	}

	@RequestMapping(value = "/boardDetail", method = RequestMethod.GET)
	public String boardDetail(Model model, Board board) {
		/*
		 * if (!model.containsAttribute("hit")) { int updateHitcount =
		 * repository.updateHitcount(board); Board boarddetail =
		 * repository.selectOne(board.getBoard_num());
		 * 
		 * model.addAttribute("boarddetail", boarddetail);
		 * 
		 * }
		 */
		int updateHitcount = repository.updateHitcount(board);
		Board boarddetail = repository.selectOne(board.getBoard_num());

		model.addAttribute("boarddetail", boarddetail);
		return "board_notice/boardDetail";
	}

	@RequestMapping(value = "/boardDelete", method = RequestMethod.GET)
	public String boardDelete(int board_num) {

		// repository.selectOne(board_num);

		repository.delete(board_num);
		return "redirect:/board_list";
	}

	@RequestMapping(value = "/boardUpdate", method = RequestMethod.GET)
	public String boardUpdate(int board_num, Model model) {
		Board board = repository.selectOne(board_num);
		model.addAttribute("board", board);

		return "board_notice/boardUpdate";
	}

	@RequestMapping(value = "/boardUpdate", method = RequestMethod.POST)
	public String boardUpdate(Board board, Model model) {
		int boardnum = board.getBoard_num();
		int update = repository.update(board);// 수정을 한 다음
		System.out.println(update);

		// model.addAttribute("hit", "hit");
		String result = boardDetail(model, board);

		return result;
		// return "redirect:/boardlist";
	}
}
