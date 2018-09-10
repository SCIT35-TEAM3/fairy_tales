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


<script type="text/javascript">
	$(document).ready(function() {
		$(".form-control").popover({
			title : "Search Here",
			placement : "top"
		});
	})
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
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <a class="navbar-brand" href="./">
                    	<h1><img src="images/로고.png" alt="logo"></h1>
                    </a>
                    
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="./">Home</a></li>
                        <li class="dropdown"><a href="#">Page <i class="fa fa-angle-down"></i></a>
                            <ul role="menu" class="sub-menu">
                            
                            	<li><a href="japanese_fairy">Japanese Fairy</a></li>
                                <li><a href="coding_puzzle">Coding Puzzle</a></li>
                            </ul>
                        </li>                    
                        <li class="dropdown"><a href="#">Board<i class="fa fa-angle-down"></i></a>
                            <ul role="menu" class="sub-menu">
                                <li><a href="board_list">Notice</a></li>
                                <li><a href="board_1to1">1:1 CustomerBoard</a></li>
                            </ul>
                        </li>
                        <!-- 회원 로그인 후-->
						<c:if test="${sessionScope.loginid != null}">
						
                        <li class="dropdown"><a href="#">MyPage <i class="fa fa-angle-down"></i></a>
                            <ul role="menu" class="sub-menu">
                                <li><a href="my_info_detail">My Infomation</a></li>
                                <li><a href="portfoliofour.html">Learning Page</a></li>
                                <li><a href="my_chart_page">My Chart</a></li>
                            </ul>
                        </li>
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

			<div class="col-md-9 col-sm-7">
				<div class="row">
					<!-- Notice Board -->
					<div class="col-sm-12 col-md-12">
						<div class="user-data m-b-30">

							<div class="sidebar blog-sidebar">
								<div class="sidebar-item  recent">
									<h3>Board_1to1</h3>


									<table class="table">

										<thead>
											<tr>
												<td>NO.</td>
												<td>ID</td>
												<td>글 제목</td>
												<td>날짜</td>
												<td>조회수</td>
											</tr>
										</thead>



										<%--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■--%>




										<c:forEach var="board" items="${list}" varStatus="s">


											<c:choose>
												<c:when
													test="${sessionScope.login_id!=board.user_id and board.secret!=null}">

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
									</table>

									<div class="user-data__footer" align="center">
										<a href="write" class="btn btn-submit">Write</a>
									</div>
									<c:if test="${sessionScope.user_level eq '1'}">
									</c:if>
									<%--■■■■<<<페이징>>>■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■--%>


									<div class="blog-pagination">
										<ul class="pagination">
										<li><a href="board_1to1?currentPage=${navi.currentPage - navi.pagePerGroup}&searchItem=${searchItem}&searchWord=${searchWord}">◁</a></li>
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
								</div>
								<div class="col-md-3 col-sm-5">
									<div class="sidebar blog-sidebar"></div>
								</div>
							</div>
						</div>
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









<%-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 
	<div class="left">
		<h2>1:1 질문 게시판</h2>
	</div>
	<!-- 1대1 게시판 -->
	<table cellpadding="0" cellspacing="0" class="table_myroom margin_top5"
		width="100%" summary="1대1 상담내역 테이블로 일자,종류,제목,답변상태를 확인 하실 수 있습니다.">
		<caption>1대1 문의 게시판</caption>
		<colgroup>
			<col width="12%">
			<col width="20%">
			<col width="*">
			<col width="12%">
			<col width="12%">
		</colgroup>

		<tbody>
			<tr>
				<th scope="col" class="first">일자</th>
				<th scope="col">작성자</th>
				<th scope="col">제목</th>
				<th scope="col">조회수</th>

			</tr>
			
			
			<!-- 1대1 게시판  루프문-->
			<c:forEach var="board" items="${board_list}" varStatus="s">


				<c:choose>
					<c:when
						test="${sessionScope.login_id!=board.user_id and board.secret!=null}">

						<tr>

							<td class="first">${board.new_date}</td>
							<td>${board.user_id}</td>
							<td class="align_left01">비밀글 입니다.</td>
							<td>${board.hitcount}</td>
						
							<c:if test="${sessionScope.login_id=='admin'}">
								<td><a href="#" onclick=""><img
										src="http://image.kyobobook.co.kr/newimages/apps/b2c/myroom/Btn_ViewAnswer2.gif"
										alt="답변보기"> </a></td>

								<td><a href="javascript:deleteQnAView('1653509',' ');">
										<img class="margin_top5"
										src="http://image.kyobobook.co.kr/newimages/apps/b2c/myroom/Btn_Delet_1.gif"
										alt="삭제하기">
								</a></td>
							</c:if>
						</tr>

					</c:when>
					<c:otherwise>
						<tr>

							<td class="first">${board.new_date}</td>
							<td>${board.user_id}</td>
							<td class="align_left01"><a
								href="post?board_num=${board.board_num}" onclick="">${board.title}</a></td>
							<td>${board.hitcount}</td>
						
							<c:if test="${sessionScope.login_id=='admin'}">
								<td><a href="#" onclick=""><img
										src="http://image.kyobobook.co.kr/newimages/apps/b2c/myroom/Btn_ViewAnswer2.gif"
										alt="답변보기"> </a></td>

								<td><a href="javascript:deleteQnAView('1653509',' ');">
										<img class="margin_top5"
										src="http://image.kyobobook.co.kr/newimages/apps/b2c/myroom/Btn_Delet_1.gif"
										alt="삭제하기">
								</a></td>
							</c:if>
						</tr>
					</c:otherwise>
				</c:choose>
			</c:forEach>

		</tbody>

	</table>
	
	<!-- 1대1 게시판  검색 -->
	<a href="write">글쓰기</a>
	<form class="right" action="board_1to1" method="get">
		<select name="searchItem">
			<option value="user_id" ${searchItem=='user_id'?'selected':''}>작성자</option>
			<option value="title" ${searchItem=='title'?'selected':''}>제목</option>
			<option value="text" ${searchItem=='text'?'selected':''}>내용</option>
		</select> <input type="text" name="searchWord" value="${searchWord}" /> <input
			type="submit" value="검색" />
	</form>


<!-- 1대1 게시판  페이징-->


	<div class="boardfooter">
		<a
			href="board_1to1?currentPage=${navi.currentPage-navi.pagePerGroup}&searchItem=${searchItem}&searchWord=${searchWord}">◁◁</a>
		<a
			href="board_1to1?currentPage=${navi.currentPage-1}&searchItem=${searchItem}&searchWord=${searchWord}">◀</a>
		&nbsp;&nbsp;


		<c:forEach var="page" begin="${navi.startPageGroup}"
			end="${navi.totalPageCount}">

			<c:if test="${page==currentPage}">
				<span style="color: red; font-weight: bolder;">${page} </span>&nbsp;
			</c:if>

			<c:if test="${page!=currentPage}">
				<a
					href="board_1to1?currentPage=${page}&searchItem=${searchItem}&searchWord=${searchWord}">${page}
				</a> &nbsp;
			</c:if>

		</c:forEach>
		&nbsp;&nbsp; <a
			href="board_1to1?currentPage=${navi.currentPage+1}&searchItem=${searchItem}&searchWord=${searchWord}">▶</a>
		<a
			href="board_1to1?currentPage=${navi.currentPage+navi.pagePerGroup}&searchItem=${searchItem}&searchWord=${searchWord}">▷▷</a>

	</div>


</body>
</html>  --%>