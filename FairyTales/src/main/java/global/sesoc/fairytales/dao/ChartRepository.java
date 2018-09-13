package global.sesoc.fairytales.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChartRepository {

	@Autowired SqlSession sqlsession;
	
	//전체 진행율
	public int allProgress(String user_id) {
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class); 
		int result = chartmapper.allProgress(user_id);
		
		return result;
	}
	
	//일본어 전체 진행율
	public int jpnAllProgress(String user_id) {
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class); 
		int result = chartmapper.jpnAllProgress(user_id);
		
		return result;
	}
		
	//레벨별 진행도
	public int levelProgress(String user_id) {
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class); 
		int result = chartmapper.levelProgress(user_id);
		
		return result;
	}

	//동화별 진행도
	public int fairyProgress(String user_id) {
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class); 
		int result = chartmapper.fairyProgress(user_id);
		
		return result;
	}
		
	//전체문제수
	public int allQuestion(String user_id) {
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class); 
		int result = chartmapper.allQuestion(user_id);
		
		return result;
		
	}
		
	//오답수
	public int wrongQuestion(String user_id) {
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class); 
		int result = chartmapper.wrongQuestion(user_id);
		
		return result;
		
	}
		
	//이번달 출석횟수
	public int attendThisMon(String user_id) {
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class); 
		int result = chartmapper.attendThisMon(user_id);
		
		return result;
	}

	//지난달 전 출석횟수
	public int oneMonAttend(String user_id) {
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class); 
		int result = chartmapper.oneMonAttend(user_id);
		
		return result;
	}

	//2개월 전 출석횟수
	public int twoMonAttend(String user_id) {
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class); 
		int result = chartmapper.twoMonAttend(user_id);
		
		return result;
	}

	//3개월 전 출석횟수
	public int threeMonAttend(String user_id) {
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class); 
		int result = chartmapper.threeMonAttend(user_id);
		
		return result;
	}

	//4개월 전 출석횟수
	public int fourMonAttend(String user_id) {
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class); 
		int result = chartmapper.fourMonAttend(user_id);
		
		return result;
	}

	//5개월 전 출석횟수
	public int fiveMonAttend(String user_id) {
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class); 
		int result = chartmapper.fiveMonAttend(user_id);
		
		return result;
	}

	//6개월 전 출석횟수
	public int sixMonAttend(String user_id) {
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class); 
		int result = chartmapper.sixMonAttend(user_id);
		
		return result;
	}
	
}
