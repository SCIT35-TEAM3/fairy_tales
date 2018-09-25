package global.sesoc.fairytales.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChartRepository {

	@Autowired SqlSession sqlsession;
	
	//일본어 전체 챕터
	public Integer jpnChapter() {
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class);
		Integer result = chartmapper.jpnChapter();
		
		return result;
	}
		
	//일본어 진행 챕터
	public Integer jpnProgressed(String user_id) {
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class);
		Integer result = chartmapper.jpnProgressed(user_id);
		
		return result;
	}
		
	//JAVA 전체 챕터
	public Integer javaChapter() {
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class);
		Integer result = chartmapper.javaChapter();
		
		return result;
	}
		
	//JAVA 진행 챕터
	public Integer javaProgressed(String user_id) {
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class);
		Integer result = chartmapper.javaProgressed(user_id);
		
		return result;
	}
		
	//일본어 레벨별 진행 챕터
	public List<Integer> jpnLevelProgress(String user_id) {
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class);
		List<Integer> result = chartmapper.jpnLevelProgress(user_id);
				
		return result;
	}

	//JAVA 레벨별 챕터
	public List<Integer> javaLevelProgress(String user_id) {
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class);
		List<Integer> result = chartmapper.javaLevelProgress(user_id);
		
		return result;
	}

	//일본어 동화별 진행 챕터
	public List<Integer> jpnFairyProgress(String user_id){
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class);
		List<Integer> result = chartmapper.jpnFairyProgress(user_id);
		
		return result;
	}

	//JAVA 동화별 진행 챕터
	public List<Integer> javaFairyProgress(String user_id){
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class);
		List<Integer> result = chartmapper.javaFairyProgress(user_id);
		
		return result;
	}
		
	//일본어 문제수
	public Integer jpnQuestion() {
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class);
		Integer result = chartmapper.jpnQuestion();
		
		return result;
	}

	//JAVA 문제수
	public Integer javaQuestion() {
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class);
		Integer result = chartmapper.javaQuestion();
		
		return result;
	}
		
	//일본어 오답수
	public Integer jpnWrong(String user_id) {
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class);
		Integer result = chartmapper.jpnWrong(user_id);
		
		return result;
	}

	//JAVA 오답수
	public Integer javaWrong(String user_id) {
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class);
		Integer result = chartmapper.javaWrong(user_id);
		
		return result;
	}
	
	//일본어 레벨별 문제수
	public List<Integer> jpnLevelQuestion() {
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class);
		List<Integer> result = chartmapper.jpnLevelQuestion();
		
		return result;
	}

	//JAVA 레벨별 문제수
	public List<Integer> javaLevelQuestion() {
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class);
		List<Integer> result = chartmapper.javaLevelQuestion();
		
		return result;
	}

	//일본어 레벨별 오답수
	public List<Integer> jpnLevelWrong(String user_id) {
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class);
		List<Integer> result = chartmapper.jpnLevelWrong(user_id);
		
		return result;
	}

	//JAVA 레벨별 오답수
	public List<Integer> javaLevelWrong(String user_id) {
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class);
		List<Integer> result = chartmapper.javaLevelWrong(user_id);
		
		return result;
	}
		
	//이번달 출석횟수
	public Integer attendThisMon(String user_id) {
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class); 
		Integer result = chartmapper.attendThisMon(user_id);
		
		return result;
	}

	//지난달 전 출석횟수
	public Integer oneMonAttend(String user_id) {
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class); 
		Integer result = chartmapper.oneMonAttend(user_id);
		
		return result;
	}

	//2개월 전 출석횟수
	public Integer twoMonAttend(String user_id) {
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class); 
		Integer result = chartmapper.twoMonAttend(user_id);
		
		return result;
	}

	//3개월 전 출석횟수
	public Integer threeMonAttend(String user_id) {
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class); 
		Integer result = chartmapper.threeMonAttend(user_id);
		
		return result;
	}

	//4개월 전 출석횟수
	public Integer fourMonAttend(String user_id) {
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class); 
		Integer result = chartmapper.fourMonAttend(user_id);
		
		return result;
	}

	//5개월 전 출석횟수
	public Integer fiveMonAttend(String user_id) {
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class); 
		Integer result = chartmapper.fiveMonAttend(user_id);
		
		return result;
	}

	//6개월 전 출석횟수
	public Integer sixMonAttend(String user_id) {
		ChartMapper chartmapper = sqlsession.getMapper(ChartMapper.class); 
		Integer result = chartmapper.sixMonAttend(user_id);
		
		return result;
	}
	
}
