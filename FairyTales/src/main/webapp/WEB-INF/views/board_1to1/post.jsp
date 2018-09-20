<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>1:1 CustomerBoard | POFT</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/lightbox.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">

<!--[if lt IE 9]>
	    <script src="js/html5shiv.js"></script>
	    <script src="js/respond.min.js"></script>
    <![endif]-->
<link rel="shortcut icon" href="images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="images/ico/apple-touch-icon-57-precomposed.png">
<script type="text/javascript">var switchTo5x=true;</script>
<script type="text/javascript"
	src="http://w.sharethis.com/button/buttons.js"></script>
<script type="text/javascript">stLight.options({publisher: "7e8eb33b-fbe0-4915-9b93-09490e3d10df", doNotHash: false, doNotCopy: false, hashAddressBar: false});</script>
<script type="text/javascript" src="resources/jquery-3.3.1.js"></script>
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
				str+='<li class="">';
				str+='<div>';
				str+='<input class="reply_num" type="hidden" value="'+this.reply_num+'" name="reply_num">';
				str+='<span class="user_id">'+this.user_id+'</span><br>';
				str+='<span class="reply_title">'+this.reply_title+'</span><br>';
				str+='<p class="reply_text">'+this.text+'</p><br>';
				str+='<button type="button" data-rno="'+this.reply_num+'" id="reply_update" class="btn btn-xs btn-warning">수정</button>&nbsp;&nbsp;';
				str+='<button type="button" data-dno="'+this.reply_num+'" id="reply_delete" class="btn btn-xs btn-warning">삭제</button><br>';
				str+='</div>';
				str+='</li>'
			
			});
			$(".comment").html(str);
			$("button#reply_update").click(reply_update);
			$("button#reply_delete").click(reply_delete);
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
			var reply_title = $("#reply_title").val();
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
		var reply_title = $("#reply_title").val();
		var teply_text = $("#teply_text").val();
		
		alert("user_id ::"+ user_id + "::reply_title: "+ reply_title+"::teply_text"+teply_text);
		
		if(text.length == 0) {
			alert("댓글을 입력하세요.");
			
			return ;
		}
		var sendData = {"board_num":${board_1to1.board_num},"user_id" : user_id, "reply_title" : reply_title, "text" : teply_text };
		
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
		
		alert("delete>>>"+reply_num);
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
	<!--header-->
	<header id="header">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 overflow">
					<div class="social-icons pull-right">
						<!-- <ul class="nav nav-pills">
                            <li><a href=""><i class="fa fa-facebook"></i></a></li>
                            <li><a href=""><i class="fa fa-twitter"></i></a></li>
                            <li><a href=""><i class="fa fa-google-plus"></i></a></li>
                            <li><a href=""><i class="fa fa-dribbble"></i></a></li>
                            <li><a href=""><i class="fa fa-linkedin"></i></a></li>
                        </ul> -->
					</div>
				</div>
			</div>
		</div>
		<div class="navbar navbar-inverse" role="banner">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>

					<a class="navbar-brand" href="./">
						<h1>
							<img src="images/로고.png" alt="logo">
						</h1>
					</a>

				</div>
				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="./">Home</a></li>
						<li class="dropdown"><a href="#">Page <i
								class="fa fa-angle-down"></i></a>
							<ul role="menu" class="sub-menu">
								<li><a href="it_test">Coding Test</a></li>
								<li><a href="j_test">Japanese Test</a></li>

								<li><a href="japanese_fairy">Japanese Fairy</a></li>
								<li><a href="coding_puzzle">Coding Puzzle</a></li>
							</ul></li>
						<li class="dropdown"><a href="#">Board<i
								class="fa fa-angle-down"></i></a>
							<ul role="menu" class="sub-menu">
								<li><a href="board_list">Notice</a></li>
								<li><a href="board_1to1">1:1 CustomerBoard</a></li>
							</ul></li>
						<!-- 회원 로그인 후-->
						<c:if test="${sessionScope.loginid != null}">

							<li class="dropdown"><a href="#">MyPage <i
									class="fa fa-angle-down"></i></a>
								<ul role="menu" class="sub-menu">
									<li><a href="my_info_detail">My Infomation</a></li>
									<li><a href="#">Learning Page</a></li>
									<li><a href="my_chart_page">My Chart</a></li>
								</ul></li>
							<li><div id="user_id_form">${sessionScope.loginid}님,</div></li>
							<li><a href="logout">Logout</a></li>
						</c:if>
						<!-- 로그인 전  -->
						<c:if test="${sessionScope.loginid == null}">
							<li><a href="login ">Login</a></li>
							<li><a href="join ">Join</a></li>
						</c:if>

					</ul>
				</div>

			</div>
		</div>
	</header>
	<!--/#header-->


	<section id="page-breadcrumb">
		<div class="vertical-center sun">
			<div class="container">
				<div class="row">
					<div class="action">
						<div class="col-sm-12">
							<h1 class="title">1:1 CustomerBoard</h1>
							<p></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!---■■■■■■■■■■■■■■■■■■ #page list ■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
	<section id="blog-details" class="padding-top">
		<div class="container">
			<div class="row">
				<div class="col-md-9 col-sm-7">
					<div class="row">
						<div class="col-md-12 col-sm-12">
							<div class="single-blog blog-details two-column">
								<table class="table">

									<thead align="center">
										<tr>
											<td width="100px">NO.</td>
											<td>${board_1to1.board_num}</td>
											<td width="100px">작성자</td>
											<td>${board_1to1.user_id}</td>
											<td width="100px">날짜</td>
											<td width="150px">${board_1to1.new_date}</td>
											<td width="100px">조회수</td>
											<td width="100px">${board_1to1.hitcount}</td>
										</tr>
									</thead>

									<tbody>
										<tr>
											<td width="100px" align="center">글제목</td>
											<td colspan="7">${board_1to1.title}</td>
										</tr>
									</tbody>
									<tbody>
										<tr>
											<td width="100px" align="center">글내용</td>
											<td colspan="8">
												<div class="form-control" name="text" id="text"
													style="height: 300px;">${board_1to1.text}</div>
											</td>

										</tr>
									</tbody>

								</table>

								<div class="post-bottom overflow">
									<ul class="nav navbar-nav post-nav">
										<li><c:if test="${not empty board_1to1.origin_file_name}">
												<a href="download?board_num=${board_1to1.board_num}"><i
													class="fa fa-tag"></i>${board_1to1.origin_file_name}</a>
											</c:if> <c:if test="${empty board_1to1.origin_file_name}">
												<a href="#"><i class="fa fa-tag"></i>첨부파일 없음</a>
											</c:if></li>
										<li><a
											href="board_update?board_num=${board_1to1.board_num}"
											id="update"><i class="fa fa-pencil"></i>수정</a></li>
										<li><a
											href="board_delete?board_num=${board_1to1.board_num}"
											id="delete"><i class="fa fa-bomb"></i>삭제</a></li>
									</ul>
								</div>
							</div>

							<!--■■■■■■■■■■■■■■■■■■■■ 댓글 ■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->

							<div class="reply_write">
								<div class="col-md-4 col-sm-12">
									<div class="contact-form bottom">
										<h2>답변</h2>

										<form method="post" action="reply_write">
											<input type="hidden" value="${board_1to1.board_num}"
												name="board_num" id="board_num"> <input
												type="hidden" value="${sessionScope.loginid}" name="user_id"
												id="user_id"> <input id="reply_num" type="hidden"
												value="" name="reply_num">
											<div class="form-group">
												<input type="text" name="reply_title" id="reply_title"
													class="form-control" required="required" placeholder="제목">
											</div>

											<div class="form-group">
												<textarea name="text" id="teply_text" required="required"
													class="form-control" rows="8" placeholder="Your text here"></textarea>
											</div>

										</form>
										<div class="form-group">
											<button type="button" class="btn btn-submit"
												id="reply_insert">등록</button>
										</div>
									</div>
									<div class="comment"></div>


								</div>

							</div>

						</div>
					</div>
				</div>
			</div>
			<!-- /1:1 board -->

			<div class="col-md-3 col-sm-5">
				<div class="sidebar blog-sidebar">
					<div class="sidebar-item  recent">
						<h3>Comments</h3>
						<div class="media">
							<div class="pull-left">
								<a href="#"><img src="images/portfolio/project1.jpg" alt=""></a>
							</div>
							<div class="media-body">
								<h4>
									<a href="#">Lorem ipsum dolor sit amet consectetur
										adipisicing elit,</a>
								</h4>
								<p>posted on 07 March 2014</p>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<a href="#"><img src="images/portfolio/project2.jpg" alt=""></a>
							</div>
							<div class="media-body">
								<h4>
									<a href="#">Lorem ipsum dolor sit amet consectetur
										adipisicing elit,</a>
								</h4>
								<p>posted on 07 March 2014</p>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<a href="#"><img src="images/portfolio/project3.jpg" alt=""></a>
							</div>
							<div class="media-body">
								<h4>
									<a href="#">Lorem ipsum dolor sit amet consectetur
										adipisicing elit,</a>
								</h4>
								<p>posted on 07 March 2014</p>
							</div>
						</div>
					</div>
					<div class="sidebar-item categories">
						<h3>Categories</h3>
						<ul class="nav navbar-stacked">
							<li><a href="#">Lorem ipsum<span class="pull-right">(1)</span></a></li>
							<li class="active"><a href="#">Dolor sit amet<span
									class="pull-right">(8)</span></a></li>
							<li><a href="#">Adipisicing elit<span class="pull-right">(4)</span></a></li>
							<li><a href="#">Sed do<span class="pull-right">(9)</span></a></li>
							<li><a href="#">Eiusmod<span class="pull-right">(3)</span></a></li>
							<li><a href="#">Mockup<span class="pull-right">(4)</span></a></li>
							<li><a href="#">Ut enim ad minim <span
									class="pull-right">(2)</span></a></li>
							<li><a href="#">Veniam, quis nostrud <span
									class="pull-right">(8)</span></a></li>
						</ul>
					</div>
					<div class="sidebar-item tag-cloud">
						<h3>Tag Cloud</h3>
						<ul class="nav nav-pills">
							<li><a href="#">Corporate</a></li>
							<li><a href="#">Joomla</a></li>
							<li><a href="#">Abstract</a></li>
							<li><a href="#">Creative</a></li>
							<li><a href="#">Business</a></li>
							<li><a href="#">Product</a></li>
						</ul>
					</div>
					<div class="sidebar-item popular">
						<h3>Latest Photos</h3>
						<ul class="gallery">
							<li><a href="#"><img src="images/portfolio/popular1.jpg"
									alt=""></a></li>
							<li><a href="#"><img src="images/portfolio/popular2.jpg"
									alt=""></a></li>
							<li><a href="#"><img src="images/portfolio/popular3.jpg"
									alt=""></a></li>
							<li><a href="#"><img src="images/portfolio/popular4.jpg"
									alt=""></a></li>
							<li><a href="#"><img src="images/portfolio/popular5.jpg"
									alt=""></a></li>
							<li><a href="#"><img src="images/portfolio/popular1.jpg"
									alt=""></a></li>
						</ul>
					</div>
				</div>
			</div>


		</div>
		</div>
	</section>
	<!-- /sidebar -->



	<!-- footer -->
	<footer id="footer">
		<div class="container">
			<div class="row">
				<div class="row">
					<div class="col-sm-12 text-center bottom-separator">
						<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <img
							src="images/home/under.png" class="img-responsive inline" alt="">
					</div>
				</div>
				<div class="row">
					<div class="col-md-4 col-sm-4">
						<div class="contact-info bottom">
							<h2>Contacts</h2>
							<address>
								E-mail: <a href="mailto:jungim0547@gmail.com">jungim0547@gmail.com</a>
								<br> Phone: 1566-5114 <br>
							</address>

							<h2>Address</h2>
							<address>
								513 COEX office<br> Korea International Trade Association,
								<br> Yeongdong-daero, <br> Gangnam-gu, <br> Seoul
								<br>
							</address>
						</div>
					</div>
					<div class="col-md-8 col-sm-8">
						<iframe width="100%" height="300" frameborder="0" scrolling="no"
							marginheight="0"
							src="https://maps.google.com/maps?q=coex&t=&z=13&ie=UTF8&iwloc=&output=embed"
							marginwidth="0"> </iframe>
					</div>
				</div>
				<!-- <div class="col-md-4 col-sm-12">
					<div class="contact-form bottom">
						<h2>Send a message</h2>
						<form id="main-contact-form" name="contact-form" method="post"
							action="MAILTO:jungim0547@gmail.com">
							<div class="form-group">
								<input type="text" name="name" class="form-control"
									required="required" placeholder="Name">
							</div>
							<div class="form-group">
								<input type="email" name="email" class="form-control"
									required="required" placeholder="Email Id">
							</div>
							<div class="form-group">
								<textarea name="message" id="message" required="required"
									class="form-control" rows="8" placeholder="Your text here"></textarea>
							</div>
							<div class="form-group">
								<input type="submit" name="submit" class="btn btn-submit"
									value="Submit">
							</div>
						</form>
					</div>
						<div id="map-container">
						<h2 class="page-header">Google Map</h2>
						<div id="gmap"></div>
					</div>
					/#map-container
				</div> -->
				<div class="col-sm-12">
					<div class="copyright-text text-center">
						<p>Copyright &copy; SC IT MASTER</p>
						<p>
							Designed by C class 3Group</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!--/#footer-->


	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/lightbox.min.js"></script>
	<script type="text/javascript" src="js/wow.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
</body>
</html>




