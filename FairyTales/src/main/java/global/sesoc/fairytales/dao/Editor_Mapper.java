package global.sesoc.fairytales.dao;


import java.util.List;

import global.sesoc.fairytales.dto.Fairytales;
import global.sesoc.fairytales.dto.Question;

/**
 * 동화
 * @author Hyunil
 *
 */
public interface Editor_Mapper {
	
	//동화 넣기
	public int insert_editor(Fairytales fairytales);
	//동화 가져오기 전체
	public List<Fairytales> selectFairytales();
	//동화 가져오기
	public Fairytales selectFairytales(Fairytales fairy_pk);
	//동화 수정
	public int update_editor(Fairytales fairytales);
	//동화 삭제
	public int delete_editor(Integer fairy_pk);
	//문제 삭제
	public int delete_question(Question question);
	//문제 삽입
	public int insert_question(Question question);
	//문제 수정
	public int update_question(Question question);
	
}
