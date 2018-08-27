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
       
            <h2>Notice</h2>
            <br/>
        </div>
        
        <div class="container">
			<table border="1" style="width: 75%">
				<tbody class="hidden-xs">
					<tr>
						<th width="70px">NO.</th>
						<td width="30px">${boarddetail.board_num}</td>
						<th width="40px">글쓴이</th>
						<td width="40px">${boarddetail.user_id}</td>
						<th width="40px">날짜</th>
						<td width="50px" class="text-right">${boarddetail.new_date}</td>
						<th width="40px" class="text-right">조회수</th>
						<td width="30px" class="text-right">${boarddetail.hitcount}</td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<th width="70px">글제목</th>
						<td colspan="7">${boarddetail.title}</td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<th width="70px">글내용</th>
						<td colspan="7">${boarddetail.content}</td>
					</tr>
				</tbody>

			</table>
		</div>
		<br/><br/>
        <div align="center">
        	<c:if test="${sessionScope.loginid ne boarddetail.user_id}">
        	<a href="board_list" id="boardList" class="btn btn-primary btn-xl">Board List</a>  
        	 </c:if>
        	 
        	 <c:if test="${sessionScope.loginid eq boarddetail.user_id}">
        	 <a href="board_list" id="boardList" class="btn btn-primary btn-xl">Board List</a>  
            <a href="boardUpdate?board_num=${boarddetail.board_num}" id="boardUpdate">Update</a>
            <a href="boardDelete?board_num=${boarddetail.board_num}" id="boardDelete">Delete</a>
            </c:if>
            
        </div>
        <br/>
        <br/>

  

</body>

</html>
