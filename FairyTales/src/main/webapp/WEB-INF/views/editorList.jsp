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

<!-- 팝업 css -->
<style type="text/css">
	* {
	  margin: 0;
	  padding: 0;
	}
	
	body {
	  margin: 100px;
	}
	
	.pop-layer .pop-container {
	  padding: 20px 25px;
	}
	
	.pop-layer p.ctxt {
	  color: #666;
	  line-height: 25px;
	}
	
	.pop-layer .btn-r {
	  width: 100%;
	  margin: 10px 0 20px;
	  padding-top: 10px;
	  border-top: 1px solid #DDD;
	  text-align: right;
	}
	
	.pop-layer {
	  display: none;
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  width: 410px;
	  height: auto;
	  background-color: #fff;
	  border: 5px solid #3571B5;
	  z-index: 10;
	}
	
	.dim-layer {
	  display: none;
	  position: fixed;
	  _position: absolute;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  z-index: 100;
	}
	
	.dim-layer .dimBg {
	  position: absolute;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  background: #000;
	  opacity: .5;
	  filter: alpha(opacity=50);
	}
	
	.dim-layer .pop-layer {
	  display: block;
	}
	
	a.btn-layerClose {
	  display: inline-block;
	  height: 25px;
	  padding: 0 14px 0;
	  border: 1px solid #304a8a;
	  background-color: #3f5a9d;
	  font-size: 13px;
	  color: #fff;
	  line-height: 25px;
	}
	
	a.btn-layerClose:hover {
	  border: 1px solid #091940;
	  background-color: #1f326a;
	  color: #fff;
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
							<h1 class="title">Notice</h1>
							<p>Notice with right sidebar</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/#page-breadcrumb-->
	<section id="blog" class="padding-top">
		<div class="container">
			<div class="col-md-12 col-sm-12">
				<div class="row">
					<!-- Notice Board -->
					<div class="col-sm-12 col-md-12">
						<div class="user-data m-b-30">
							<div class="sidebar blog-sidebar">
								<div class="sidebar-item  recent">
									<h3>동화 리스트</h3>
									<table class="table text-center">
										<thead>
											<tr>
												<td class="col-sm-1 col-md-1">동화코드</td>
												<td class="col-sm-2 col-md-2">레벨</td>
												<td class="col-sm-6 col-md-6">동화명</td>
												<td class="col-sm-2 col-md-2">총챕터수</td>
												<td class="col-sm-1 col-md-1"></td>
											</tr>
										</thead>
										<%--게시판--%>
										<tbody>
											<tr>
												<td colspan="5">
													등록된 동화가 없습니다.
												</td>
											</tr>
											<tr>
												<td>1</td>
												<td>극난이도</td>
												<td><a href="#">어린이동화</a></td>
												<td>100</td>
												<td>
												<a href="#layer2" class="btn-popup"><i class="fa fa-wrench"></i>&nbsp;&nbsp;modify</a>
												</td>
												<%-- <td><input type="button" value="수정"></td> --%>
											</tr>
										</tbody>
										<tfoot>
											<tr>
												<td colspan="5" ></td>
											</tr>
										</tfoot>
										<%--
										<c:forEach var="board" items="${list}" varStatus="s">
											<c:choose>
												<c:when test="${sessionScope.login_id!=board.user_id and board.secret!=null}">
													<tr>
														<td>
															<div class="table-data__info">
																<h6>${s.count}</h6>
															</div>
														</td>
														<td>
															<div class="table-data__info">
																<h6>${board.user_id}</h6>
															</div>
														</td>
														<td class="align_left01">비밀글 입니다.</td>
														<td>
															<div class="rs-select2--trans rs-select2--sm">
																<span class="role admin">${board.new_date}</span>
															</div>

														</td>
														<td><span class="more"> <i
																class="zmdi zmdi-more">${board.hitcount}</i>
														</span></td>
													</tr>
												</c:when>
												<c:otherwise>
													<tr>
														<td>
															<div class="table-data__info">
																<h6>${s.count}</h6>
															</div>
														</td>
														<td>
															<div class="table-data__info">
																<h6>${board.user_id}</h6>
															</div>
														</td>
														<td><span class="role admin"><a
																href="post?board_num=${board.board_num}" onclick="">${board.title}</a></span>
														</td>
														<td>
															<div class="rs-select2--trans rs-select2--sm">
																<span class="role admin">${board.new_date}</span>
															</div>
														</td>
														<td><span class="more"> <i
																class="zmdi zmdi-more">${board.hitcount}</i>
														</span></td>
													</tr>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										</tbody>
										--%>
									</table>

									<div class="user-data__footer" align="center">
										<%-- 새로등록 --%>
										<a href="#layer2" class="btn btn-submit btn-popup">Register</a>
									</div>
									<c:if test="${sessionScope.user_level eq '1'}">
									</c:if>
									<%--<<<페이징>>>
									<div class="blog-pagination">
										<ul class="pagination">
											<li><a
												href="board_1to1?currentPage=${navi.currentPage - navi.pagePerGroup}&searchItem=${searchItem}&searchWord=${searchWord}">◁</a></li>
											<li><a
												href="board_1to1?currentPage=${navi.currentPage-1}&searchItem=${searchItem}&searchWord=${searchWord}">◁</a></li>

											<c:forEach var="page" begin="${navi.startPageGroup}"
												end="${navi.totalPageCount}">

												<c:if test="${page==currentPage}">
													<li class="active">${page}</li>&nbsp;
												</c:if>

												<c:if test="${page!=currentPage}">
													<li><a
														href="board_1to1?currentPage=${page}&searchItem=${searchItem}&searchWord=${searchWord}">${page}
													</a></li>&nbsp;
												</c:if>
											</c:forEach>
											<li><a
												href="board_1to1?currentPage=${navi.currentPage+1}&searchItem=${searchItem}&searchWord=${searchWord}">▷</a></li>
											<li><a
												href="board_1to1?currentPage=${navi.currentPage+navi.pagePerGroup}&searchItem=${searchItem}&searchWord=${searchWord}">▷▷</a></li>
										</ul>
									</div>
									--%>
								</div>
							</div>
						</div>
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
	
	
	
	
	<!-- 팝업 HTML -->
	<div style="height: 300px;"></div>
	<a href="#layer1" class="btn-example">일반 팝업레이어</a>
	<div id="layer1" class="pop-layer">
	    <div class="pop-container">
	        <div class="pop-conts">
	            <!--content //-->
	            <p class="ctxt mb20">Thank you.<br>
	                Your registration was submitted successfully.<br>
	                Selected invitees will be notified by e-mail on JANUARY 24th.<br><br>
	                Hope to see you soon!
	            </p>
	
	            <div class="btn-r">
	                <a href="#" class="btn-layerClose">Close</a>
	            </div>
	            <!--// content-->
	        </div>
	    </div>
	</div>
	<br/><br/>
	<a href="#layer2" class="btn-example">딤처리 팝업레이어 1</a>
	<div class="dim-layer">
	    <div class="dimBg"></div>
	    <div id="layer2" class="pop-layer">
	        <div class="pop-container">
	            <div class="pop-conts">
	                <!--content //-->
	                <p class="ctxt mb20">Thank you.<br>
	                    Your registration was submitted successfully.<br>
	                    Selected invitees will be notified by e-mail on JANUARY 24th.<br><br>
	                    Hope to see you soon!
	                </p>
	
	                <div class="btn-r">
	                    <a href="#" class="btn-layerClose">Close</a>
	                </div>
	                <!--// content-->
	            </div>
	        </div>
	    </div>
	</div>
	<!-- /팝업 HTML -->
	
	<!--/#footer-->
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/lightbox.min.js"></script>
	<script type="text/javascript" src="js/wow.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
	
	<!-- 팝업 스크립트 -->
	<script type="text/javascript">
		$(document).ready(function() {
			$('.btn-popup').click(function(){
			    var $href = $(this).attr('href');
			    layer_popup($href);
			});
			function layer_popup(el){
				
			    var $el = $(el);        //레이어의 id를 $el 변수에 저장
			    var isDim = $el.prev().hasClass('dimBg');   //dimmed 레이어를 감지하기 위한 boolean 변수
			    alert("isDim :" + isDim);
			    isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();
			
			    var $elWidth = ~~($el.outerWidth()),
			        $elHeight = ~~($el.outerHeight()),
			        docWidth = $(document).width(),
			        docHeight = $(document).height();
			
			    // 화면의 중앙에 레이어를 띄운다.
			    if ($elHeight < docHeight || $elWidth < docWidth) {
			        $el.css({
			            marginTop: -$elHeight /2,
			            marginLeft: -$elWidth/2
			        })
			    } else {
			        $el.css({top: 0, left: 0});
			    }
			
			    $el.find('a.btn-layerClose').click(function(){
			        isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
			        return false;
			    });
			
			    $('.layer .dimBg').click(function(){
			        $('.dim-layer').fadeOut();
			        return false;
			    });
			};
		});
	</script>
</body>
</html>