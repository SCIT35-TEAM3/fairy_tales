<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	function back() {
		if (confirm('정말로 취소 하시겠습니까?')) {
			history.back();
		} else {

		}
	}

	$(function() {

	})

	function submit() {
		$('#form').submit();
	}
</script>
</head>
<body>
<h2>글 쓰기</h2>
	<form action="write" method="post" id="form">
		<div>
			<table>
				<tr>
					<th scope="row">ID</th>
					<td class="font12">${login_id}</td>
				</tr>
				<tr>
					<th><label for="title">제목</label></th>
					<td><input type="text" name="title" id="title" class="title"
						style="width: 570px;" maxlength="200"></td>
				</tr>
				<tr>
					<th><label for="secret" class="txt">비밀글</label></th>
					<td><div class="secret">
							<input type="checkbox" id="secret" name="secret" class="check">
						</div></td>
				</tr>
				<tr>
					<th><label for="title">제목</label></th>
					<td><textarea name="text" rows="10" cols="100" class="text"
							id="text" required="" required_msg="내용을 입력하세요"
							onkeyup="ch_byte('questionDes');"></textarea></td>
				</tr>

				<tr>
					<th scope="row">첨부파일</th>
					<td><input type="file" id="file" name="origin_file_name"
						style="width: 400px;" class="ver_top"
						onchange="fileCheck(this.form.files[0], 1 )"> <a
						href="javascript:fileReset('file1');" class="btn_small">삭제</a>

						<div class="margin_top10 font_11">
							* 5MB 미만의 파일만 첨부가능합니다. (jpg, gif, bmp, png 형식만 가능)<br> * 파일
							첨부시 개인정보가 포함되지 않도록 주의해 주세요.<br>
						</div></td>
				</tr>

			</table>

		</div>


	</form>
	<div class="btn_area">
		<a href="javascript:submit()"><img
			src="https://simage.kyobobook.co.kr/ink/images/cscenter/btn_receipt.gif"
			alt="문의접수"></a> <a href="javascript:back()"><img
			src="https://simage.kyobobook.co.kr/ink/images/member/btn_cancel.gif"
			alt="취소"></a>
	</div>

</body>
</html>


