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
<title>Home | POFT</title>
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

<style type="text/css">
.space {
	word-spacing: 30px;
}
</style>
</head>

<!--/head-->


<body>
	<!--header-->
	<header id="header">
		<div class="container" a>
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
						<h1><img src="images/로고.png" alt="logo"></h1>
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
						<li class="dropdown"><a href="#">Board<i class="fa fa-angle-down"></i></a>
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

	<section id="home-slider">
		<div class="container">
			<div class="main-slider">
				<div class="slide-text">
					<h1>Peace Of Fairy Taleへ</h1>
					<p style="font-size: 22px;">ようこそ。</p>
				</div>
				<img src="images/castle2.png" class="img-responsive slider-house"
					alt="slider image">
				<!-- <img src="images/home/slider/slide1/circle1.png" class="slider-circle1" alt="slider image">
                <img src="images/home/slider/slide1/circle2.png" class="slider-circle2" alt="slider image"> 
                <img src="images/home/slider/slide1/cloud1.png" class="slider-cloud1" alt="slider image">-->
				<img src="images/구름1.png" class="slider-cloud2" alt="slider image">
				<img src="images/구름2.png" class="slider-cloud3" alt="slider image">
				<img src="images/main_sun.png" class="slider-sun" alt="slider image">
				<img src="images/마차_main1.png" class="slider-cycle" alt="">
			</div>
		</div>
		<div class="preloader">
			<i class="fa fa-sun-o fa-spin"></i>
		</div>
	</section>
	<!--/#home-slider-->
	<section id="services">
		<div class="container">
			<div class="row">
				<div class="col-sm-4 text-center padding wow fadeIn"
					data-wow-duration="1000ms" data-wow-delay="300ms">
					<div class="single-service">
						<div class="wow scaleIn" data-wow-duration="500ms"
							data-wow-delay="300ms">
							<a href="j_test"><img src="images/test_icon.png" alt=""></a>
						</div>
						<h2>사전 TEST</h2>
						<p>
							사전 TEST을 통해 <br />자신의 레벨을 확인해 보세요.
						</p>
					</div>
				</div>
				<div class="col-sm-4 text-center padding wow fadeIn"
					data-wow-duration="1000ms" data-wow-delay="600ms">
					<div class="single-service">
						<div class="wow scaleIn" data-wow-duration="500ms"
							data-wow-delay="600ms">
							<a href="#learning"><img src="images/main_icon_jap.png"
								alt=""></a>
						</div>
						<h2>Japanese Fairy</h2>
						<p>
							수준별 다양한 동화를 통한 <br />일본어 학습을 할 수 있습니다.
						</p>
					</div>
				</div>
				<div class="col-sm-4 text-center padding wow fadeIn"
					data-wow-duration="1000ms" data-wow-delay="900ms">
					<div class="single-service">
						<div class="wow scaleIn" data-wow-duration="500ms"
							data-wow-delay="900ms">
							<a href="#learning"><img src="images/main_icon_java.png"
								alt=""></a>
						</div>
						<h2>Coding Puzzle</h2>
						<p>
							수준별 다양한 동화를 통한 <br />JAVA를 공부할 수 있습니다.
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/#services-->


	<section id="action" class="responsive">
		<div class="vertical-center">
			<div class="container">
				<div class="row">
					<div class="action take-tour">
						<div class="col-sm-7 wow fadeInLeft" data-wow-duration="500ms"
							data-wow-delay="300ms">
							<h1 class="title">Peace Of Fairy Tale</h1>
							<p>Learn Japanese and Java through various fairy tales</p>
						</div>
						<div class="col-sm-5 text-center wow fadeInRight"
							data-wow-duration="500ms" data-wow-delay="300ms">
							<div class="tour-button"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/#action-->

	<section id="blog" class="padding-bottom">
		<div class="container">
			<div class="row">
				<div class="timeline-blog overflow padding-top">
					<div class="timeline-date text-center">
						<a href="#japanese_Fairy" class="btn btn-common uppercase"
							id="learning">LEARNING</a>
					</div>
					<div class="timeline-divider overflow padding-bottom">
						<div class="col-sm-6 padding-right arrow-right wow fadeInLeft"
							data-wow-duration="1000ms" data-wow-delay="300ms">
							<div class="single-blog timeline">
								<div class="single-blog-wrapper">
									<div class="post-thumb">
										<a href="japanese_fairy"><img src="images/main_japan.png"
											class="img-responsive" alt=""></a>
										<div class="post-overlay">
											<span class="uppercase"><a href="japanese_fairy">Go<br>
													<small>Fairy</small></a></span>
										</div>
									</div>
								</div>
								<div id="japanese_Fairy" class="post-content overflow">
									<h2 class="post-title bold">
										<a href="japanese_fairy">Japanese Fairy</a>
									</h2>

									<p>일본어를 학습할 수 있습니다.</p>

									<div class="post-bottom overflow">

										<span class="comments-number pull-right"><a
											href="japanese_fairy" class="read-more">View More</a></span>
									</div>
								</div>
							</div>
						</div>
						<div
							class="col-sm-6 padding-left padding-top arrow-left wow fadeInRight"
							data-wow-duration="1000ms" data-wow-delay="300ms">
							<div class="single-blog timeline">
								<div class="single-blog-wrapper">
									<div class="post-thumb">
										<a href="coding_puzzle"><img src="images/main_coding.png"
											class="img-responsive" alt=""></a>
										<div class="post-overlay">
											<span class="uppercase"><a href="coding_puzzle">Go<br>
													<small>Puzzle</small></a></span>
										</div>
									</div>
								</div>
								<div class="post-content overflow">
									<h2 class="post-title bold">
										<a href="coding_puzzle">Coding Puzzle</a>
									</h2>

									<p>퍼즐 완성으로 코딩을 학습할 수 있습니다.</p>

									<div class="post-bottom overflow">

										<span class="comments-number pull-right"> <a
											href="coding_puzzle" class="read-more">View More</a></span>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
				<div class="timeline-blog overflow">
					<div class="timeline-date text-center">
						<a href="#" class="btn btn-common">ON TOP</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/#blog-->

	<!--     <section id="features">
        <div class="container">
            <div class="row">
                <div class="single-features">
                    <div class="col-sm-5 wow fadeInLeft" data-wow-duration="500ms" data-wow-delay="300ms">
                        <img src="images/home/image1.png" class="img-responsive" alt="">
                    </div>
                    <div class="col-sm-6 wow fadeInRight" data-wow-duration="500ms" data-wow-delay="300ms">
                        <h2>사전학습</h2>
                        <P>Pork belly leberkas cow short ribs capicola pork loin. Doner fatback frankfurter jerky meatball pastrami bacon tail sausage. Turkey fatback ball tip, tri-tip tenderloin drumstick salami strip steak.</P>
                    </div>
                </div>
                <div class="single-features">
                    <div class="col-sm-6 col-sm-offset-1 align-right wow fadeInLeft" data-wow-duration="500ms" data-wow-delay="300ms">
                        <h2>Built for the Responsive Web</h2>
                        <P>Mollit eiusmod id chuck turducken laboris meatloaf pork loin tenderloin swine. Pancetta excepteur fugiat strip steak tri-tip. Swine salami eiusmod sint, ex id venison non. Fugiat ea jowl cillum meatloaf.</P>
                    </div>
                    <div class="col-sm-5 wow fadeInRight" data-wow-duration="500ms" data-wow-delay="300ms">
                        <img src="images/home/image2.png" class="img-responsive" alt="">
                    </div>
                </div>
                <div class="single-features">
                    <div class="col-sm-5 wow fadeInLeft" data-wow-duration="500ms" data-wow-delay="300ms">
                        <img src="images/home/image3.png" class="img-responsive" alt="">
                    </div>
                    <div class="col-sm-6 wow fadeInRight" data-wow-duration="500ms" data-wow-delay="300ms">
                        <h2>Experienced and Enthusiastic</h2>
                        <P>Ut officia cupidatat anim excepteur fugiat cillum ea occaecat rump pork chop tempor. Ut tenderloin veniam commodo. Shankle aliquip short ribs, chicken eiusmod exercitation shank landjaeger spare ribs corned beef.</P>
                    </div>
                </div>
            </div>
        </div>
    </section>
     /#features -->

	<!-- <section id="clients">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="clients text-center wow fadeInUp" data-wow-duration="500ms" data-wow-delay="300ms">
                        <p><img src="images/home/clients.png" class="img-responsive" alt=""></p>
                        <h1 class="title">Happy Clients</h1>
                        <p>Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. <br> Ut enim ad minim veniam, quis nostrud </p>
                    </div>
                    <div class="clients-logo wow fadeIn" data-wow-duration="1000ms" data-wow-delay="600ms">
                        <div class="col-xs-3 col-sm-2">
                            <a href="#"><img src="images/home/client1.png" class="img-responsive" alt=""></a>
                        </div>
                        <div class="col-xs-3 col-sm-2">
                            <a href="#"><img src="images/home/client2.png" class="img-responsive" alt=""></a>
                        </div>
                         <div class="col-xs-3 col-sm-2">
                            <a href="#"><img src="images/home/client3.png" class="img-responsive" alt=""></a>
                        </div>
                         <div class="col-xs-3 col-sm-2">
                            <a href="#"><img src="images/home/client4.png" class="img-responsive" alt=""></a>
                        </div>
                         <div class="col-xs-3 col-sm-2">
                            <a href="#"><img src="images/home/client5.png" class="img-responsive" alt=""></a>
                        </div>
                         <div class="col-xs-3 col-sm-2">
                            <a href="#"><img src="images/home/client6.png" class="img-responsive" alt=""></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
     </section>
    <--/#clients -->

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