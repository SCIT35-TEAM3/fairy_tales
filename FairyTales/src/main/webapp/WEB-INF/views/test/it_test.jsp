<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<style type="text/css">
.nav>li>div {
	position: relative;
	padding: 10px 15px;
}
</style>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Home | Triangle</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/lightbox.css" rel="stylesheet">
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
	<script type="text/javascript" src="resources/jquery-3.3.1.js"></script>
<script type="text/javascript" src="resources/it_test.js"></script>
	
</head>
<!--/head-->

<body>
	<!--header-->
	<header id="header">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 overflow">
					<div class="social-icons pull-right">
						<ul class="nav nav-pills">
							<li><a href=""><i class="fa fa-facebook"></i></a></li>
							<li><a href=""><i class="fa fa-twitter"></i></a></li>
							<li><a href=""><i class="fa fa-google-plus"></i></a></li>
							<li><a href=""><i class="fa fa-dribbble"></i></a></li>
							<li><a href=""><i class="fa fa-linkedin"></i></a></li>
						</ul>
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
							<img src="images/logo(ex).png" alt="logo">
						</h1>
					</a>

				</div>
				<div class="collapse navbar-collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="./">Home</a></li>
						<li class="dropdown"><a href="#">Page <i
								class="fa fa-angle-down"></i></a>
							<ul role="menu" class="sub-menu">
								<li><a href="it_test">Codding Test</a></li>
								<li><a href="j_test">Japanese Test</a></li>

								<li><a href="japanese_fairy">Japanese Fairy</a></li>
								<li><a href="aboutus.html">Codding Puzzle</a></li>
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
									<li><a href="portfoliofour.html">Learning Page</a></li>
								</ul></li>
							<li><div>${sessionScope.loginid}</div></li>
							<li><a href="logout">Logout</a></li>
						</c:if>
						<!-- 로그인 전  -->
						<c:if test="${sessionScope.loginid == null}">
							<li><a href="login ">Login</a></li>
							<li><a href="join ">Join</a></li>
						</c:if>

					</ul>
				</div>
				<div class="search">
					<form role="form">
						<i class="fa fa-search"></i>
						<div class="field-toggle">
							<input type="text" class="search-form" autocomplete="off"
								placeholder="Search">
						</div>
					</form>
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
							<h1 class="title">Blog</h1>
							<p>Blog with right sidebar</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/#action-->

	<section id="blog" class="padding-top">
		<div class="container">
			<div class="row">
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
								<li><a href="#">Adipisicing elit<span
										class="pull-right">(4)</span></a></li>
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
								<li><a href="#"><img
										src="images/portfolio/popular1.jpg" alt=""></a></li>
								<li><a href="#"><img
										src="images/portfolio/popular2.jpg" alt=""></a></li>
								<li><a href="#"><img
										src="images/portfolio/popular3.jpg" alt=""></a></li>
								<li><a href="#"><img
										src="images/portfolio/popular4.jpg" alt=""></a></li>
								<li><a href="#"><img
										src="images/portfolio/popular5.jpg" alt=""></a></li>
								<li><a href="#"><img
										src="images/portfolio/popular1.jpg" alt=""></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-9 col-sm-7">
					<div class="row">
						<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■< 문제 >■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
						<!-- <<<<<<<<<<<<<<< 1번 >>>>>>>>>>>>> -->
						<div class="col-md-12 col-sm-12">
							<div class="single-blog two-column">

								<div class="post-content overflow">
									<h3 class="post-title bold" id="1">1번 . 10時半頃、男の人は何をしていましたか。</h3>

									<div class="post-bottom overflow" id="101">

										<input type="radio" name="one" id="j-one" value="1"><label
											for="j-one">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="one" id="j-one" value="2"><label
											for="j-one">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="one" id="j-one" value="3"><label
											for="j-one">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="one" id="j-one" value="4"><label
											for="j-one">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
								</div>
							</div>
						</div>
						<!-- <<<<<<<<<<<<<<< 2번 >>>>>>>>>>>>> -->
						<div class="col-md-12 col-sm-12">
							<div class="single-blog two-column">

								<div class="post-content overflow">
									<h3 class="post-title bold" id="2">2번</h3>


									<div class="post-bottom overflow" id="102">

										<input type="radio" name="two" id="j-two" value="1"><label
											for="j-two">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="two" id="j-two" value="2"><label
											for="j-two">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="two" id="j-two" value="3"><label
											for="j-two">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="two" id="j-two" value="4"><label
											for="j-one">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12 col-sm-12">
							<div class="single-blog two-column">

								<div class="post-content overflow">
									<h3 class="post-title bold" id="3">3번</h3>


									<div class="post-bottom overflow" id="103">

										<input type="radio" name="three" id="j-three" value="1"><label
											for="j-three">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="three" id="j-three" value="2"><label
											for="j-three">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="three" id="j-two" value="3"><label
											for="j-three">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="three" id="j-three" value="4"><label
											for="j-three">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12 col-sm-12">
							<div class="single-blog two-column">

								<div class="post-content overflow">
									<h3 class="post-title bold"  id="4">4번</h3>


									<div class="post-bottom overflow"  id="104">

										<input type="radio" name="four" id="j-four" value=""><label
											for="j-four">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="four" id="j-four" value=""><label
											for="j-four">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="four" id="j-four" value=""><label
											for="j-four">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="four" id="j-four" value=""><label
											for="j-four">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12 col-sm-12">
							<div class="single-blog two-column">

								<div class="post-content overflow">
									<h3 class="post-title bold"  id="5">5번</h3>


									<div class="post-bottom overflow" id="105">

										<input type="radio" name="five" id="j-five" value=""><label
											for="j-fiveo">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="five" id="j-five" value=""><label
											for="j-five">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="five" id="j-five" value=""><label
											for="j-five">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="five" id="j-five" value=""><label
											for="j-five">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12 col-sm-12">
							<div class="single-blog two-column">

								<div class="post-content overflow">
									<h3 class="post-title bold"  id="6">6번</h3>


									<div class="post-bottom overflow" id="106">

										<input type="radio" name="six" id="j-six" value=""><label
											for="j-six">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="six" id="j-six" value=""><label
											for="j-six">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="six" id="j-six" value=""><label
											for="j-six">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="six" id="j-six" value=""><label
											for="j-six">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12 col-sm-12">
							<div class="single-blog two-column">

								<div class="post-content overflow">
									<h3 class="post-title bold" id="7">7번</h3>


									<div class="post-bottom overflow" id="107">

										<input type="radio" name="seven" id="j-seven" value=""><label
											for="j-seven">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="seven" id="j-seven" value=""><label
											for="j-seven">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="seven" id="j-seven" value=""><label
											for="j-seven">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="seven" id="j-seven" value=""><label
											for="j-seven">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12 col-sm-12">
							<div class="single-blog two-column">

								<div class="post-content overflow">
									<h3 class="post-title bold"  id="8">8번</h3>


									<div class="post-bottom overflow" id="108">

										<input type="radio" name="eight" id="j-eight" value=""><label
											for="j-eight">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="eight" id="j-eight" value=""><label
											for="j-eight">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="eight" id="j-eight" value=""><label
											for="j-eight">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="eight" id="j-eight" value=""><label
											for="j-eight">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12 col-sm-12">
							<div class="single-blog two-column">

								<div class="post-content overflow">
									<h3 class="post-title bold"  id="9">9번</h3>


									<div class="post-bottom overflow" id="109">

										<input type="radio" name="nine" id="j-nine" value=""><label
											for="j-nine">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="nine" id="j-nine" value=""><label
											for="j-nine">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="nine" id="j-nine" value=""><label
											for="j-nine">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="nine" id="j-nine" value=""><label
											for="j-nine">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12 col-sm-12">
							<div class="single-blog two-column">

								<div class="post-content overflow">
									<h3 class="post-title bold"  id="10">10번</h3>


									<div class="post-bottom overflow"  id="110">

										<input type="radio" name="ten" id="j-ten" value=""><label
											for="j-ten">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="ten" id="j-ten" value=""><label
											for="j-ten">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="ten" id="j-ten" value=""><label
											for="j-ten">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="ten" id="j-ten" value=""><label
											for="j-ten">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12 col-sm-12">
							<div class="single-blog two-column">

								<div class="post-content overflow">
									<h3 class="post-title bold" id="11">11번</h3>


									<div class="post-bottom overflow"  id="111">

										<input type="radio" name="eleven" id="j-eleven" value=""><label
											for="j-eleven">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="eleven" id="j-eleven" value=""><label
											for="j-eleven">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="eleven" id="j-eleven" value=""><label
											for="j-eleven">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="eleven" id="j-eleven" value=""><label
											for="j-eleven">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12 col-sm-12">
							<div class="single-blog two-column">

								<div class="post-content overflow">
									<h3 class="post-title bold" id="12">12번</h3>


									<div class="post-bottom overflow"  id="112">

										<input type="radio" name="twelve" id="j-twelve" value=""><label
											for="j-twelve">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="twelve" id="j-twelve" value=""><label
											for="j-twelve">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="twelve" id="j-twelve" value=""><label
											for="j-twelve">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="twelve" id="j-twelve" value=""><label
											for="j-twelve">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12 col-sm-12">
							<div class="single-blog two-column">

								<div class="post-content overflow">
									<h3 class="post-title bold" id="13">13번</h3>


									<div class="post-bottom overflow" id="113">

										<input type="radio" name="thirteen" id="j-thirteen" value=""><label
											for="j-thirteen">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="thirteen" id="j-thirteen" value=""><label
											for="j-thirteen">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="thirteen" id="j-thirteen" value=""><label
											for="j-thirteen">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="thirteen" id="j-thirteen" value=""><label
											for="j-thirteen">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12 col-sm-12">
							<div class="single-blog two-column">

								<div class="post-content overflow">
									<h3 class="post-title bold" id="14">14번</h3>


									<div class="post-bottom overflow" id="114">

										<input type="radio" name="fourteen" id="j-fourteen" value=""><label
											for="j-fourteen">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="fourteen" id="j-fourteen" value=""><label
											for="j-fourteen">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="fourteen" id="j-fourteen" value=""><label
											for="j-fourteen">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="fourteen" id="j-fourteen" value=""><label
											for="j-fourteen">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12 col-sm-12">
							<div class="single-blog two-column">

								<div class="post-content overflow">
									<h3 class="post-title bold" id="15">15번</h3>


									<div class="post-bottom overflow" id="115">

										<input type="radio" name="fifteen" id="j-fifteen" value=""><label
											for="j-fifteen">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="fifteen" id="j-fifteen" value=""><label
											for="j-fifteen">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="fifteen" id="j-fifteen" value=""><label
											for="j-fifteen">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="fifteen" id="j-fifteen" value=""><label
											for="j-fifteen">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12 col-sm-12">
							<div class="single-blog two-column">

								<div class="post-content overflow">
									<h3 class="post-title bold" id="16">16번</h3>


									<div class="post-bottom overflow" id="116">

										<input type="radio" name="sixteen" id="j-sixteen" value=""><label
											for="j-sixteen">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="sixteen" id="j-sixteen" value=""><label
											for="j-sixteen">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="sixteen" id="j-sixteen" value=""><label
											for="j-sixteen">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="sixteen" id="j-sixteen" value=""><label
											for="j-sixteen">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12 col-sm-12">
							<div class="single-blog two-column">

								<div class="post-content overflow">
									<h3 class="post-title bold"  id="17">17번</h3>


									<div class="post-bottom overflow"  id="117">

										<input type="radio" name="seventeen" id="j-seventeen" value=""><label
											for="j-seventeen">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="seventeen" id="j-seventeen" value=""><label
											for="j-seventeen">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="seventeen" id="j-seventeen" value=""><label
											for="j-seventeen">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="seventeen" id="j-seventeen" value=""><label
											for="j-seventeen">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12 col-sm-12">
							<div class="single-blog two-column">

								<div class="post-content overflow">
									<h3 class="post-title bold"  id="18">18번</h3>


									<div class="post-bottom overflow" id="118">

										<input type="radio" name="eighteen" id="j-eighteen" value=""><label
											for="j-eighteen">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="eighteen" id="j-eighteen" value=""><label
											for="j-eighteen">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="eighteen" id="j-eighteen" value=""><label
											for="j-eighteen">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="eighteen" id="j-eighteen" value=""><label
											for="j-eighteen">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12 col-sm-12">
							<div class="single-blog two-column">

								<div class="post-content overflow">
									<h3 class="post-title bold"  id="19">19번</h3>


									<div class="post-bottom overflow" id="119">

										<input type="radio" name="nineteen" id="j-nineteen" value=""><label
											for="j-nineteen">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="nineteen" id="j-nineteen" value=""><label
											for="j-nineteen">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="nineteen" id="j-nineteen" value=""><label
											for="j-nineteen">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="nineteen" id="j-nineteen" value=""><label
											for="j-nineteen">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-12 col-sm-12">
							<div class="single-blog two-column">

								<div class="post-content overflow">
									<h3 class="post-title bold" id="20">20번</h3>


									<div class="post-bottom overflow" id="120">

										<input type="radio" name="twenty" id="j-twenty" value=""><label
											for="j-twenty">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="twenty" id="j-twenty" value=""><label
											for="j-twenty">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="twenty" id="j-twenty" value=""><label
											for="j-twenty">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="radio" name="twenty" id="j-twenty" value=""><label
											for="j-twenty">お風呂に入っていた</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
								</div>
							</div>
						</div>

						<div>
							<button type="button" id="success" class="btn">완료</button>
						</div>
						<div class="blog-pagination">
							<!-- <ul class="pagination">
							<li><a href="#">left</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li class="active"><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">6</a></li>
							<li><a href="#">7</a></li>
							<li><a href="#">8</a></li>
							<li><a href="#">9</a></li>
							<li><a href="#">right</a></li>
						</ul> -->
						</div>

						<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■< 문제 >■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
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
					<div class="testimonial bottom">
						<h2>Testimonial</h2>
						<div class="media">
							<div class="pull-left">
								<a href="#"><img src="images/home/profile1.png" alt=""></a>
							</div>
							<div class="media-body">
								<blockquote>Nisi commodo bresaola, leberkas venison
									eiusmod bacon occaecat labore tail.</blockquote>
								<h3>
									<a href="#">- Jhon Kalis</a>
								</h3>
							</div>
						</div>
						<div class="media">
							<div class="pull-left">
								<a href="#"><img src="images/home/profile2.png" alt=""></a>
							</div>
							<div class="media-body">
								<blockquote>Capicola nisi flank sed minim sunt
									aliqua rump pancetta leberkas venison eiusmod.</blockquote>
								<h3>
									<a href="">- Abraham Josef</a>
								</h3>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="contact-info bottom">
						<h2>Contacts</h2>
						<address>
							E-mail: <a href="mailto:someone@example.com">email@email.com</a>
							<br> Phone: +1 (123) 456 7890 <br> Fax: +1 (123) 456
							7891 <br>
						</address>

						<h2>Address</h2>
						<address>
							Unit C2, St.Vincent's Trading Est., <br> Feeder Road, <br>
							Bristol, BS2 0UY <br> United Kingdom <br>
						</address>
					</div>
				</div>
				<div class="col-md-4 col-sm-12">
					<div class="contact-form bottom">
						<h2>Send a message</h2>
						<form id="main-contact-form" name="contact-form" method="post"
							action="sendemail.php">
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
				</div>
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
