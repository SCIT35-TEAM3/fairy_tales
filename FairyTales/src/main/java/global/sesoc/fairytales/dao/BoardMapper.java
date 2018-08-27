package global.sesoc.fairytales.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.fairytales.dto.Board;

public interface BoardMapper {
	public List<Board> selectAll(Map<String, String> map, RowBounds rb);
	public Board selectOne(int board_num);
	public int insert(Board board);
	public int delete(int board_num);
	public int update(Board board);
	public int updateHitcount(Board board);
	public int getTotalBoard(Map<String, String> map);	
	
	
}