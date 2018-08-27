package global.sesoc.fairytales.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.fairytales.dto.Board_1to1;

/**
 * 
 * 1대1 게시판 매퍼
 * 
 * @author CHEON
 *
 */
public interface Board_1to1Mapper {

	public int insert_board_1to1(Board_1to1 board_1to1); // 글 등록

	public List<Board_1to1> select_all_board_1to1(); // 전체 글 출력

	public Board_1to1 select_one_board_1to1(Board_1to1 board_1to1); // 게시글 하나 출력

	public int update_board_1to1(Board_1to1 board_1to1); // 글 수정

	public int delete_board_1to1(int boardnum); // 글 삭제

	public int hitcount(int board_num); // 조회수

	public int getTotalBoard(Map<String, String> map); // 글전체와 페이징

	public List<Board_1to1> select(Map<String, String> map, RowBounds rb); // 페이징
}
