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
<title>Notice | POFT</title>
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
	.banner {position:absolute; width: 210px; height: 510px; top: 50px; margin:0 auto; padding:0; overflow: hidden;}
	.banner ul {position: absolute; margin: 0px; padding:0; list-style: none; }
	.banner ul li {float: left; width: 210px; height: 510px; margin:0; padding:0;}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

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
						<li class="dropdown"><a href="#">Page <i class="fa fa-angle-down"></i></a>
							<ul role="menu" class="sub-menu">
							<li><a href="j_test">Japanese Test</a></li>
							<li><a href="it_test">Coding Test</a></li>

								<li><a href="japanese_fairy">Japanese Fairy</a></li>
								<li><a href="coding_puzzle">Coding Puzzle</a></li>
							</ul></li>
						<li class="active" class="dropdown"><a href="#">Board<i class="fa fa-angle-down"></i></a>
							<ul role="menu" class="sub-menu">
								<li class="active"><a href="board_list">Notice</a></li>
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
							<h1 class="title">Notice</h1>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!--/#page-breadcrumb-->

	<!-- board list -->
	<section id="blog" class="padding-top">
		<div class="container">

			<div class="col-md-9 col-sm-7">
				<div class="row">
					<!-- Notice Board -->
					<div class="col-sm-12 col-md-12">
						<div class="user-data m-b-30">

							<div class="sidebar blog-sidebar">
								<div class="sidebar-item  recent">
									<h3>Notice</h3>


									<table class="table">

										<thead>
											<tr align="center">
												<td>NO.</td>
												<td>작성자</td>
												<td>글 제목</td>
												<td>날짜</td>
												<td>조회수</td>
											</tr>
										</thead>

										<tbody>
											<c:forEach var="board" items="${list}" varStatus="stastus">
												<%-- <c:if test="${sessionScope.loginid != null}">  --%>
												<tr align="center">
													<td>${stastus.count + navi.startRecord}</td>
													<td>${board.user_id}</td>
													<td width="300px"><a
														href="boardDetail?board_num=${board.board_num}">${board.title}</a></td>
													<td width="150px">${board.new_date}</td>
													<td width="100px">${board.hitcount}</td>
												</tr>

												<%-- 	</c:if>--%>


											</c:forEach>
										</tbody>
									</table>


									<!-- 페이징  -->
									<div class="blog-pagination">
										<ul class="pagination">
											<li><a href="board_list?currentPage=${navi.currentPage - navi.pagePerGroup}&searchItem=${searchItem}&searchWord=${searchWord}">◁</a></li>
											<li><a href="board_list?currentPage=${navi.currentPage - 1}&searchItem=${searchItem}&searchWord=${searchWord}">◁</a></li>
											

											<c:forEach var="page" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
												<c:if test="${page == currentPage}">
													<li><span>${page}</span></li>&nbsp;
													
												</c:if>
												
												<c:if test="${page != currentPage}">
													<!-- listboard를 누르면 페이지를 요청하는데, 링크건 ${page}값을 받아온다. -->
													<li><a href="board_list?currentPage=${page}&searchItem=${searchItem}&searchWord=${searchWord}">${page}</a></li>&nbsp;
													<!-- 한칸 띄우기 -->
												</c:if>
											</c:forEach>
										
											<li><a href="board_list?currentPage=${navi.currentPage + 1}&searchItem=${searchItem}&searchWord=${searchWord}">▷</a></li>
											<li><a href="board_list?currentPage=${navi.currentPage + navi.pagePerGroup}&searchItem=${searchItem}&searchWord=${searchWord}">▶▶</a></li>
										</ul>
									</div>
									<!-- /페이징  -->
									<c:if test="${sessionScope.user_level eq '1'}">
										<div class="user-data__footer" align="center">
											<button type="button" class="btn btn-submit"
												onclick="location.href='boardWrite' ">Write</button>
										</div>
									</c:if>
								</div>
							</div>
						</div>
						<!-- /Notice Board -->
					</div>
				</div>
			</div>

				<!-- /side bar _____________________________________________-->
			<div class="col-md-3 col-sm-5" style="width: 210px; height: 510px;">
				<div class="banner" class="sidebar-item  recent">
					
						<ul>
							<li><img src="resources/images/100334.png" width="210" height="510"></li>
							<li><img src="resources/images/1011.png" width="210px" height="510px"></li>
							<li><img
								src="resources/images/1012.png"
								width="210" height="510px"></li>
							<li><img
								src="resources/images/1013.png"
								width="210" height="510px"></li>
							<li><img
								src="resources/images/1014.png"
								width="210" height="510"></li>
								<li><img
								src="resources/images/1015.png"
								width="210" height="510"></li>
						</ul>
					
				</div>
			</div>
		</div>

	</section>


	<!--/#blog-->


	<!-- /board list -->

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
