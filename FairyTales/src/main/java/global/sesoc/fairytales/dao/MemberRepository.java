package global.sesoc.fairytales.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.fairytales.dto.Member;



@Repository
public class MemberRepository {

	@Autowired
	SqlSession session;

	// 회원가입
	public int join(Member member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		int insert = mapper.insert(member);
		return insert;
	}

	// 로그인
	public Member selectOne(Member member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		Member selectOne = mapper.selectOne(member);
		return selectOne;
	}

	// 회원정보수정
	public int update(Member member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		int result = mapper.update(member);
		return result;
	}
	
	
	
	 /*
	// 이메일 중복확인
	    public Map<String, String> emailcheck(String user_email) {
	        Map<String, String> jsonObj = new HashMap<String, String>();
	 
	        MemberMapper mapper = session.getMapper(MemberMapper.class);
	        String emailcheck = mapper.emailcheck(user_email);
	 
	        if (emailcheck != null) {
	            jsonObj.put("chk", "-1");
	        } else {
	            jsonObj.put("chk", "1");
	        }
	        return jsonObj;
	    }*/
	    

}
