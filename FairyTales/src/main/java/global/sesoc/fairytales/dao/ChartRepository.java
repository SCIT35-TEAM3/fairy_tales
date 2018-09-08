package global.sesoc.fairytales.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChartRepository {

	@Autowired SqlSession sqlsession;
	
	
}
