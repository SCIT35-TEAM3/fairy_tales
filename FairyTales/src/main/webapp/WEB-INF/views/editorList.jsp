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

<!-- ポップアップ css -->
<style type="text/css">
	.pop-layer .pop-container {
	  padding: 20px 25px;
	}
	
	.pop-layer {
	  display: none;
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  width: 410px;
	  height: auto;
	  background-color: #fff;
	  border: 5px solid #a5732c;
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
	
	a.btn-layer {
	  display: inline-block;
	  height: 30px;
	  padding: 0 14px 0;
	  font-size: 13px;
	  line-height: 25px;
	}
</style>
<!-- ポップアップ css -->

</head>
<body>
	<!--header-->
	<header id="header">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 overflow">
					<div class="social-icons pull-right">
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
							<h1 class="title">FairyTales</h1>
							<p>FairyTales List</p>
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
<%-------------------------------- 本文 // ------------------------------------%>
									<h3>동화 리스트</h3>
									<table class="table text-center">
										<thead>
											<tr>
												<td class="col-sm-1 col-md-1">동화번호</td>
												<td class="col-sm-1 col-md-1">분류</td>
												<td class="col-sm-1 col-md-1">레벨</td>
												<td class="col-sm-6 col-md-6">동화명</td>
												<td class="col-sm-1 col-md-1">총챕터수</td>
												<td class="col-sm-2 col-md-2"></td>
											</tr>
										</thead>
										<%--게시판--%>
										<tbody>
											<c:if test="${empty fairytales}">
												<tr>
													<td colspan="6">
														등록된 동화가 없습니다.
													</td>
												</tr>
											</c:if>
											<c:if test="${!empty fairytales}">
												<c:forEach items="${fairytales}" var="fairy">
													<tr>
														<td class="fpk"><c:out value="${fairy.fairy_pk}" /></td>
														<td class="fcode">
															<input class="fcode" type="hidden" value="${fairy.fairy_code}"/>
															<c:if test="${fairy.fairy_code == 'jp' }">日本語</c:if>
															<c:if test="${fairy.fairy_code == 'cd'}">JAVA</c:if>
														</td>
														<td class="flevel">
															<input class="flevel" type="hidden" value="${fairy.fairy_level}"/>
															<c:if test="${fairy.fairy_level == 1}">초급</c:if>
															<c:if test="${fairy.fairy_level == 2}">중급</c:if>
															<c:if test="${fairy.fairy_level == 3}">고급</c:if>
														<td class="fname"><a href="editorAdd?fpk=${fairy.fairy_pk}"><c:out value="${fairy.fairy_name}" /></a></td>
														<td class="fchapter"><c:out value="${fairy.fairy_chapter}" /></td>
														<td>
															<a href="#layer2" class="btn-popup"><i class="fa fa-wrench"></i>&nbsp;&nbsp;MODIFY</a>
														</td>
													</tr>
												</c:forEach>
											</c:if>
										</tbody>
										<tfoot>
											<tr>
												<td colspan="6" ></td>
											</tr>
										</tfoot>
									</table>

									<div class="user-data__footer" align="center">
										<%-- 새로등록 --%>
										<a href="#layer1" class="btn btn-submit btn-popup">Register</a>
									</div>
									<c:if test="${sessionScope.user_level eq '1'}">
									</c:if>
<%-------------------------------- // 本文 ------------------------------------%>
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
<!--------------- ポップアップ HTML // --------------->
	<div class="dim-layer">
	    <div class="dimBg"></div>
	    <div id="layer" class="pop-layer">
	        <div class="pop-container">
	            <div class="pop-conts">
	            	<!-- <form method="post" id="pop"> -->
						<input type="hidden" id="fpk" name="fpk">
						<table class="table text-center">
							<tr>
								<td>
									<b>분류</b>
								</td>
								<td>
									<select id="fcode" name = "fcode">
										<option value="jp">日本語
										<option value="cd">JAVA
									</select>
								</td>
							</tr>
							<tr>
								<td>
									<b>난이도</b>
								</td>
								<td>
									<select id="flevel" name = "flevel">
										<option value="1">초급
										<option value="2">중급
										<option value="3">고급
									</select>
								</td>
							</tr>
							<tr>
								<td>
									<b>동화명</b>
								</td>
								<td>
									<input type="text" id="fname" name="fname" style = "text-align:center;" >
								</td>
							</tr>
							<tr>
								<td>
									<b>총 챕터수</b>
								</td>
								<td>
									<input type="number" id="fchapter" name="fchapter" style = "text-align:center;" >
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<br>
									<a href="#" id="btnSubmit" class="btn btn-submit btn-layer">Register</a>
									<a href="#" id="btnDelet" class="btn btn-submit btn-layer">Delete</a>
		                			<a href="#" id="btnClose" class="btn btn-submit btn-layer">Close</a>
								</td>
							</tr>
						</table>
					<!-- </form> -->
	                <!--// content-->
	            </div>
	        </div>
	    </div>
	</div>
<!--------------- // ポップアップ HTML --------------->
	
	<!--/#footer-->
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/lightbox.min.js"></script>
	<script type="text/javascript" src="js/wow.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
	
	<!-- ポップアップ 스크립트 // -->
	<script type="text/javascript">
		$(document).ready(function() {
			$('.btn-popup').click(function(){
				var $href = $(this).attr('href');
				layer_popup($href,$(this));
				return false;
			});
			
			$('#btnSubmit').click(function(){insertFt(); return false;});
		});
		
		function layer_popup(el,$element){
			<%-- #layer수행번호 --%>
			if(el.substr(6) == 1){
				$("#fpk").val('');
				$("#flevel").val(1);
				$("#fname").val('');
				$("#fchapter").val('');
				$("#fcode").val('jp');
				$("#btnDelet").hide();
				$("#btnSubmit").html("Register");
			}else if(el.substr(6) == 2){
				var $parent = $element.parent().parent();
				$("#fpk").val($parent.children('.fpk').html());
				$("#flevel").val($parent.children('.flevel').children('.flevel').val());
				$("#fname").val($parent.children('.fname').children('a').html());
				$("#fchapter").val($parent.children('.fchapter').html());
				$("#fcode").val($parent.children('.fcode').children('.fcode').val());
				$("#btnDelet").show();
				$("#btnSubmit").html("MODIFY");
			}
			
			var $el = $(el.substr(0,6));				//레이어의 id를 $el 변수에 저장
			var isDim = $el.prev().hasClass('dimBg');	//dimmed 레이어를 감지하기 위한 boolean 변수
			
			isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();
			
			var  $elWidth  = $el.outerWidth()
			  	,$elHeight = $el.outerHeight()
			  	,docWidth  = $(document).width()
			  	,docHeight = $(document).height();
			
			// 中央に出力
			if ($elHeight < docHeight || $elWidth < docWidth) {
			    $el.css({
			    	  marginTop : -$elHeight/2
			    	, marginLeft: -$elWidth/2
			    })
			} else {
				$el.css({top: 0, left: 0});
			}
			  
			$el.find('#btnClose').click(function(){
				isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 레이어 닫기
				return false;
			});
			
			$el.find('#btnDelet').click(function(){
				deleteFt();
				return false;
			});
			
			$('.layer .dimBg').click(function(){
				$('.dim-layer').fadeOut();
				return false;
			});
		};
		
		//貯蔵 / 修整
		function insertFt(){
			var fpk	= $("#fpk").val();
			var flevel = $("#flevel").val();
			var fname = $("#fname").val();
			var fchapter = $("#fchapter").val();
			var fcode = $("#fcode").val();
			
			var parameter = {"fairy_level":flevel,"fairy_name":fname,"fairy_chapter":fchapter,"fairy_code":fcode,"fairy_pk":fpk};
			
			$.ajax({
					  url		: "inFT"
					, type		: "post"			
					, data		: JSON.stringify(parameter)
					, contentType	:	"application/json; charset=utf-8"
					, dataType	: "text"
					, success	: function (response) {
						//alert(response);
						window.location.href='editorList';
					}
			});
		}
		
		//削除
		function deleteFt(){
			var fpk	= $("#fpk").val();
			if(fpk == ''){
				alert("잘못된 선택입니다.");
				return false;
			}
			console.log(fpk);
			$.ajax({
					  url		: "deleteFT"
					, type		: "post"			
					, data		: {"fpk" : fpk}
					, dataType	: "text"
					, success	: function (response) {
						//alert(response);
						window.location.href='editorList';
					}
			});
		}
	</script>
	<!-- // ポップアップ 스크립트 -->
</body>
</html>