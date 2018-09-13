package global.sesoc.fairytales.dao;

import java.util.List;

public interface ChartMapper {

//전체 진행률
public int allProgress(String user_id);

//일본어 전체 진행률
public int jpnAllProgress(String user_id);

//자바 전체 진행률

//레벨별 진행도
public int levelProgress(String user_id);

//동화별 진행도
public int fairyProgress(String user_id);
	
//전체문제수
public int allQuestion(String user_id);
	
//오답수
public int wrongQuestion(String user_id);
	
//이번달 출석횟수
public int attendThisMon(String user_id);

//지난달 전 출석횟수
public int oneMonAttend(String user_id);

//2개월 전 출석횟수
public int twoMonAttend(String user_id);

//3개월 전 출석횟수
public int threeMonAttend(String user_id);

//4개월 전 출석횟수
public int fourMonAttend(String user_id);

//5개월 전 출석횟수
public int fiveMonAttend(String user_id);

//6개월 전 출석횟수
public int sixMonAttend(String user_id);
}
