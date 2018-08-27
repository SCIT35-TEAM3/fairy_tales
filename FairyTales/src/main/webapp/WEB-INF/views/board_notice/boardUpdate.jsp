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
       
            <h2>Update</h2>
            <br/>
        </div>
        <form action="boardUpdate" method="post">
			<input type="hidden" name="board_num" value="${board.board_num}">
        <div class="container">
			<table style="width: 75%">
				<tbody>
					<tr>

						<th>글 제목</th>
						<td><input type="text" name="title" id="title" value="${board.title}" size="20" style="width:78%"></td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<th>내용</th>
						<td><textarea rows="15" cols="80" name="content" id="content" >${board.content}</textarea></td>
					</tr>
				</tbody>
				
			</table>
		</div>
        <br/>
        <div align="center">
        	<input type="submit" value="Update"/>
        	<input type="reset"  value="Cancel"/>
        
          
        </div>
        </form>
   
</body>

</html>
