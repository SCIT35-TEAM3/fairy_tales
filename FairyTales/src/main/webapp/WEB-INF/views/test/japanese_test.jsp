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
<title>Blog Default | Triangle</title>
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
	<style type="text/css">	
	/* banner */
	.banner {position:absolute; width: 255px; height: 610px; top: 50px;  margin:0 auto; padding:0; overflow: hidden;}
	.banner ul {position: absolute; margin: 0px; padding:0; list-style: none; }
	.banner ul li {float: left; width: 255px; height: 610px; margin:0; padding:0;}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/j_test.js"></script>

<script >

	$(document).ready(function() {
		var $banner = $(".banner").find("ul");
		

		var $bannerWidth = $banner.children().outerWidth();//이미지의 폭
		var $bannerHeight = $banner.children().outerHeight(); // 높이
		var $length = $banner.children().length;//이미지의 갯수
		var rollingId;

		//정해진 초마다 함수 실행
		rollingId = setInterval(function() { rollingStart(); }, 3000);//다음 이미지로 롤링 애니메이션 할 시간차
    
		function rollingStart() {
			$banner.css("width", $bannerWidth * $length + "px");
			$banner.css("height", $bannerHeight + "px");
			//alert(bannerHeight);
			//배너의 좌측 위치를 옮겨 준다.
			$banner.animate({left: - $bannerWidth + "px"}, 1500, function() { //숫자는 롤링 진행되는 시간이다.
				//첫번째 이미지를 마지막 끝에 복사(이동이 아니라 복사)해서 추가한다.
				$(this).append("<li>" + $(this).find("li:first").html() + "</li>");
				//뒤로 복사된 첫번재 이미지는 필요 없으니 삭제한다.
				$(this).find("li:first").remove();
				//다음 움직임을 위해서 배너 좌측의 위치값을 초기화 한다.
				$(this).css("left", 0);
				//이 과정을 반복하면서 계속 롤링하는 배너를 만들 수 있다.
			});
		}
		var floatPosition = parseInt($("#banner").css('top'));
		// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

		$(window).scroll(function() {
			// 현재 스크롤 위치를 가져온다.
			var scrollTop = $(window).scrollTop();
			var newPosition = scrollTop + floatPosition + "px";

			/* 애니메이션 없이 바로 따라감
			 $("#floatMenu").css('top', newPosition);
			 */

			$("#banner").stop().animate({
				"top" : newPosition
			}, 500);

		}).scroll();
	}); 

</script>

</head>
<!--/head-->

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
							<h1 class="title">Test</h1>
							<p>Japanese</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section id="blog" class="padding-top">
		<div class="container">
			<div class="row">
			
				<!-- sidebar -->
				<div class="col-md-3 col-sm-5">
                   <div class="sidebar blog-sidebar">
                   	 <div class="sidebar-item categories">
                           <h3>Test</h3>
                            <ul class="nav navbar-stacked">
                                <li class="active"><a href="j_test">Japanese Test<span class="pull-right"><i class="fa fa-arrow-right"></i></span></a></li>
                                <li><a href="it_test">Coding Test<span class="pull-right"><i class="fa fa-arrow-right"></i></span></a></li>
                             
                            </ul>
                        </div>
					</div>
				</div>
				<!-- /sidebar -->
				
				<div class="col-md-9 col-sm-7" style="padding-left: 100px">
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

						<div align="center">
							<button type="button" id="success" class="btn btn-submit">완 료</button>
						</div>
						<div class="blog-pagination">
						</div>

						<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■< 문제 >■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
					</div>
				</div>
				
            </div>
        </div>
    </section>

	<!--/#blog-->

	<!-- footer -->
	<footer id="footer">
		<div class="container">
			<div class="row">
				<div class="row">
					<div class="col-sm-12 text-center bottom-separator">
						<img src="images/home/under.png" class="img-responsive inline"
							alt="">
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
