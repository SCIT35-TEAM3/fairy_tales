package global.sesoc.fairytales.dao;

import global.sesoc.fairytales.dto.Member;

public interface MemberMapper {
	
	//회원가입
	public int insert(Member member);

	//로그인,id 중복확인
	public Member selectOne(Member member);
	
	//회원정보수정
	public int update(Member member);
	
	//이메일 중복확인
	public String emailcheck(String user_email);
	
	//출석확인
	public int insert_access(Member member);
	
	
}
