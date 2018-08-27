<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 수정</title>
</head>
<body>
<h2>글 수정</h2>
	<form action="board_update" method="post" id="form">
	<input type="hidden" name="board_num" value="${board_1to1.board_num}">
		<div>
			<table>
				<tr>
					<th scope="row">ID</th>
					<td class="font12">${login_id}</td>
				</tr>
				<tr>
					<th><label for="title">제목</label></th>
					<td><input type="text" name="title" id="title" value="${board_1to1.title}" class="title"
						style="width: 570px;" maxlength="200"></td>
				</tr>
				<tr>
					<th><label for="secret" class="txt">비밀글</label></th>
					<td><div class="secret">
							<input type="checkbox" id="secret" name="secret" class="check" value="${board_1to1.title}">
						</div></td>
				</tr>
				<tr>
					<th><label for="title">내용</label></th>
					<td><textarea name="text" rows="10" cols="100" class="text"
							id="text" required="" required_msg="내용을 입력하세요"
							onkeyup="ch_byte('questionDes');">${board_1to1.text}</textarea></td>
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

		<button type="submit">등록</button>
		<button type="button" onclick="back()">돌아가기</button>

	</form>
</body>
</html>