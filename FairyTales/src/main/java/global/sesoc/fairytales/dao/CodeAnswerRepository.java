package global.sesoc.fairytales.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.fairytales.dto.Code;




@Repository
public class CodeAnswerRepository {

	@Autowired
	SqlSession session;
	
	public String getAnswer(Code c) {
		
		CodeAnswerMapper mapper = session.getMapper(CodeAnswerMapper.class);
		
		String list = mapper.selectAnswer(c);
		System.out.println(list);
		return list;
	}
	
	
}

