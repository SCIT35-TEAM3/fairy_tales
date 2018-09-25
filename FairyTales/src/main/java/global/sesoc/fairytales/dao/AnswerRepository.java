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
import global.sesoc.fairytales.dto.SinScreen;



@Repository
public class AnswerRepository {

	@Autowired
	SqlSession session;
	
	public String getAnswer(SinScreen ss) {
		
		AnswerMapper mapper = session.getMapper(AnswerMapper.class);
		
		System.out.println(ss);
		String list = mapper.selectAnswer(ss);
		System.out.println(list);
		return list;
	}
	
	public String getAnswer_one(SinScreen ss) {
		
		AnswerMapper mapper = session.getMapper(AnswerMapper.class);
		
		System.out.println(ss);
		String list = mapper.selectAnswerOne(ss);
		System.out.println(list);
		return list;
	}
	
}

