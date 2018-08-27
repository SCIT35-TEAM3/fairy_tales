package global.sesoc.fairytales.dao;

import java.util.List;

import global.sesoc.fairytales.dto.Reply_1to1;

/**
 * 
 * 1대1 게시판 답글 매퍼
 * 
 * @author CHEON
 *
 */

public interface Reply_1to1Mapper {

	public List<Reply_1to1> reply_list(Reply_1to1 reply_1to1); // 리플 전체 출력

	public int insert_reply_1to1(Reply_1to1 reply_1to1); // 답글 등록

	public int update_reply_1to1(Reply_1to1 reply_1to1); // 답글 수정

	public int delete_reply_1to1(Reply_1to1 reply_1to1); // 답글 삭제

}
