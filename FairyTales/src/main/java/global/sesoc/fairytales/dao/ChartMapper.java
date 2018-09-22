package global.sesoc.fairytales.dao;

import java.util.List;

public interface ChartMapper {

//일본어 전체 챕터
public int jpnChapter();
	
//일본어 진행 챕터
public int jpnProgressed(String user_id);
	
//JAVA 전체 챕터
public int javaChapter();
	
//JAVA 진행 챕터
public int javaProgressed(String user_id);

//일본어 레벨별 진행 챕터
public List<Integer> jpnLevelProgress(String user_id);

//JAVA 레벨별 진행 챕터
public List<Integer> javaLevelProgress(String user_id);

//일본어 동화별 진행 챕터
public List<Integer> jpnFairyProgress(String user_id);

//JAVA 동화별 진행 챕터
public List<Integer> javaFairyProgress(String user_id);
	
//일본어 문제수
public int jpnQuestion();

//JAVA 문제수
public int javaQuestion();
	
//일본어 오답수
public int jpnWrong(String user_id);

//JAVA 오답수
public int javaWrong(String user_id);

//일본어 레벨별 문제수
public List<Integer> jpnLevelQuestion();

//JAVA 레벨별 문제수
public List<Integer> javaLevelQuestion();

//일본어 레벨별 오답수
public List<Integer> jpnLevelWrong(String user_id);

//JAVA 레벨별 오답수
public List<Integer> javaLevelWrong(String user_id);
	
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
