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
	console.log('test');
	var user_pwd = document.getElementById("user_pwd");
	if (user_pwd.value.length == 0) {
		alert("비밀번호를 입력해주세요.");
		user_pwd.focus();
		return false;
	}
	var oldpwd=document.getElementById("oldpwd");
	if(oldpwd.value==user_pwd.value){
		alert('비밀번호는 변경하셔야 합니다.!!');
		return false;
	}
	 var params = jQuery("#updateform").serialize(); 
	$.ajax({
		method:'post',
		url: 'my_info_update',
		data:params,
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		success:function(resp){
			if(resp=="ok"){
				location.href="./";
			}else{
				user_pwd.value="";
				oldpwd.value="";
				
				alert('개인정보 변경에 실패했습니다!! 비밀번호를 확인하세요.');
			}
		}
		
	})
	
	
	
	
}
</script>
</head>
<body>

	<h1>회원정보수정</h1>
	<form action="gomain" method="get" id="updateform">
		<table border="1">
			<tr>
				<td>* ID</td>
				<td><input type="text" name="user_id" id="user_id" value="${memberdetail.user_id}"></td>
			</tr>
			<tr>
				<td>* 기존 비밀번호</td>
				<td><input type="password" name="oldpwd" id="oldpwd" placeholder="기존 비밀번호를 입력하세요"></td>
				<!-- <td><div id="pwdresult"></div></td> -->
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
				<td><input type="text" name="phone_num" id="phone_num" value="${memberdetail.phone_num}"></td>
			</tr>
			<tr>
				<td>* E-mail</td>
				<td><input type="text" name="user_email" id="user_email" value="${memberdetail.user_email}"></td>
			</tr>
			<tr>
				<td>* 주소</td>
				<td><input type="text" name="address" id="address" value="${memberdetail.address}"></td>
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
					<!-- <input type="button" id="btn" value="회원가입"> -->
					 <input type="button" value="수정완료" onclick="check()">
					 <input type="reset" value="취소">
				</th>
			</tr>
		</table>
	</form>
</body>
</html>