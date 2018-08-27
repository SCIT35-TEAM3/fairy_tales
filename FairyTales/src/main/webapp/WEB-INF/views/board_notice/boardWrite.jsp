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
<script type="text/javascript">
function formCheck(){
	var titie = document.getElementById("title");
	var content = document.getElementById("content");

	
	if(title.value==""){
		alert("제목을 입력해주세요.");
		title.focus();
		return false;
	}
	if(content.value==""){
		alert("내용을 입력해주세요.");
		content.focus();
		return false;
	}
	return true;
}
</script>

<body>

        <div>
        <br/><br/>
       
            <h2>Write</h2>
            <br/>
        </div>
        <form id="form" action="boardWrite" method="post">
			<input type="hidden" name="user_id" value="${sessionScope.loginid}" id="user_id">
        <div class="container">
			<table border="1">
				<tbody>
					<tr>
						<th>글 제목</th>
						<td><input type="text" name="title" class="form-input" id="title" size="20" style="width:78%"></td>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<th>내용</th>
						<td><textarea rows="15" cols="80" class="form-input" name="content" id="content" ></textarea></td>
					</tr>
				</tbody>
			</table>
		</div>
        <br/>
        <div>
  
        	<input type="submit" value="Ok" id="send" onclick="return formCheck()" >
        	<input type="reset"  value="Cancel"/>
         
        </div>
        </form>

</body>

</html>
