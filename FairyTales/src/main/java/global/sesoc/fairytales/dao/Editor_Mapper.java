package global.sesoc.fairytales.dao;


import java.util.List;

import global.sesoc.fairytales.dto.Fairytales;

/**
 * 동화
 * @author Hyunil
 *
 */
public interface Editor_Mapper {
	
	//동화 넣기
	public int insert_editor(Fairytales fairytales);
	//동화 가져오기
	public List<Fairytales> selectFairytales();
	//동화 수정
	public int update_editor(Fairytales fairytales);
	//동화 삭제
	public int delete_editor(Integer fairy_pk);
}
