<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
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
</head>
<!--/head-->
<!-- script -->
<script src="resources/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function formCheck() {
		var titie = document.getElementById("title");
		var content = document.getElementById("content");

		if (title.value == "") {
			alert("제목을 입력해주세요.");
			title.focus();
			return false;
		}
		if (content.value == "") {
			alert("내용을 입력해주세요.");
			content.focus();
			return false;
		}
		return true;
	}
</script>
<!-- /script -->

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
								<li><a href="j_test">Japanese Test</a></li>
								<li><a href="it_test">Coding Test</a></li>
								
								<li><a href="japanese_fairy">Japanese Fairy</a></li>
								<li><a href="coding_puzzle">Coding Puzzle</a></li>
							</ul></li>
						<li class="active" class="dropdown"><a href="#">Board<i class="fa fa-angle-down"></i></a>
							<ul role="menu" class="sub-menu">
								<li><a href="board_list">Notice</a></li>
								<li class="active"><a href="board_1to1">1:1 Customer Board</a></li>
							</ul></li>
						<!-- 회원 로그인 후-->
						<c:if test="${sessionScope.loginid != null}">

							<li class="dropdown"><a href="#">My Page <i class="fa fa-angle-down"></i></a>
								<ul role="menu" class="sub-menu">
									<li><a href="my_info_detail">My Infomation</a></li>
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
							<p>update</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!--/#page-breadcrumb-->

	<section id="blog" class="padding-top">
		<div class="container">

			<div class="col-md-9 col-sm-7">
				<div class="row">
					<!-- Notice Board -->
					<div class="col-sm-12 col-md-12">
						<div class="user-data m-b-30">

							<div class="sidebar blog-sidebar">
								<div class="sidebar-item  recent">
									<h3>1:1 Board</h3>
									<form action="board_update" method="post" id="form" enctype="multipart/form-data">
										<input type="hidden" name="board_num"
											value="${board_1to1.board_num}">

										<table>
											<tr>
												<th scope="row">ID</th>
												<td class="form-control">${login_id}</td>
											</tr>
											<tr>
												<th><label for="form-control">제목</label></th>
												<td><input type="text" name="title" id="title"
													value="${board_1to1.title}" class="form-control"></td>
											</tr>
											<tr>
												<th><label for="secret" class="txt">비밀글</label></th>
												<td><div class="form-control">
														<input type="checkbox" id="secret" name="secret"
															class="" value="${board_1to1.title}">
													</div></td>
											</tr>
											<tr>
												<th><label for="title">내용</label></th>
												<td><textarea name="text" rows="10" cols="100"
														class="form-control" id="text" required=""
														required_msg="내용을 입력하세요" onkeyup="ch_byte('questionDes');">${board_1to1.text}</textarea></td>
											</tr>

											<tr>
												<th scope="row">첨부파일</th>
												<td><input type="file" id="file"
													name="upload" class=""
													onchange="fileCheck(this.form.files[0], 1 )">

													<div class="margin_top10 font_11">
														* 5MB 미만의 파일만 첨부가능합니다. (jpg, gif, bmp, png 형식만 가능)<br>
														* 파일 첨부시 개인정보가 포함되지 않도록 주의해 주세요.<br>
													</div></td>
											</tr>

										</table>
										<div class="user-data__footer" align="center">
											<button type="submit" class="btn btn-submit"
												>Ok</button>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<button type="reset" class="btn btn-submit">Cancel</button>
										</div>
									</form>
								</div>
							</div>
						</div>
						<!-- /Notice Board -->
					</div>
				</div>
			</div>


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

				</div>
			</div>
		</div>
	</section>
	<!--/#blog-->

	<footer id="footer">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 text-center bottom-separator">
					<img src="images/home/under.png" class="img-responsive inline"
						alt="">
				</div>
				<div class="col-md-4 col-sm-6">
					<div class="contact-info bottom">
						<h2>Contacts</h2>
						<address>
							E-mail: <a href="mailto:jungim0547@gmail.com">jungim0547@gmail.com</a>
							<br> Phone: 1566-5114 <br>
						</address>

						<h2>Address</h2>
						<address>
							513 COEX office<br> Korea International Trade Association, <br>
							Yeongdong-daero, <br> Gangnam-gu, <br> Seoul <br>
						</address>
					</div>
				</div>
				<div class="col-md-6 col-sm-12">
					<!-- <div class="col-md-12 col-sm-12"> -->
					<div class="contact-info bottom">
						<div class="map">
							<iframe width="120%" height="300" frameborder="0" scrolling="no"
								marginheight="0"
								src="https://maps.google.com/maps?q=coex&t=&z=13&ie=UTF8&iwloc=&output=embed"
								marginwidth="0">
								<a class="addmaps" href="http://www.embedgooglemap.net"
									id="get-map-data"
									mce_href="http://maps.google.com/maps/api/js?sensor=false">embedgooglemap.net</a>

							</iframe>
						</div>

					</div>
				</div>
				<!-- <div class="col-md-4 col-sm-12">
                    <div class="contact-form bottom">
                        <h2>Send a message</h2>
                        <form id="main-contact-form" name="contact-form" method="post" action="sendemail.php">
                            <div class="form-group">
                                <input type="text" name="name" class="form-control" required="required" placeholder="Name">
                            </div>
                            <div class="form-group">
                                <input type="email" name="email" class="form-control" required="required" placeholder="Email Id">
                            </div>
                            <div class="form-group">
                                <textarea name="message" id="message" required="required" class="form-control" rows="8" placeholder="Your text here"></textarea>
                            </div>                        
                            <div class="form-group">
                                <input type="submit" name="submit" class="btn btn-submit" value="Submit">
                            </div>
                        </form>
                    </div>
                </div> -->
				<div class="col-sm-12">
					<div class="copyright-text text-center">
						<p>&copy; Your Company 2014. All Rights Reserved.</p>
						<p>
							Designed by <a target="_blank" href="http://www.themeum.com">Themeum</a>
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




