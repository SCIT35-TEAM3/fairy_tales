<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Coding Puzzle</title>

<meta name="description" content="" />
<meta name="keywords" content="" />

<meta name="author" content="">
<link rel="shortcut icon" href="../favicon.ico">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/lightbox.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<link href="css/default_puzzle.css" rel="stylesheet" />
<link href="css/component_puzzle.css" rel="stylesheet" />
<link href="css/fairy_menu.css" rel="stylesheet">

<link rel="shortcut icon" href="images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="images/ico/apple-touch-icon-57-precomposed.png">

<script src="js/modernizr.custom.js"></script>
<script type="text/javascript" src="js/snap.svg-min.js"></script>
<script type="text/javascript" src="js/anime.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<style>
/* 노말라이즈 */
body, ul, li {
    margin:0;
    padding:0;
    list-style:none;
}

a {
    color:inherit;
    text-decoration:inherit;
}

/* 라이브러리 */
.con {
    max-width:1000px;
    margin:0 auto;
}

.img-box > img {
    width:100%;
    display:block;
}

/* 커스텀 */
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.part-5 .head > ul::after {
    content:"";
    display:block;
    clear:both;
}

.part-5 .head > ul > li:first-child {
    border-left-width:1px;
}

/* 이렇게 하면 완벽합니다. */
.part-5 .head > ul > li.active::before {
    content:"";
    position:absolute;
    bottom:-1px;
    left:0;
    width:100%;
    height:1px;
    background-color:white;
}

.part-5 .head > ul > li > a {
    display:block;
    padding:10px;
}

.part-5 .body > div {
    display:none;
    border:1px solid blue;
    border-top:0;
}

.part-5 .body > div.active {
    display:block;
}
</style>
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
							<h1 class="title">Coding Puzzle</h1>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/#action-->


	<div class="col-md-3 col-sm-3">
		<section id="projects" class="padding-top">
			<div class="container">
				<div class="row" style="padding-left: 80px">

					<!-- 레벨분류(초급, 중급, 고급) 사이드바-->
					<div class="col-md-3 col-sm-4">

						<div class="sidebar portfolio-sidebar">
							<div class="sidebar-item categories">
								<h3>Fairy Level</h3>
								<ul class="nav navbar-stacked">
									<li><a href="coding_fairy_1beginner">초급<span class="pull-right"><i class="fa fa-arrow-right"></i></span></a></li>
									<li><a href="coding_fairy_2intermediate">중급<span class="pull-right"><i class="fa fa-arrow-right"></i></span></a></li>
									<li class="active"><a href="coding_fairy_3high">고급<span class="pull-right"><i class="fa fa-arrow-right"></i></span></a></li>
								</ul>
							</div>

						</div>
					</div>
					<!-- /레벨분류(초급, 중급, 고급) 사이드바-->

					<!-- 초급동화 애니메이션 -->
					<div class="col-md-9 col-sm-9">
						<div class="container demo-3">
							<ul class="grid cs-style-6" style="width: 1400px;">
								<li>
									<figure>
										<img src="images/1.png" alt="img05">
										<figcaption>
											<h3>고급동화이름1</h3>
											<span>Jacob Cummings</span> <a href="#">Take a look</a>
										</figcaption>
									</figure>
								</li>
								<li>
									<figure>
										<img src="images/3.png" alt="img06">
										<figcaption>
											<h3>고급동화이름1</h3>
											<span>Jacob Cummings</span> <a href="#">Take a look</a>
										</figcaption>
									</figure>
								</li>
								<li>
									<figure>
										<img src="images/2.png" alt="img02">
										<figcaption>
											<h3>고급동화이름1</h3>
											<span>Jacob Cummings</span> <a href="#">Take a look</a>
										</figcaption>
									</figure>
								</li>
							</ul>
						</div>
						<!-- /container demo-3 -->
					</div>
					<!-- /col-md-9 col-sm-9 -->
				</div>
				<!-- /초급동화 애니메이션 -->
		</section>
	</div>
	<!-- /Japanese Fairy  -->



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
	<!-- /container -->
	<script src="js/fairy-menu.js"></script>
	<script src="js/toucheffects.js"></script>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/lightbox.min.js"></script>
	<script type="text/javascript" src="js/wow.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
	<script>
	$('.part-5 .head > ul > li').click(function() {
	    // 클릭된 당사자 => this
	    // 이 함수를 실행한 주어 => this
	    // $(this) => 이거 포장해주세요.
	    // 굳이 포장을 하는 이유
	    var $클릭된_녀석 = $(this);
	    
	    var $part5 = $클릭된_녀석.closest('.part-5');
	    //var $part5 = $클릭된_녀석.parent().parent().parent(); // $part5를 얻는 또 다른 방법
	    // 오직 $part5 안에서만 .body 로 검색해서 나온 것들 포장해주세요.
	    var $body = $part5.find('.body');
	    
	    // 기존에 active 가진 녀석에게 active 빼앗기
	    $클릭된_녀석.parent().find('.active').removeClass('active');
	    $클릭된_녀석.addClass('active');
	    
	    // 클릭된 녀석이 형제 중에서 몇 번째 인지 확인(참고로 0부터 셉니다.);
	    var index = $클릭된_녀석.index();
	    
	    // part-5 라는 클래스를 가진 나의 조상중에 나랑 가장 가까운 1개를 포장해주세요.
	    
	    // 기존의 active 된 요소들에서 active 제거
	    $body.find('.active').removeClass('active');
	    
	    $body.find('div:nth-child(' + (index + 1) + ')').addClass('active');
	});
	</script>
</body>
</html>