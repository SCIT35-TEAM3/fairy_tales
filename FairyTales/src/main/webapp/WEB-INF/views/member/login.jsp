<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
	function loginCheck() {
		var userid = document.getElementById("user_id").value;
		var userpwd = document.getElementById("user_pwd").value;

		if (userid.length == 0) {
			alert("아이디를 입력해주세요.");
			userid.focus();
			return false;
		}
		if (userpwd.length == 0) {
			alert("비밀번호를 입력해주세요.");
			userpwd.focus();
			return false;
		}
	}
</script>

</head>
<body>

	<h1>[ 로그인 ]</h1>
	<form id="login" action="login" method="post">
		<input id="user_id" name="user_id" type="text" placeholder="아이디를 입력하세요"> <br />
		${message}<br />
		 <input id="user_pwd" type="password" name="user_pwd" placeholder="비밀번호를 입력하세요"> <br />
		  <input id="btn" type="submit" value="로그인" onclick="return loginCheck()" />
		  <input id="reset"	type="button" value="취소" />

	</form>


</body>
</html>