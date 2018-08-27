<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery-3.3.1.js"></script>
<script type="text/javascript">

function init() {
	var board_num =${board_1to1.board_num};
	$("#text").val("");
	$("#reply_title").val("")
	$('#reply_insert').text('등록');
	$.ajax({
		method : 'post',
		data : {board_num},
		url : 'reply_list',
		dataType: "json",
		//contentType : 'application/json; charset=UTF-8',
		success : function (data) {
			
			var str = "";
			$(data).each(function () {
				str+='<div>';
				str+='<input class="reply_num" type="hidden" value="'+this.reply_num+'" name="reply_num">';
				str+='<span class="user_id">'+this.user_id+'</span><br>';
				str+='<span class="reply_title">'+this.reply_title+'</span><br>';
				str+='<span class="reply_text">'+this.text+'</span><br>';
				str+='<button type="button" data-rno="'+this.reply_num+'" class="reply_update">수정</button>';
				str+='<button type="button" data-dno="'+this.reply_num+'" class="reply_delete">삭제</button><br>';
				str+='</div>';
			});
			$(".reply").html(str);
			$("button.reply_update").click(reply_update);
			$("button.reply_delete").click(reply_delete);
		}
	});
	
}

$(function () {
	init();
	$("#reply_insert").on('click', reply_insert);
		}
	)
	
function reply_update() {
	var reply_num  = $(this).attr("data-rno");
	var user_id    = $(this).parent().children(".user_id").text();
	var reply_title = $(this).parent().children(".reply_title").text();
	var reply_text = $(this).parent().children(".reply_text").text();
	
		$('#reply_title').val(reply_title);
		$('#text').val(reply_text);
		$('#reply_insert').text('댓글 수정');
		$('#reply_num').val(reply_num);

		$("#reply_insert").on('click', update);
		$('#reply_insert').off('click', reply_insert);
		
		
		function update(reply_num) {
			var reply_num = $("#reply_num").val();
			var user_id = $("#user_id").val();
			var reply_title = $(".reply_title").val();
			var text = $("#text").val();
			
			
			
			var sendData = {"reply_num":reply_num,"user_id": user_id ,"reply_title":reply_title ,"text":text};
			
			$.ajax({
				method : 'post'
				, url  : 'reply_update'
				, data :  JSON.stringify(sendData)
				, dataType : 'json'
				, contentType : 'application/json; charset=UTF-8'
				, success : init
			});	
		}
		
	 
		
	}
	function reply_insert() {
		var user_id = $("#user_id").val();
		var reply_title = $(".reply_title").val();
		var text = $("#text").val();
		
		
		
		
		if(text.length == 0) {
			alert("댓글을 입력하세요.");
			
			return ;
		}
		var sendData = {"board_num":${board_1to1.board_num},"user_id" : user_id, "reply_title" : reply_title, "text" : text };
		
		$.ajax({
			method : 'post'
			, url  : 'reply_write'
			, data :  JSON.stringify(sendData)
			, dataType : 'json'
			, contentType : 'application/json; charset=UTF-8'
			, success : init
		});
		
	}
	
	function reply_delete() {
		
		
		var reply_num = $(this).attr("data-dno");
		
		$.ajax({
			method : 'get'
			, url  : 'reply_delete'
			, data : 'reply_num='+reply_num
			, success : init
		});
	
		
		
	}
	

</script>
</head>
<body>
 

	<div>
		<h2>게시글</h2>
	</div>
	<div>
		<table>
			<tr>
				<th>작성자</th>
				<td>${board_1to1.user_id}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${board_1to1.title}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="2" rowspan="5"><span>${board_1to1.text}<span></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><c:if test="${not empty board_1to1.origin_file_name}">
						<a href="download?board_num=${board_1to1.board_num}">${board_1to1.origin_file_name}</a>

						<c:if test="${not empty type}">
							<img width="50" height="50"
								src="download?board_num=${board_1to1.board_num}">
						</c:if>
					</c:if> <c:if test="${empty board_1to1.origin_file_name}">
						<span> 첨부파일 없음</span>
					</c:if></td>
			</tr>

		</table>
	</div>
	<a href="board_update?board_num=${board_1to1.board_num}" id="update">수정</a>
	<a href="board_delete?board_num=${board_1to1.board_num}" id="delete">삭제</a>
	<br>
	<br>

	<!--댓글  -->

	<div class="reply_write">
		<form action="reply_write" method="post">
			<input type="hidden" value="${board_1to1.board_num}" name="board_num"
				id="board_num"> <input type="hidden"
				value="${sessionScope.login_id}" name="user_id" id="user_id">
				
				<input type="text" value="" name="reply_num" id="reply_num">

			<table>
				<tr>
					<th><label for="reply_title">답변 제목</label></th>
					<td><input type="text" id="reply_title" class="reply_title"
						name="reply_title"></td>
				</tr>
				<tr>
					<th><label for="text" class="hidden">comment</label></th>
					<td><textarea id="text" name="text" cols="50" rows="6"
							class="reply_write"></textarea> <br></td>
				</tr>
			</table>
		</form>
		<button type="button" id="reply_insert" >등록</button>
	</div>

	<div class="reply_list">
		<div class="reply"></div>
	</div>
	
	
	
	

</body>
</html>




