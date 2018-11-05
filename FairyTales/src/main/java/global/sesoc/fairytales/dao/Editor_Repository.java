package global.sesoc.fairytales.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.fairytales.dto.Fairytales;
import global.sesoc.fairytales.dto.Question;

/**
 * 에디터
 * @author Hyun
 *
 */
@Repository
public class Editor_Repository {

	@Autowired
	SqlSession session;

	// 童話 登録
	public int insert_editor(Fairytales fairytales) {
		Editor_Mapper mapper = session.getMapper(Editor_Mapper.class);
		int result = mapper.insert_editor(fairytales);
		return result;
	}
	// 童話 全体ロード
	public List<Fairytales> selectFairytales(){
		Editor_Mapper mapper = session.getMapper(Editor_Mapper.class);
		List<Fairytales> result = mapper.selectFairytales();
		return result;
	}
	// 童話 ロード
	public Fairytales selectFairytales(Fairytales fairy_pk){
		Editor_Mapper mapper = session.getMapper(Editor_Mapper.class);
		Fairytales result = mapper.selectFairytales(fairy_pk);
		return result;
	}
	
	// 童話 修整
	public int update_editor(Fairytales fairytales) {
		Editor_Mapper mapper = session.getMapper(Editor_Mapper.class);
		int result = mapper.update_editor(fairytales);
		return result;
	}
	
	// 童話 削除
	public int delete_editor(Integer fairy_pk) {
		Editor_Mapper mapper = session.getMapper(Editor_Mapper.class);
		int result = mapper.delete_editor(fairy_pk);
		return result;
	}
	
	// 問題 削除
	public int delete_question(Question question) {
		Editor_Mapper mapper = session.getMapper(Editor_Mapper.class);
		int result = mapper.delete_question(question);
		return result;
	}
	
	// 問題 登録
	public int insert_question(Question question) {
		Editor_Mapper mapper = session.getMapper(Editor_Mapper.class);
		int result = mapper.insert_question(question);
		return result;
	}
	
	//問題 修整
	public int update_question(Question question) {
		Editor_Mapper mapper = session.getMapper(Editor_Mapper.class);
		int result = mapper.update_question(question);
		return result;
	}
	
	//童話ロードTestコード
	public List<Fairytales> selectFairytalesC3() {
		Editor_Mapper mapper = session.getMapper(Editor_Mapper.class);
		List<Fairytales> result = mapper.selectFairytalesC3();
		return result;
	};
	
	
}
