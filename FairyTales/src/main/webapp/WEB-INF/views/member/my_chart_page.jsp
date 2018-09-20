<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="resources/jquery-3.3.1.js"></script>
<script src="resources/Chart.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>My Chart | POFT</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/lightbox.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<link rel="shortcut icon" href="images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="images/ico/apple-touch-icon-57-precomposed.png">
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
								<li><a href="j_test">Japanese Test</a></li>
                           		<li><a href="it_test">Coding Test</a></li>
                            	<li><a href="japanese_fairy">Japanese Fairy</a></li>
                                <li><a href="coding_puzzle">Coding Puzzle</a></li>
                            </ul>
                        </li>                    
                        <li class="dropdown"><a href="#">Board<i class="fa fa-angle-down"></i></a>
                            <ul role="menu" class="sub-menu">
                                <li><a href="board_list">Notice</a></li>
                                <li><a href="board_1to1">1:1 Customer Board</a></li>
                            </ul>
                        </li>
                        <!-- 회원 로그인 후-->
						<c:if test="${sessionScope.loginid != null}">
						
                        <li class="active" class="dropdown"><a href="#">MyPage <i class="fa fa-angle-down"></i></a>
                            <ul role="menu" class="sub-menu">
                                <li><a href="my_info_detail">My Infomation</a></li>
                                <li><a href="#">Learning Page</a></li>
                                <li class="active"><a href="my_chart_page">My Chart</a></li>
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
							<h1 class="title">My Chart</h1>
							<p>My Chart</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!--/#page-breadcrumb-->

	<section id="blog" class="padding-top">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-5">
					<div class="sidebar blog-sidebar w3-sidebar">
						<!-- 고정시켜서 쓸 수 있는 사이드바 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> 붙여서 쓰시면 됩니다!-->
						<div class="sidebar-item categories" >
							<h3>나의 학습 진행 현황</h3>
							<ul class="nav navbar-stacked">
								<li><a href="#allChart">학습진행도</a></li>
								<li><a href="#allWorngChart">오답률</a></li>
								<li><a href="#attendChart">출석률</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-9 col-sm-7">
					<div class="row">
						<div class="container">
							<div class="col-md-9 col-sm-7">
								<div class="row">
									<!-- Notice Board -->
									<div class="col-sm-12 col-md-12">
										<div class="user-data m-b-30">
											<div class="sidebar blog-sidebar">
												<div class="sidebar-item  recent">
													<h3>Chart</h3>

													<!-- 진행도 -->
													
													<!-- 차트 2개 넓이는 1000px -->
													<div style="position: relative; height: 1000px; width: 700px">
														<br> <br> <br>
														<canvas id="allChart"></canvas>
														<br> <br> <br> <br> <br> <br>
														<canvas id="levelChart"></canvas>
													</div>
													<!-- /차트 2개 -->
													
													<!-- 차트 1개 넓이는 450px -->
													<div style="position: relative; height: 450px; width: 700px">
													
														<canvas id="fairyChart"></canvas>
														<br> <br> <br> <br> <br> <br>
													</div>
													<!-- /차트 1개 -->
													
													<div style="position: relative; height: 1000px; width: 700px">
														<!-- 오답률 -->
														<canvas id="allWorngChart"></canvas>
														<br> <br> <br> <br> <br> <br>
														<canvas id="levelWorngChart"></canvas>
													</div>
													<div style="position: relative; height: 450px; width: 700px">
														<!-- 출석률 -->
														<canvas id="attendChart"></canvas>
														<br> <br> <br> <br> <br> <br>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
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
                    <img src="images/home/under.png" class="img-responsive inline" alt="">
                </div>
                <div class="col-md-4 col-sm-6">
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
                <div class="col-md-6 col-sm-12">
				<!-- <div class="col-md-12 col-sm-12"> -->
					<div class="contact-info bottom">
						<div class="map">
							<iframe width="120%" height="300" frameborder="0" scrolling="no"
								marginheight="0"
								src="https://maps.google.com/maps?q=coex&t=&z=13&ie=UTF8&iwloc=&output=embed"
								marginwidth="0">
								<a class="addmaps" href="http://www.embedgooglemap.net"
									id="get-map-data"
									mce_href="http://maps.google.com/maps/api/js?sensor=false">embedgooglemap.net</a>



							</iframe>
						</div>

					</div>
				</div>
                <!-- <div class="col-md-4 col-sm-12">
                    <div class="contact-form bottom">
                        <h2>Send a message</h2>
                        <form id="main-contact-form" name="contact-form" method="post" action="sendemail.php">
                            <div class="form-group">
                                <input type="text" name="name" class="form-control" required="required" placeholder="Name">
                            </div>
                            <div class="form-group">
                                <input type="email" name="email" class="form-control" required="required" placeholder="Email Id">
                            </div>
                            <div class="form-group">
                                <textarea name="message" id="message" required="required" class="form-control" rows="8" placeholder="Your text here"></textarea>
                            </div>                        
                            <div class="form-group">
                                <input type="submit" name="submit" class="btn btn-submit" value="Submit">
                            </div>
                        </form>
                    </div>
                </div> -->
                <div class="col-sm-12">
                    <div class="copyright-text text-center">
                        <p>&copy; Your Company 2014. All Rights Reserved.</p>
                        <p>Designed by <a target="_blank" href="http://www.themeum.com">Themeum</a></p>
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
<script>
	//전체 진행도 차트
	var ctx = document.getElementById("allChart");
	var allChart = new Chart(ctx, {
		type : 'horizontalBar',
		data : {
			labels : [ "일본어 학습", "JAVA학습" ],
			datasets : [ {
				label : '진행된 챕터',
				backgroundColor : 'rgba(255,99,132,0.2)',
				borderColor : 'rgba(255,99,132,1)',
				borderWidth : 1,
				data : [ 9, 7 ]
			//진행한 챕터수 data에 들어갈 값들은 쿼리에서 계산해서 꽂아주기
			}, {
				label : '미진행 챕터',
				backgroundColor : 'rgba(54, 162, 235, 0.2)',
				borderColor : 'rgba(54, 162, 235, 1)',
				borderWidth : 1,
				data : [ 36 - 9, 36 - 7 ]
			//전체 챕터수 - 미진행 챕터수
			} ]
		},
		options : {
			title : {
				display : true,
				text : '전체 챕터 진행도'
			},
			layout : {
				padding : {
					left : 50,
					right : 0,
					top : 0,
					bottom : 0
				}
			},
			legend : {
				display : true,
				position : 'top'
			},
			scales : {
				xAxes : [ {
					ticks : {
						beginAtZero : true
					//true로 해야 0부터 시작
					}
				} ]
			}
		}
	});

	//레벨별 진행도
	var ctx = document.getElementById("levelChart");
	var levelChart = new Chart(ctx, {
		type : 'horizontalBar',
		data : {
			labels : [ "초급", "중급", "상급" ],
			datasets : [ {
				label : '일본어',
				backgroundColor : 'rgba(255,99,132,0.2)',
				borderColor : 'rgba(255,99,132,1)',
				borderWidth : 1,
				data : [ 2, 4, 6 ]
			}, {
				label : 'JAVA',
				backgroundColor : 'rgba(54, 162, 235, 0.2)',
				borderColor : 'rgba(54, 162, 235, 1)',
				borderWidth : 1,
				data : [ 9 - 2, 12 - 4, 15 - 6 ]
			} ]
		},
		options : {
			title : {
				display : true,
				text : '레벨별 진행도'
			},
			layout : {
				padding : {
					left : 50,
					right : 0,
					top : 0,
					bottom : 0
				}
			},
			scales : {
				xAxes : [ {
					ticks : {
						beginAtZero : true
					//true로 해야 0부터 시작
					}
				} ]
			}
		}
	});

	//동화별 진행도
	var ctx = document.getElementById("fairyChart");
	var fairyChart = new Chart(ctx, {
		type : 'horizontalBar',
		data : {
			labels : [ "장갑", "장화신은 고양이", "신데렐라" ],
			datasets : [ {
				label : '일본어 학습',
				backgroundColor : 'rgba(255,99,132,0.2)',
				borderColor : 'rgba(255,99,132,1)',
				borderWidth : 1,
				data : [ 2, 1, 3 ]
			}, {
				label : '자바학습',
				backgroundColor : 'rgba(54, 162, 235, 0.2)',
				borderColor : 'rgba(54, 162, 235, 1)',
				borderWidth : 1,
				data : [ 2, 3, 5 ]
			} ]
		},
		options : {
			title : {
				display : true,
				text : '동화별 진행도'
			},
			layout : {
				padding : {
					left : 30,
					right : 0,
					top : 0,
					bottom : 0
				}
			},
			scales : {
				xAxes : [ {
					ticks : {
						beginAtZero : true
					//true로 해야 0부터 시작
					}
				} ]
			}
		}
	});

	//전체 오답률
	var ctx = document.getElementById("allWorngChart");
	var allWorngChart = new Chart(ctx, {
		type : 'horizontalBar',
		data : {
			labels : [ "일본어 학습", "JAVA학습" ],
			datasets : [ {
				label : '정답률',
				backgroundColor : 'rgba(54, 162, 235, 0.2)',
				borderColor : 'rgba(54, 162, 235, 1)',
				borderWidth : 1,
				data : [ 80, 70 ]
			//((전체 문제수 - 오답수)/전체문제)*100
			}, {
				label : '오답률',
				backgroundColor : 'rgba(255,99,132,0.2)',
				borderColor : 'rgba(255,99,132,1)',
				borderWidth : 1,
				data : [ 20, 30 ]
			//(오답수/전체문제)*100
			} ]
		},
		options : {
			title : {
				display : true,
				text : '전체 오답률'
			},
			layout : {
				padding : {
					left : 30,
					right : 0,
					top : 0,
					bottom : 0
				}
			},
			scales : {
				xAxes : [ {
					ticks : {
						beginAtZero : true
					//true로 해야 0부터 시작
					}
				} ]
			}
		}
	});

	//레벨별 오답률
	var ctx = document.getElementById("levelWorngChart");
	var levelWorngChart = new Chart(ctx, {
		type : 'horizontalBar',
		data : {
			labels : [ "초급", "중급", "고급" ],
			datasets : [ {
				label : '정답률',
				backgroundColor : 'rgba(54, 162, 235, 0.2)',
				borderColor : 'rgba(54, 162, 235, 1)',
				borderWidth : 1,
				data : [ 80, 70, 50 ]
			}, {
				label : '오답률',
				backgroundColor : 'rgba(255,99,132,0.2)',
				borderColor : 'rgba(255,99,132,1)',
				borderWidth : 1,
				data : [ 20, 30, 50 ]
			} ]
		},
		options : {
			title : {
				display : true,
				text : '레벨별 오답률'
			},
			layout : {
				padding : {
					left : 30,
					right : 0,
					top : 0,
					bottom : 0
				}
			},
			scales : {
				xAxes : [ {
					ticks : {
						beginAtZero : true
					//true로 해야 0부터 시작
					}
				} ]
			}
		}
	});

	//월별 출석률
	var ctx = document.getElementById("attendChart");
	var attendChart = new Chart(ctx, {
		type : 'line',
		data : {
			labels : ["이번달", "1개월 전", "2개월 전", "3개월 전", "4개월 전", "5개월 전", "6개월 전"],
			datasets : [ {
				label : '출석일',
				backgroundColor : 'rgba(153, 102, 255, 0.2)',
				borderColor : 'rgba(153, 102, 255, 1)',
				borderWidth : 1,
				data : [${attendThisMon}, ${oneMonAttend}, ${twoMonAttend}, ${threeMonAttend}, ${fourMonAttend}, ${fiveMonAttend}, ${sixMonAttend}]
			} ]
		},
		options : {
			title : {
				display : true,
				text : '월별 출석율'
			},
			layout : {
				padding : {
					left : 30,
					right : 0,
					top : 0,
					bottom : 0
				}
			},
			scales : {
				yAxes : [ {
					ticks : {
						beginAtZero : true
					//true로 해야 0부터 시작
					}
				} ]
			}
		}
	});
</script>
</html>