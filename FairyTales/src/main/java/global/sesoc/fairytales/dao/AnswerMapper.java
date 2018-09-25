package global.sesoc.fairytales.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.fairytales.dto.Board;
import global.sesoc.fairytales.dto.Board_1to1;
import global.sesoc.fairytales.dto.SinScreen;

public interface AnswerMapper {

	String selectAnswer(SinScreen ss);

	String selectAnswerOne(SinScreen ss);
	
}