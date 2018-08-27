<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function allChecked() {
		var user_id = document.getElementById("user_id");
		var user_pwd = document.getElementById("user_pwd");
		var check_pwd = document.getElementById("check_pwd");
		var user_name = document.getElementById("user_name");
		var user_age = document.getElementById("user_age");
		var phone_num = document.getElementById("phone_num");
		var user_email1 = document.getElementById("user_email1");
		var user_email2 = document.getElementById("user_email2").value;
		var address = document.getElementById("address");
		var subject = document.getElementsByClassName("subject");

		console.log(user_id);
		console.log(user_pwd);
		console.log(check_pwd); 
		console.log(user_name);
		console.log(user_age);
		console.log(phone_num);
		console.log(user_email1);
		console.log(user_email2);
		console.log(address);
		console.log(subject);
		
		

		if (user_id.value == "") {
			alert("아이디를 입력해주세요.");
			user_id.focus();
			return false;
		}
		if (user_pwd.value == "") {
			alert("비밀번호를 입력해주세요.");
			user_pwd.focus();
			return false;
		}
		if (check_pwd.value == "") {
			alert("비밀번호를 재입력해주세요.");
			check_pwd.focus();
			return false;
		}
		if (user_name.value == "") {
			alert("이름을 입력해주세요.");
			user_name.focus();
			return false;
		}
		if (isNaN(user_age.value)||user_age.value == "") {
			alert("나이를 입력해주세요.");
			user_age.focus();
			return false;
		}
		if (phone_num.value == "") {
			alert("전화번호를 입력해주세요.");
			phone_num.focus();
			return false;
		}
		
		var user_email = user_email1.value + user_email2;
		document.getElementById("user_email").value = user_email;
		if (user_email.value == "") {
			alert("이메일을 입력해주세요.");
			user_email.focus();
			return false;
		}
		
		if (address.value == "") {
			alert("주소를 입력해주세요.");
			address.focus();
			return false;
		}
		
		var sub = "";
		for (var i = 0; i < subject.length; i++) {
			if (subject[i].checked)
				sub += subject[i].value + " ";
		}
		//document.getElementById("subject").value = sub; 

		memberform.submit();
	}

	$(function() {
		$("#user_id").keyup(function() {
			console.log("키업 들어옴");
			var user_id = $(this).val();
			if (user_id.length<3 || user_id.length>11) {
				$('#id_check').text('길이는 3~10사이입니다.');
			} else {
				$.ajax({
					method : 'POST',
					url : "id_check",
					data : {
						'user_id' : user_id
					},
					success : function(r) {
						console.log("성공함")
						if (r == 1) {
							$('#id_check').text('중복된 아이디입니다.');
						} else {
							$('#id_check').text('사용 가능한 아이디입니다.');
						}
					},
					error : function(xhr, option, error) {
						console.log(xhr.status); //오류코드
						console.log(error); //오류내용
					}
				});
			}
		});

		//패스워드 재확인
		$('#user_pwd').keyup(function() {
			$('font[name=check]').text('');
			console.log("비밀번호 들어옴");
		}); //#user_pwd.keyup

		$('#check_pwd').keyup(function() {
			console.log("비밀번호 재확인 성공");
			if ($('#user_pwd').val() != $('#check_pwd').val()) {
				$('font[name=check]').text('');
				$('font[name=check]').html("암호 틀립니다.");
			} else {
				$('font[name=check]').text('');
				$('font[name=check]').html("암호 사용가능합니다.");
			}
		}); //#check_pwd.keyup
/* 
		$("#user_email").keyup(function() {
			console.log("email중복체크중....");
			var user_email = $(this).val();
			if (user_email.length<3 || user_email.length>11) {
				$('#email_check').text('길이는 3~10사이입니다.');
			} else {
				$.ajax({
					method : 'POST',
					url : "email_check",
					data : {
						'user_email' : user_email
					},
					success : function(r) {
						console.log("성공함")
						if (r == 1) {
							$('#email_check').text('사용불가능한 e-mail입니다.');
						} else {
							$('#email_check').text('사용 가능한 e-mail입니다.');
						}
					},
					error : function(xhr, option, error) {
						console.log(xhr.status); //오류코드
						console.log(error); //오류내용
					}
				});
			}
		}); */

	});
</script>
</head>
<body>

	<h1>회원가입</h1>
	<form id="memberform" name="member" action="join" method="post">
		<table border="1">
			<tr>
				<td>* ID</td>
				<td><input type="text" name="user_id" id="user_id" placeholder="ID를 입력하세요"> 
				<font id="id_check" size="2" color="red"></font></td>
			</tr>
			<tr>
				<td>* 비밀번호</td>
				<td><input type="password" name="user_pwd" id="user_pwd" placeholder="비밀번호를 입력하세요"></td>
				<!-- <td><div id="pwdresult"></div></td> -->
			</tr>
			<tr>
				<td>* 비밀번호 재확인</td>
				<td><input type="password" name="check_pwd" id="check_pwd" placeholder="비밀번호 재확인"> 
				<font name="check" size="2" color="red"></font></td>
			</tr>
			<tr>
				<td>* 이름</td>
				<td><input type="text" name="user_name" id="user_name" placeholder="이름을 입력하세요"></td>
				<!-- <td><div id="nameresult"></div></td> -->
			</tr>
			<tr>
				<td>* 나이</td>
				<td><input type="text" name="user_age" id="user_age" placeholder="나이를 입력하세요"></td>

			</tr>
			<tr>
				<td>* 전화번호</td>
				<td><input type="text" name="phone_num" id="phone_num" placeholder="전화번호를 입력하세요"></td>
			</tr>
			<tr>
				<td>* E-mail</td>
				<td><input type="email" name="user_email1" id="user_email1" placeholder="이메일을 입력하세요">@
					<!-- <button id="chkemail">중복확인</button></td> -->						
				<select name="user_email2" id="user_email2">
						<option value="@gmail.com">gmail.com</option>
						<option value="@hanmail.net">hanmail.net</option>
						<option value="@naver.com">naver.com</option>
						<option value="@daum.net">daum.net</option>
				</select> 
				
				<input id="user_email" type="hidden" name="user_email" value="" />
				 <font id="email_check" size="2" color="red"></font>
				 <br/>
					<div id="checkMsg"></div>
			</tr>
			<tr>
				<td>* 주소</td>
				<td><input type="text" name="address" id="address" placeholder="주소를 입력하세요"></td>
			</tr>
			<tr>
				<td>선택과목</td>
				<td>
					<input class="subject" type="checkbox" name="subject" value="japan"> 일본어 동화 
					<input class="subject" type="checkbox" name="subject" value="codding"> 코딩 퍼즐
					<input id="subject" type="hidden" name="subject" value="" />
				</td>
			</tr>

			<tr>
				<th colspan="2">
					<!-- <input type="button" id="btn" value="회원가입"> -->
					 <input type="button" value="회원가입" onclick="allChecked()">
					 <input type="reset" value="취소">
				</th>
			</tr>
		</table>
	</form>
</body>
</html>