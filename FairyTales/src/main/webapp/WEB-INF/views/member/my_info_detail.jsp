<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

function check(){
	var userpwd = $("#user_pwd").val();
		//console.log(userpwd.length);
	var userid = $("#user_id").val();
		//console.log(userpwd +" /"+userid);
	if (userpwd.length == 0) {
		alert("비밀번호를 입력해주세요.");
		$("#user_pwd").focus();
		return;
	}
	
	$.ajax({
		method:'post',
		url: 'pwCheck',
		data: {"user_id":userid,"user_pwd":userpwd},
		success:function(resp){
			console.log(resp);
			if(resp=="false"){
				alert("비밀번호가 틀렸습니다. 올바른 비밀번호를 입력해 주세요.");
				$("#user_pwd").focus();
			}else{
				my_info_form.submit();
			}
		}
	});
	
	
}

</script>
</head>
<body>

	<h1>마이페이지</h1>
	<form action="my_info_update" method="get" id="my_info_form">
		<input type="hidden" id="user_id" value="${memberdetail.user_id}">
		<table border="1">
			<tr>
				<td>* ID</td>
				<td>${memberdetail.user_id}</td>
			</tr>
			<tr>
				<td>* 비밀번호</td>
				<td><input type="password" name="user_pwd" id="user_pwd" placeholder="비밀번호를 입력하세요"></td>
				<!-- <td><div id="pwdresult"></div></td> -->
			</tr>
			<tr>
				<td>* 이름</td>
				<td>${memberdetail.user_name}</td>
				<!-- <td><div id="nameresult"></div></td> -->
			</tr>
			<tr>
				<td>* 나이</td>
				<td>${memberdetail.user_age}</td>

			</tr>
			<tr>
				<td>* 전화번호</td>
				<td>${memberdetail.phone_num}</td>
			</tr>
			<tr>
				<td>* E-mail</td>
				<td>${memberdetail.user_email}</td>
			</tr>
			<tr>
				<td>* 주소</td>
				<td>${memberdetail.address}</td>
			</tr>
			<tr>
				<td>가입일</td>
				<td>${memberdetail.new_date}</td>
			</tr>
			<tr>
				<td>선택과목</td>
				<td>
					${memberdetail.subject}
				</td>
			</tr>

			<tr>
				<th colspan="2">
					 <input type="button" id="btn" value="회원정보수정" onclick="check();">
					 <input type="reset" value="취소">
				</th>
			</tr>
		</table>
		</form>
</body>
</html>