package global.sesoc.fairytales.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.fairytales.dao.Reply_1to1_Repository;
import global.sesoc.fairytales.dto.Reply_1to1;

@Controller
public class ReplyController {

	@Autowired
	Reply_1to1_Repository repository;

	// 리플 전체리스트 출력
	@ResponseBody
	@RequestMapping(value = "reply_list", method = RequestMethod.POST)
	public List<Reply_1to1> reply_list(int board_num) {
		List<Reply_1to1> reply_list = repository.reply_list(board_num);

		return reply_list;
	}

	// 리플 작성
	@ResponseBody
	@RequestMapping(value = "reply_write", method = RequestMethod.POST)
	public Integer insert_reply(@RequestBody Reply_1to1 reply_1to1) {
		reply_1to1.setReply_title("aaa");
		return repository.insert_reply_1to1(reply_1to1);

	}

	// 리플 삭제
	@ResponseBody
	@RequestMapping(value = "reply_delete")
	public Integer reply_delete(int reply_num) {

		Reply_1to1 reply_1to1 = new Reply_1to1();
		reply_1to1.setReply_num(reply_num);
		return repository.delete_reply_1to1(reply_1to1);
	}

	// 리플 수정
	@ResponseBody
	@RequestMapping(value = "reply_update", method = RequestMethod.POST)
	public Integer reply_update(@RequestBody Reply_1to1 reply_1to1) {
		
		System.out.println(">>>>>>>UPUPUP");

		return repository.update_reply_1to1(reply_1to1);
	}

}
