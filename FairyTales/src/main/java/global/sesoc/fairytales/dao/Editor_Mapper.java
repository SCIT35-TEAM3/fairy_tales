package global.sesoc.fairytales.dao;


import java.util.List;

import global.sesoc.fairytales.dto.Fairytales;
import global.sesoc.fairytales.dto.Question;

/**
 * 童話
 * @author Hyunil
 *
 */
public interface Editor_Mapper {
	
	// 童話 登録
	public int insert_editor(Fairytales fairytales);
	// 童話 全体ロード
	public List<Fairytales> selectFairytales();
	// 童話 ロード
	public Fairytales selectFairytales(Fairytales fairy_pk);
	// 童話 修整
	public int update_editor(Fairytales fairytales);
	// 童話 削除
	public int delete_editor(Integer fairy_pk);
	// 問題 削除
	public int delete_question(Question question);
	// 問題 登録
	public int insert_question(Question question);
	// 問題 修整
	public int update_question(Question question);
	
	//童話ロードTestコード
	public List<Fairytales> selectFairytalesC3();
	
}
