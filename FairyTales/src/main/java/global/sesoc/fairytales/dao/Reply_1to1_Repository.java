package global.sesoc.fairytales.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.fairytales.dto.Reply_1to1;

/**
 * 
 * 1대1 게시판 답글 레파지토리
 * 
 * @author CHEON
 *
 */

@Repository
public class Reply_1to1_Repository {

	@Autowired
	SqlSession session;

	// 리플 전체 출력
	public List<Reply_1to1> reply_list(int board_num) {

		Reply_1to1Mapper mapper = session.getMapper(Reply_1to1Mapper.class);
		Reply_1to1 reply_1to1 = new Reply_1to1();
		reply_1to1.setBoard_num(board_num);
		List<Reply_1to1> reply_list = mapper.reply_list(reply_1to1);

		return reply_list;
	}

	// 리플 등록
	public int insert_reply_1to1(Reply_1to1 reply_1to1) {

		Reply_1to1Mapper mapper = session.getMapper(Reply_1to1Mapper.class);
		return mapper.insert_reply_1to1(reply_1to1);

	}

	// 리플 삭제
	public int delete_reply_1to1(Reply_1to1 reply_1to1) {

		Reply_1to1Mapper mapper = session.getMapper(Reply_1to1Mapper.class);
		return mapper.delete_reply_1to1(reply_1to1);
	}

	// 리플 업데이트
	public int update_reply_1to1(Reply_1to1 reply_1to1) {
		Reply_1to1Mapper mapper = session.getMapper(Reply_1to1Mapper.class);
		return mapper.update_reply_1to1(reply_1to1);
	}

}
