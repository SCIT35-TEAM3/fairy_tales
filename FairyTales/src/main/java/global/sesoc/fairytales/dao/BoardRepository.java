package global.sesoc.fairytales.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.fairytales.dto.Board;
import global.sesoc.fairytales.dto.Board_1to1;



@Repository
public class BoardRepository {

	@Autowired
	SqlSession session;

	public List<Board> selectAll(String searchItem, String searchWord,int startRecord, int countPerPage) {
		RowBounds rb = new RowBounds(startRecord,countPerPage);	//
		
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		
		Map<String, String> map = new HashMap<>();//Object를 받는 이유 String,int이기 때문
		
		map.put("searchItem",searchItem);
		map.put("searchWord",searchWord);
		List<Board> list = mapper.selectAll(map,rb);
		return list;
	}

	public Board selectOne(int board_num) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		Board selectOne = mapper.selectOne(board_num);
		return selectOne;
	}
	public int insert(Board board) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		int insertwrite = mapper.insert(board);
		return insertwrite;
	}
	
	public int delete(int boardnum) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		int delete = mapper.delete(boardnum);
		return delete;
	}
	
	public int update(Board board) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		int update = mapper.update(board);
		return update;
	}
	
	public int updateHitcount(Board board) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		int update = mapper.updateHitcount(board);
		return update;
	}

	//전체 글개수 조회
		public int getTotalBoard(String searchItem, String searchWord) {
			BoardMapper mapper = session.getMapper(BoardMapper.class);
			
			Map<String, String> map = new HashMap<>();
			
			map.put("searchItem", searchItem);
			map.put("searchWord", searchWord);
			
			
			int Count = mapper.getTotalBoard(map);
			return Count;
		}
		
		
		// 메인 페이징을 위한 전체 리스트
		public int main_getTotalBoard(String searchItem, String searchWord) {

			BoardMapper mapper = session.getMapper(BoardMapper.class);
			Map<String, String> map = new HashMap<>();
			map.put("searchItem", searchItem);
			map.put("searchWord", searchWord);

			return mapper.getTotalBoard(map);

		}

		// 메인 페이징을 위한 전체 리스트
		public List<Board> mainSelect(String searchItem, String searchWord, int startRecord, int countPerPage) {
			RowBounds rb = new RowBounds(startRecord, countPerPage);
			BoardMapper mapper = session.getMapper(BoardMapper.class);

			Map<String, String> map = new HashMap<>();

			map.put("searchItem", searchItem);
			map.put("searchWord", searchWord);

			return mapper.mainSelect(map, rb);
		}

		
		

}

