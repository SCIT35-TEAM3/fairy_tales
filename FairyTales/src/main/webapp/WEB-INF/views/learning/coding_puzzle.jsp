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
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="../favicon.ico">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/lightbox.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/default.css" />
<link rel="stylesheet" type="text/css" href="css/default_puzzle.css" />
<link rel="stylesheet" type="text/css" href="css/component.css" />
<link rel="stylesheet" type="text/css" href="css/component_puzzle.css" />
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
                                <li><a href="#">Learning Page</a></li>
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
							<h1 class="title">Coding Puzzle</h1>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/#action-->

<div class="container demo-3">	
		<ul class="grid cs-style-4" style="width: 1400px;">
			<li>
				<figure>
					<div>
						<img src="images/1.png" alt="img05">
					</div>
					<figcaption>
						<h3>초급</h3>
						<span>Jacob Cummings</span> <a href="#">Take a look</a>
					</figcaption>
				</figure>
			</li>
			<li>
				<figure>
					<div>
						<img src="images/3.png" alt="img06">
					</div>
					<figcaption>
						<h3>중급</h3>
						<span>Jacob Cummings</span> <a href="#">Take a look</a>
					</figcaption>
				</figure>
			</li>
			<li>
				<figure>
					<div>
						<img src="images/2.png" alt="img02">
					</div>
					<figcaption>
						<h3>고급</h3>
						<span>Jacob Cummings</span> <a href="#">Take a look</a>
					</figcaption>
				</figure>
			</li>
		</ul>
	</div>

	  <!--#related-work-->	
	<section id="related-work" class="padding-top padding-bottom">
      <div class="container">
            <div class="row">
                <h1 class="title text-center">Related Work</h1>
                <div class="col-sm-3">
                    <div class="portfolio-wrapper">
                        <div class="portfolio-single">
                            <div class="portfolio-thumb">
                                <img src="images/portfolio/1.jpg" class="img-responsive" alt="">
                            </div>
                            <div class="portfolio-view">
                                <ul class="nav nav-pills">
                                    <li><a href="images/portfolio/1.jpg" data-lightbox="example-set"><i class="fa fa-eye"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="portfolio-info ">
                            <h2>Sailing Vivamus</h2>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="portfolio-wrapper">
                        <div class="portfolio-single">
                            <div class="portfolio-thumb">
                                <img src="images/portfolio/2.jpg" class="img-responsive" alt="">
                            </div>
                            <div class="portfolio-view">
                                <ul class="nav nav-pills">
                                    <li><a href="images/portfolio/2.jpg" data-lightbox="example-set"><i class="fa fa-eye"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="portfolio-info ">
                            <h2>Sailing Vivamus</h2>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="portfolio-wrapper">
                        <div class="portfolio-single">
                            <div class="portfolio-thumb">
                                <img src="images/portfolio/3.jpg" class="img-responsive" alt="">
                            </div>
                            <div class="portfolio-view">
                                <ul class="nav nav-pills">
                                    <li><a href="images/portfolio/3.jpg" data-lightbox="example-set"><i class="fa fa-eye"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="portfolio-info ">
                            <h2>Sailing Vivamus</h2>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="portfolio-wrapper">
                        <div class="portfolio-single">
                            <div class="portfolio-thumb">
                                <img src="images/portfolio/4.jpg" class="img-responsive" alt="">
                            </div>
                            <div class="portfolio-view">
                                <ul class="nav nav-pills">
                                    <li><a href="images/portfolio/4.jpg" data-lightbox="example-set"><i class="fa fa-eye"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="portfolio-info ">
                            <h2>Sailing Vivamus</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/#related-work-->
    
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
	                        E-mail: <a href="mailto:jungim0547@gmail.com">jungim0547@gmail.com</a> <br> 
	                        Phone: 1566-5114 <br> 
	                        </address>
	
	                        <h2>Address</h2>
	                        <address>
	                        513 COEX office<br>
	                        Korea International Trade Association, <br> 
	                        Yeongdong-daero, <br> 
	                        Gangnam-gu, <br> 
	                        Seoul <br> 
	                        </address>
	                    </div>
	                </div>
					<div class="col-md-8 col-sm-8">
						<iframe width="100%" height="300" frameborder="0" scrolling="no" marginheight="0"
								src="https://maps.google.com/maps?q=coex&t=&z=13&ie=UTF8&iwloc=&output=embed" marginwidth="0">
						</iframe>
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
                   		<p>Copyright &copy; SC IT MASTER </p>
                        <p>Designed by C class 3Group</a></p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!--/#footer-->
	<!-- /container -->
	<script src="js/toucheffects.js"></script>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/lightbox.min.js"></script>
	<script type="text/javascript" src="js/wow.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
</body>
</html>