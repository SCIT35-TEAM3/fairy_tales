package global.sesoc.fairytales.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.fairytales.dto.Board_1to1;

/**
 * 
 * 1대1 게시판 레파지토리
 * 
 * @author CHEON
 *
 */
@Repository
public class Board_1to1_Repository {

	@Autowired
	SqlSession session;

	// 글 등록
	public int insert_board_1to1(Board_1to1 board_1to1) {
		Board_1to1Mapper mapper = session.getMapper(Board_1to1Mapper.class);
		int result = mapper.insert_board_1to1(board_1to1);
		return result;
	}

	// 글 리스트
	public List<Board_1to1> select_all_board_1to1() {
		Board_1to1Mapper mapper = session.getMapper(Board_1to1Mapper.class);
		List<Board_1to1> board_list = mapper.select_all_board_1to1();

		return board_list;
	}

	// 글 선택
	public Board_1to1 select_one_board_1to1(Board_1to1 board_1to1) {
		Board_1to1Mapper mapper = session.getMapper(Board_1to1Mapper.class);
		return mapper.select_one_board_1to1(board_1to1);
	}

	// 글 수정
	public int update_board_1to1(Board_1to1 board_1to1) {
		Board_1to1Mapper mapper = session.getMapper(Board_1to1Mapper.class);

		return mapper.update_board_1to1(board_1to1);
	}

	// 글 삭제
	public int delete_board_1to1(int board_num) {
		Board_1to1Mapper mapper = session.getMapper(Board_1to1Mapper.class);
		return mapper.delete_board_1to1(board_num);
	}

	// 조회수
	public int hitcount(int board_num) {
		Board_1to1Mapper mapper = session.getMapper(Board_1to1Mapper.class);
		return mapper.hitcount(board_num);
	}

	// 페이징을 위한
	public int getTotalBoard(String searchItem, String searchWord) {

		Board_1to1Mapper mapper = session.getMapper(Board_1to1Mapper.class);
		Map<String, String> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchWord", searchWord);

		return mapper.getTotalBoard(map);

	}

	// 페이징을 위한 전체 리스트
	public List<Board_1to1> select(String searchItem, String searchWord, int startRecord, int countPerPage) {
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		Board_1to1Mapper mapper = session.getMapper(Board_1to1Mapper.class);

		Map<String, String> map = new HashMap<>();

		map.put("searchItem", searchItem);
		map.put("searchWord", searchWord);

		return mapper.select(map, rb);
	}

}
