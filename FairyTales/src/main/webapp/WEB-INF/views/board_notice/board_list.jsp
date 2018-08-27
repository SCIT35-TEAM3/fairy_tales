<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>Notice</title>
</head>
<script src="resources/jquery-3.3.1.min.js"></script>
<body>
   
        <div>
        <br/><br/>

            <h2>Board</h2>
            <br/>
        </div>
        
        <div class="container">
			<table border="1">
				<tbody>
					<tr>
						<th width="100px">NO.</th>
						<th>ID</th>
						<th>글 제목</th>
						<th class="text-right">날짜</th>
						<th class="text-right">조회수</th>

					</tr>
				</tbody>
				<c:forEach var="board" items="${list}">
					<c:if test="${sessionScope.loginid != null}">
							<tr>
								<td>${board.board_num}</td>
								<td>${board.user_id}</td>
								<td><a href="boardDetail?board_num=${board.board_num}">${board.title}</a></td>
								<td class="text-right">${board.new_date}</td>
								<td class="text-right">${board.hitcount}</td>
							</tr>
					
						</c:if>
				</c:forEach>
			</table>
		</div>
		
		<!-- 페이징부분 -->
	<div class="boardfooter">

		<a href="board_list?currentPage=${navi.currentPage - navi.pagePerGroup}&searchItem=${searchItem}&searchWord=${searchWord}">◀◀</a>
		<a href="board_list?currentPage=${navi.currentPage - 1}&searchItem=${searchItem}&searchWord=${searchWord}">◁</a>
		&nbsp;&nbsp;

		<c:forEach var="page" begin="${navi.startPageGroup}"
			end="${navi.endPageGroup}">
			<c:if test="${page == currentPage}">
				<span style="color: red; fond-weigh: bolder;">${page}</span> &nbsp;
		</c:if>
			<c:if test="${page != currentPage}">


				<!-- listboard를 누르면 페이지를 요청하는데, 링크건 ${page}값을 받아온다. -->
				<a href="board_list?currentPage=${page}&searchItem=${searchItem}&searchWord=${searchWord}">${page}</a> &nbsp; <!-- 한칸 띄우기 -->
			</c:if>
		</c:forEach>
		&nbsp;&nbsp; 
		<a href="board_list?currentPage=${navi.currentPage + 1}&searchItem=${searchItem}&searchWord=${searchWord}">▷</a>
		<a href="board_list?currentPage=${navi.currentPage + navi.pagePerGroup}&searchItem=${searchItem}&searchWord=${searchWord}">▶▶</a>

	</div>

	<div>
		<c:if test="${sessionScope.user_level eq '1'}">
			<a href="boardWrite" id="boardWrite">글쓰기</a>
		</c:if>
	</div>


</body>

</html>
