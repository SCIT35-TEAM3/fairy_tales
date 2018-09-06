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

<title>My Chart</title>

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
						<ul class="nav nav-pills">
							<li><a href=""><i class="fa fa-facebook"></i></a></li>
							<li><a href=""><i class="fa fa-twitter"></i></a></li>
							<li><a href=""><i class="fa fa-google-plus"></i></a></li>
							<li><a href=""><i class="fa fa-dribbble"></i></a></li>
							<li><a href=""><i class="fa fa-linkedin"></i></a></li>
						</ul>
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
							<img src="images/logo(ex).png" alt="logo">
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
								<li><a href="aboutus.html">Coding Puzzle</a></li>
							</ul></li>
						<li class="dropdown"><a href="#">Board<i
								class="fa fa-angle-down"></i></a>
							<ul role="menu" class="sub-menu">
								<li><a href="board_list">Notice</a></li>
								<li><a href="blogtwo.html">1:1 CustomerBoard</a></li>
							</ul></li>
						<!-- 회원 로그인 후-->
						<c:if test="${sessionScope.loginid != null}">

							<li class="dropdown"><a href="#">MyPage <i
									class="fa fa-angle-down"></i></a>
								<ul role="menu" class="sub-menu">
									<li><a href="my_info_detail">My Infomation</a></li>
									<li><a href="portfoliofour.html">Learning Page</a></li>
									<li><a href="my_chart_page">My Chart</a></li>
								</ul></li>
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
				<div class="search">
					<form role="form">
						<i class="fa fa-search"></i>
						<div class="field-toggle">
							<input type="text" class="search-form" autocomplete="off"
								placeholder="Search">
						</div>
					</form>
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
						<div class="sidebar-item categories">
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
													<div
														style="position: relative; height: 700px; width: 700px">
														<canvas id="allChart"></canvas>
														<br> <br> <br>
														<canvas id="levelChart"></canvas>
														<br> <br> <br>
														<canvas id="fairyChart"></canvas>

														<!-- 오답률 -->
														<br> <br> <br>
														<canvas id="allWorngChart"></canvas>
														<br> <br> <br>
														<canvas id="levelWorngChart"></canvas>
														<br> <br> <br>
														
														<!-- 출석률 -->
														<br> <br> <br>
														<canvas id="attendChart"></canvas>
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
	
//레벨별 오답률
	var ctx = document.getElementById("attendChart");
	var attendChart = new Chart(ctx, {
		type : 'line',
		data : {
			labels : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월",
						"10월", "11월", "12월"],
			datasets : [ {
				label : '출석일',
				backgroundColor : 'rgba(153, 102, 255, 0.2)',
				borderColor : 'rgba(153, 102, 255, 1)',
				borderWidth : 1,
				data : [ 15, 16, 17, 14, 5, 20, 18, 10, 7, 30, 17, 12 ]
			}]
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
				xAxes : [ {
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