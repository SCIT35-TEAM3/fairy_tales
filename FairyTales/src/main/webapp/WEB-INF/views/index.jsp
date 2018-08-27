<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<!-- 로그인 전  -->
	<c:if test="${sessionScope.loginid == null}">
		<a href="join">회원가입</a>
		<br />
		<a href="login">로그인</a>
	</c:if>

	<!-- 회원 로그인 후-->
	<c:if test="${sessionScope.loginid != null}">
	${sessionScope.loginname}님, <a href="logout">로그아웃</a><br/>
	<a href="my_info_detail">마이페이지</a>
		<br />
		<a href="board_list">게시판</a>
	</c:if>
 
	<br/>
	
</body>
</html>

