<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1to1 Board</title>
</head>
<script type="text/javascript" src="resources/js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	
</script>

<body>
	<div class="left">
		<h2>1:1 질문 게시판</h2>
	</div>
	<!-- 1대1 게시판 -->
	<table cellpadding="0" cellspacing="0" class="table_myroom margin_top5"
		width="100%" summary="1대1 상담내역 테이블로 일자,종류,제목,답변상태를 확인 하실 수 있습니다.">
		<caption>1대1 문의 게시판</caption>
		<colgroup>
			<col width="12%">
			<col width="20%">
			<col width="*">
			<col width="12%">
			<col width="12%">
		</colgroup>

		<tbody>
			<tr>
				<th scope="col" class="first">일자</th>
				<th scope="col">작성자</th>
				<th scope="col">제목</th>
				<th scope="col">조회수</th>
				
			</tr>
			<c:forEach var="board" items="${board_list}" varStatus="s">
				<tr>
					<td class="first">${board.new_date}</td>
					<td>${board.user_id}</td>
					<td class="align_left01"><a
						href="post?board_num=${board.board_num}" onclick="">${board.title}</a></td>
					<td></td>
				
				</tr>

			</c:forEach>

		</tbody>

	</table>
<a href="write">글쓰기</a>
	<form class="right" action="board_1to1" method="get">
		<select name="searchItem">
			<option value="user_id" ${searchItem=='user_id'?'selected':''}>작성자</option>
			<option value="title" ${searchItem=='title'?'selected':''}>제목</option>
			<option value="text" ${searchItem=='text'?'selected':''}>내용</option>
		</select> <input type="text" name="searchWord" value="${searchWord}" /> <input
			type="submit" value="검색" />
	</form>

	<div class="boardfooter">
		<a
			href="board_1to1?currentPage=${navi.currentPage-navi.pagePerGroup}&searchItem=${searchItem}&searchWord=${searchWord}">◁◁</a>
		<a
			href="board_1to1?currentPage=${navi.currentPage-1}&searchItem=${searchItem}&searchWord=${searchWord}">◀</a>
		&nbsp;&nbsp;


		<c:forEach var="page" begin="${navi.startPageGroup}"
			end="${navi.totalPageCount}">

			<c:if test="${page==currentPage}">
				<span style="color: red; font-weight: bolder;">${page} </span>&nbsp;
			</c:if>

			<c:if test="${page!=currentPage}">
				<a
					href="board_1to1?currentPage=${page}&searchItem=${searchItem}&searchWord=${searchWord}">${page}
				</a> &nbsp;
			</c:if>

		</c:forEach>
		&nbsp;&nbsp; <a
			href="board_1to1?currentPage=${navi.currentPage+1}&searchItem=${searchItem}&searchWord=${searchWord}">▶</a>
		<a
			href="board_1to1?currentPage=${navi.currentPage+navi.pagePerGroup}&searchItem=${searchItem}&searchWord=${searchWord}">▷▷</a>

	</div>


</body>
</html>