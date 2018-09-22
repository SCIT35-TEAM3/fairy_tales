package global.sesoc.fairytales.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.fairytales.dto.Fairytales;

/**
 * 에디터
 * @author Hyun
 *
 */
@Repository
public class Editor_Repository {

	@Autowired
	SqlSession session;

	// 동화 등록
	public int insert_editor(Fairytales fairytales) {
		Editor_Mapper mapper = session.getMapper(Editor_Mapper.class);
		int result = mapper.insert_editor(fairytales);
		return result;
	}
	// 동화 전체 가져오기 전체
	public List<Fairytales> selectFairytales(){
		Editor_Mapper mapper = session.getMapper(Editor_Mapper.class);
		List<Fairytales> result = mapper.selectFairytales();
		return result;
	}
	// 동화 전체 가져오기
	public Fairytales selectFairytales(Fairytales fairy_pk){
		Editor_Mapper mapper = session.getMapper(Editor_Mapper.class);
		Fairytales result = mapper.selectFairytales(fairy_pk);
		return result;
	}
	
	// 동화 등록
	public int update_editor(Fairytales fairytales) {
		Editor_Mapper mapper = session.getMapper(Editor_Mapper.class);
		int result = mapper.update_editor(fairytales);
		return result;
	}
	
	// 동화 삭제
	public int delete_editor(Integer fairy_pk) {
		Editor_Mapper mapper = session.getMapper(Editor_Mapper.class);
		int result = mapper.delete_editor(fairy_pk);
		return result;
	}
}
