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
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->


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
                            	<li><a href="it_test">Coding Test</a></li>
								<li><a href="j_test">Japanese Test</a></li>
                            
                            	<li><a href="japanese_fairy">Japanese Fairy</a></li>
                                <li><a href="coding_puzzle">Coding Puzzle</a></li>
                            </ul>
                        </li>                    
                        <li class="active" class="dropdown"><a href="#">Board<i class="fa fa-angle-down"></i></a>
                            <ul role="menu" class="sub-menu">
                                <li class="active"><a href="board_list">Notice</a></li>
                                <li><a href="board_1to1">1:1 Customer Board</a></li>
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
<!-- 글읽기 -->
    <section id="blog" class="padding-top">
        <div class="container">
            <div class="row">
				<div class="col-md-9 col-sm-7">
					<div class="row">

						<!-- Notice Board -->
						<div class="col-sm-12 col-md-12">

							<div class="user-data m-b-30">

								<div class="sidebar blog-sidebar">
									<div class="sidebar-item  recent">
										<h3>Notice</h3>

										<div class="table-responsive table-data">
											<table class="table">

												<thead align="center">
													<tr>
														<td width="100px">NO.</td>
														<td>${boarddetail.board_num}</td>
														<td width="100px">작성자</td>
														<td>${boarddetail.user_id}</td>
														<td width="100px">날짜</td>
														<td width="150px">${boarddetail.new_date}</td>
														<td width="100px">조회수</td>
														<td width="100px">${boarddetail.hitcount}</td>
													</tr>
												</thead>

												<tbody>
													<tr>
														<td width="100px" align="center">글제목</td>
														<td colspan="7">${boarddetail.title}</td>
													</tr>
												</tbody>
												<tbody>
													<tr >
														<td width="100px" align="center">글내용</td>
														<td colspan="8">
														<div class="form-control" name="content" id="content" style="height: 300px;">${boarddetail.content}</div>
														</td>

													</tr>
												</tbody>

												<tr>
													<td colspan="8">
														<div class="form-group">
															<div align="center">

																<c:if test="${sessionScope.loginid ne boarddetail.user_id}">
																	<button type="button" class="btn btn-submit" onclick="location.href='board_list' ">Board List</button>

																</c:if>
																<c:if test="${sessionScope.loginid eq boarddetail.user_id}">
																	<button type="button" class="btn btn-submit" onclick="location.href='board_list' ">Board List</button>
																	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																	<button type="button" class="btn btn-submit" onclick="location.href='boardUpdate?board_num=${boarddetail.board_num}' ">Update</button>
																	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																	<button type="button" class="btn btn-submit" onclick="location.href='boardDelete?board_num=${boarddetail.board_num}' ">Delete</button>
																</c:if>
															</div>
														</div>
													</td>
												</tr>
									</table>
								</div>

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
                                    <h4><a href="#">Lorem ipsum dolor sit amet consectetur adipisicing elit,</a></h4>
                                    <p>posted on  07 March 2014</p>
                                </div>
                            </div>
                            <div class="media">
                                <div class="pull-left">
                                    <a href="#"><img src="images/portfolio/project2.jpg" alt=""></a>
                                </div>
                                <div class="media-body">
                                    <h4><a href="#">Lorem ipsum dolor sit amet consectetur adipisicing elit,</a></h4>
                                    <p>posted on  07 March 2014</p>
                                </div>
                            </div>
                            <div class="media">
                                <div class="pull-left">
                                    <a href="#"><img src="images/portfolio/project3.jpg" alt=""></a>
                                </div>
                                <div class="media-body">
                                    <h4><a href="#">Lorem ipsum dolor sit amet consectetur adipisicing elit,</a></h4>
                                    <p>posted on  07 March 2014</p>
                                </div>
                            </div>
                        </div>
                      
                        
                        <div class="sidebar-item popular">
                            <h3>Latest Photos</h3>
                            <ul class="gallery">
                                <li><a href="#"><img src="images/portfolio/popular1.jpg" alt=""></a></li>
                                <li><a href="#"><img src="images/portfolio/popular2.jpg" alt=""></a></li>
                                <li><a href="#"><img src="images/portfolio/popular3.jpg" alt=""></a></li>
                                <li><a href="#"><img src="images/portfolio/popular4.jpg" alt=""></a></li>
                                <li><a href="#"><img src="images/portfolio/popular5.jpg" alt=""></a></li>
                                <li><a href="#"><img src="images/portfolio/popular1.jpg" alt=""></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
   <!-- /글읽기 -->

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
