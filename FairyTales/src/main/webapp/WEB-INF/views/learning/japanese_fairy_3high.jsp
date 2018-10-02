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
<title>Japanese | POFT</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/lightbox.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<link href="css/component.css" rel="stylesheet">

<link href="css/normalize.css" rel="stylesheet">
<!-- <link href="css/animate.min.css" rel="stylesheet"> -->
<script type="text/javascript" src="js/snap.svg-min.js"></script>
<script type="text/javascript" src="js/anime.min.js"></script>

<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<!-- 페이지 넘기기 -->
<link rel="stylesheet" type="text/css" href="css/default1.css" />
<link rel="stylesheet" type="text/css" href="css/bookblock.css" />
<link rel="stylesheet" type="text/css" href="css/demo5.css" />
<script src="js/modernizr.custom1.js"></script>


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

<!-- 팝업창 css -->
<style>
#popupDiv { /* 팝업창 css */
	top: 0px;
	position: absolute;
	background-image: url("resources/images/배경.png");
	width: 1200px;
	height: 800px;
	display: none;
}

#popup_mask { /* 팝업 배경 css */
	position: fixed;
	width: 100%;
	height: 1000px;
	top: 0px;
	right: 0px;
	display: none;
	background-color: #000;
	opacity: 0.8;
}

#popCloseBtn {
	
}
</style>
<!-- /팝업창 css -->

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
						<li class="active" class="dropdown"><a href="#">Page <i class="fa fa-angle-down"></i></a>
							<ul role="menu" class="sub-menu">
								<li><a href="j_test">Japanese Test</a></li>
								<li><a href="it_test">Coding Test</a></li>

								<li class="active"><a href="japanese_fairy">Japanese Fairy</a></li>
								<li><a href="coding_puzzle">Coding Puzzle</a></li>
							</ul></li>
						<li class="dropdown"><a href="#">Board<i class="fa fa-angle-down"></i></a>
							<ul role="menu" class="sub-menu">
								<li><a href="board_list">Notice</a></li>
								<li><a href="board_1to1">1:1 Customer Board</a></li>
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
							<h1 class="title">Japanese Fairy</h1>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/#action-->



	<div>
		<!-- 	<button id="popOpenBtn">Popup Open</button>-->
		<div id="popup_mask"></div>
		<!-- 팝업 배경 DIV -->

		<div id="popupDiv" align="right">
			<!-- 팝업창 -->
			<button id="popCloseBtn">close</button>
		</div>
	</div>
	<!-- /팝업창  -->

	<div class="col-md-3 col-sm-3">
		<section id="projects" class="padding-top">
			<div class="container">
				<div class="row" style="padding-left: 200px">
					<div class="col-md-3 col-sm-4">
						<div class="sidebar portfolio-sidebar">
							<div class="sidebar-item categories">
								<h3>Fairy Level</h3>
								<ul class="nav navbar-stacked">
									<li><a href="japanese_fairy_1beginner">초급<span class="pull-right"><i class="fa fa-arrow-right"></i></span></a></li>
									<li><a href="japanese_fairy_2intermediate">중급<span class="pull-right"><i class="fa fa-arrow-right"></i></span></a></li>
									<li class="active"><a href="japanese_fairy_3high">고급<span class="pull-right"><i class="fa fa-arrow-right "></i></span></a></li>

								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<!--/Fairy Level sidebar-->

	<!-- 페이지 넘기기 -->
		<div class="col-md-9 col-sm-9">
			<div class="main clearfix">
				<ul class="bb-custom-grid" id="bb-custom-grid">
					<li>
						<h3>신데렐라</h3>
						<div class="bb-bookblock">
							<div class="bb-item">
								<a href="cendrillon_screen1"  onClick="window.open(this.href, '', 'width=1120, height=630, top=30%,left=30%'); return false;">
								<img src="images/learningPage/신데렐라1.png" alt="image01" /></a>
							</div>
							<div class="bb-item">
								<a href="cendrillon_screen2"  onClick="window.open(this.href, '', 'width=1120, height=630, top=30%,left=30%'); return false;">
								<img src="images/learningPage/신데렐라2.png" alt="image02" /></a>
							</div>
							<div class="bb-item">
								<a href="custom_screen1?sin=3&screen=1"><img src="images/learningPage/신데렐라3.png" alt="image03" /></a>
							</div>
							<div class="bb-item">
								<a href="#"><img src="images/learningPage/신데렐라3.png" alt="image03" /></a>
							</div>
							<div class="bb-item">
								<a href="#"><img src="images/demo3/3.jpg" alt="image03" /></a>
							</div>
							<div class="bb-item">
								<a href="#"><img src="images/demo3/3.jpg" alt="image03" /></a>
							</div>
						</div>
						<nav>
							<span class="bb-current"></span> <span></span> <span></span><span></span><span></span><span></span>
						</nav>
					</li>
					<li>
						<h3>어린 왕자</h3>
						<div class="bb-bookblock">
							<div class="bb-item">
								<a href="#"><img src="images/learningPage/어린왕자1.png" alt="image01" /></a>
							</div>
							<div class="bb-item">
								<a href="#"><img src="images/learningPage/어린왕자2.png" alt="image02" /></a>
							</div>
							<div class="bb-item">
								<a href="#"><img src="images/demo3/3.jpg" alt="image03" /></a>
							</div>
						</div>
						<nav>
							<span class="bb-current"></span> <span></span> <span></span>
						</nav>
					</li>
					<li>
						<h3>오즈의 마법사</h3>
						<div class="bb-bookblock">
							<div class="bb-item">
								<a href="#"><img src="images/learningPage/오즈의 마법사1.png" alt="image01" /></a>
							</div>
							<div class="bb-item">
								<a href="#"><img src="images/learningPage/오즈의 마법사2.png" alt="image02" /></a>
							</div>
							<div class="bb-item">
								<a href="#"><img src="images/demo3/3.jpg" alt="image03" /></a>
							</div>
						</div>
						<nav>
							<span class="bb-current"></span> <span></span> <span></span>
						</nav>
					</li>
					<li>
						<h3>이상한 나라의 앨리스</h3>
						<div class="bb-bookblock">
							<div class="bb-item">
								<a href="#"><img src="images/learningPage/이상한 나라의 앨리스1.png" alt="image01" /></a>
							</div>
							<div class="bb-item">
								<a href="#"><img src="images/learningPage/이상한 나라의 앨리스2.png" alt="image02" /></a>
							</div>
							<div class="bb-item">
								<a href="#"><img src="images/demo3/3.jpg" alt="image03" /></a>
							</div>
						</div>
						<nav>
							<span class="bb-current"></span> <span></span> <span></span>
						</nav>
					</li>
				</ul>
			</div>
		</div>
	<!-- /페이지 넘기기 -->

<!-- 	<div class="col-md-9 col-sm-9" style="padding-top: 70px">
		<section id="grid" class="grid clearfix cross-1">

			<a href="#" data-path-hover="m 180,34.57627 -180,0 L 0,0 180,0 z"
				class="popOpen">
				<figure>
					<img src="images/img/1.png" />
					<svg viewBox="0 0 180 320" preserveAspectRatio="none">
						<path d="M 180,160 0,218 0,0 180,0 z" /></svg>
					<figcaption>
						<h2>초급</h2>
						<p>장갑</p>
						<button>View</button>
					</figcaption>
				</figure>
			</a> <a href="#" data-path-hover="m 180,34.57627 -180,0 L 0,0 180,0 z"
				class="popOpen">
				<figure>
					<img src="images/img/2.png" />
					<svg viewBox="0 0 180 320" preserveAspectRatio="none">
						<path d="M 180,160 0,218 0,0 180,0 z" /></svg>
					<figcaption>
						<h2>중급</h2>
						<p>신데렐라</p>
						<button>View</button>
					</figcaption>
				</figure>
			</a> <a href="#" data-path-hover="m 180,34.57627 -180,0 L 0,0 180,0 z"
				class="popOpen">
				<figure>
					<img src="images/img/1.png" />
					<svg viewBox="0 0 180 320" preserveAspectRatio="none">
						<path d="M 180,160 0,218 0,0 180,0 z" /></svg>
					<figcaption>
						<h2>고급</h2>
						<p>장화신은 고양이</p>
						<button>View</button>
					</figcaption>
				</figure>
			</a>
		</section>
	</div> -->
	<!--/Japanese Fairy animation-->

	<!-- footer -->
	<footer id="footer">
		<div class="container">
			<div class="row">
				<div class="row">
					<div class="col-sm-12 text-center bottom-separator">
						<br/><br/><br/>
						<img src="images/home/under.png" class="img-responsive inline" alt="">
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
						<p>Designed by C class 3Group</p>
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
	<script type="text/javascript" src="js/audio.min.js"></script>
	<script>
		audiojs.events.ready(function() {
			var as = audiojs.createAll();
		});
	</script>
	<script type="text/javascript" src="js/masonry.min.js"></script>
	<script type="text/javascript" src="js/hovers.js"></script>
	<script type="text/javascript" src="js/main1.js"></script>

	<script>
		(function() {

			function init() {
				var speed = 250, easing = mina.easeinout;

				[].slice.call(document.querySelectorAll('#grid > a')).forEach(
						function(el) {
							var s = Snap(el.querySelector('svg')), path = s
									.select('path'), pathConfig = {
								from : path.attr('d'),
								to : el.getAttribute('data-path-hover')
							};

							el.addEventListener('mouseenter', function() {
								path.animate({
									'path' : pathConfig.to
								}, speed, easing);
							});

							el.addEventListener('mouseleave', function() {
								path.animate({
									'path' : pathConfig.from
								}, speed, easing);
							});
						});
			}

			init();

		})();
	</script>

	<!-- 팝업창 스크립트 -->
	<script>
		$(document)
				.ready(
						function() {

							$(".popOpen")
									.click(
											function(event) { //팝업 Open 버튼 클릭 시 

												$("#popupDiv")
														.css(
																{
																	"top" : (($(
																			window)
																			.height() - $(
																			"#popupDiv")
																			.outerHeight()) / 2 + $(
																			window)
																			.scrollTop())
																			+ "px",
																	"left" : (($(
																			window)
																			.width() - $(
																			"#popupDiv")
																			.outerWidth()) / 2 + $(
																			window)
																			.scrollLeft())
																			+ "px"
																//팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정

																});
												$("#popupDiv").css({
													"zIndex" : 13
												});

												$("#popup_mask").css("display",
														"block"); //팝업 뒷배경 display block
												$("#popupDiv").css("display",
														"block"); //팝업창 display block

												$("body").css("overflow",
														"hidden");//body 스크롤바 없애기
											});

							//
							$("#popCloseBtn").click(function(event) {
								$("#popup_mask").css("display", "none"); //팝업창 뒷배경 display none
								$("#popupDiv").css("display", "none"); //팝업창 display none
								$("body").css("overflow", "auto");//body 스크롤바 생성

							});
						});
	</script>
	<!-- /팝업창 스크립트 -->

	<!-- 페이지 넘기기 JS -->

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="js/jquerypp.custom.js"></script>
	<script src="js/jquery.bookblock.js"></script>
	<script type="text/javascript">
		var Page = (function() {

			var $grid = $('#bb-custom-grid');

			return {
				init : function() {
					$grid
							.find('div.bb-bookblock')
							.each(
									function(i) {

										var $bookBlock = $(this), $nav = $bookBlock
												.next().children('span'), bb = $bookBlock
												.bookblock({
													speed : 600,
													shadows : false
												});

										// add navigation events
										$nav
												.each(function(i) {
													$(this)
															.on(
																	'click touchstart',
																	function(
																			event) {
																		var $dot = $(this);
																		$nav
																				.removeClass('bb-current');
																		$dot
																				.addClass('bb-current');
																		$bookBlock
																				.bookblock(
																						'jump',
																						i + 1);
																		return false;
																	});
												});

										// add swipe events
										$bookBlock.children().on({
											'swipeleft' : function(event) {
												$bookBlock.bookblock('next');
												return false;
											},
											'swiperight' : function(event) {
												$bookBlock.bookblock('prev');
												return false;
											}

										});

									});
				}
			};

		})();
	</script>
	<script>
		Page.init();
	</script>
</body>
</html>
