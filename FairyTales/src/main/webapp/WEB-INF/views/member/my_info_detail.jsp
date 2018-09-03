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
    <title>Coming Soon | Triangle</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet"> 
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

<!-- script -->    
<script src="resources/jquery-3.3.1.min.js"></script>

<script type="text/javascript">

function check(){
	var userpwd = $("#user_pwd").val();
		//console.log(userpwd.length);
	var userid = $("#user_id").val();
		//console.log(userpwd +" /"+userid);
	if (userpwd.length == 0) {
		alert("비밀번호를 입력해주세요.");
		$("#user_pwd").focus();
		return;
	}
	
	$.ajax({
		method:'post',
		url: 'pwCheck',
		data: {"user_id":userid,"user_pwd":userpwd},
		success:function(resp){
			console.log(resp);
			if(resp=="false"){
				alert("비밀번호가 틀렸습니다. 올바른 비밀번호를 입력해 주세요.");
				$("#user_pwd").focus();
			}else{
				my_info_form.submit();
			}
		}
	});
	
	
}

</script><!-- /script --> 

 
</head><!--/head-->

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
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <a class="navbar-brand" href="./">
                    	<h1><img src="images/logo(ex).png" alt="logo"></h1>
                    </a>
                    
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="./">Home</a></li>
                        <li class="dropdown"><a href="#">Page <i class="fa fa-angle-down"></i></a>
                            <ul role="menu" class="sub-menu">
                            
                            	<li><a href="japanese_fairy">Japanese Fairy</a></li>
                                <li><a href="aboutus.html">Codding Puzzle</a></li>
                            </ul>
                        </li>                  
                        <li class="dropdown"><a href="#">Board<i class="fa fa-angle-down"></i></a>
                            <ul role="menu" class="sub-menu">
                                <li><a href="board_list">Notice</a></li>
                                <li><a href="blogtwo.html">1:1 CustomerBoard</a></li>
                            </ul>
                        </li>
                        <!-- 회원 로그인 후-->
						<c:if test="${sessionScope.loginid != null}">
						
                        <li class="dropdown"><a href="#">MyPage <i class="fa fa-angle-down"></i></a>
                            <ul role="menu" class="sub-menu">
                                <li><a href="my_info_detail">My Infomation</a></li>
                                <li><a href="portfoliofour.html">Learning Page</a></li>
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

						<!-- 회원 로그인 후-->
						
							
						
						
				<%-- 				<br />
							<a href="my_info_detail">마이페이지</a>
							<br />
							<a href="board_list">공지사항</a>
						</c:if> --%>



					</ul>
                </div>
                <div class="search">
                    <form role="form">
                        <i class="fa fa-search"></i>
                        <div class="field-toggle">
                            <input type="text" class="search-form" autocomplete="off" placeholder="Search">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </header>
    <!--/#header-->
    
     <section id="coming-soon">        
         <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2">                    
                    <div class="contact-form bottom" align="center">
                        <h2>My Infomation</h2>
                        <form action="my_info_update" method="get" id="my_info_form">
							<input type="hidden" id="user_id" value="${memberdetail.user_id}">
                            <div class="form-group">
                                <div class="form-control" align="left">${memberdetail.user_id}</div>
                            </div>
                            <div class="form-group">
                                <input type="password" id="user_pwd" name="user_pwd" class="form-control" required="required" placeholder=" * Password">
                            </div>
                            <div class="form-group">
                            	<div class="form-control" align="left">${memberdetail.user_name}</div> 
                            </div>
                            <div class="form-group">
                            	<div class="form-control" align="left">${memberdetail.user_age}</div>   
                            </div>
                             <div class="form-group">
                             	<div class="form-control" align="left">${memberdetail.phone_num}</div> 
                            </div>
							<div class="form-group">
								<div class="form-control" align="left">${memberdetail.user_email}</div>
								<!-- <select name="user_email2" id="user_email2" class="form-control">
									<option value="@gmail.com">gmail.com</option>
									<option value="@hanmail.net">hanmail.net</option>
									<option value="@naver.com">naver.com</option>
									<option value="@daum.net">daum.net</option>
								</select> -->
							<!-- 	<input id="user_email" type="hidden" name="user_email" value="" /> -->
							</div>
							<div class="form-group">
								<div class="form-control" align="left">${memberdetail.address}</div>
							</div>
							<div class="form-group">
								<input class="subject" type="checkbox" name="subject" value="japan"> 일본어 동화 
								<input class="subject" type="checkbox" name="subject" value="codding"> 코딩 퍼즐
							    <input id="subject" type="hidden" name="subject" value="" />
							</div>
							<div class="form-group" align="center">
                                <input type="button" id="btn" class="btn btn-submit" value="OK" onclick="check();">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           		<input type="reset" class="btn btn-submit" value="Cancel">
                            </div>
                        </form>
                    </div>                 
                </div>
                <div class="col-sm-12">
                    <div class="time-count">
                        <ul id="countdown">
                            <li class="angle-one">
                                <span class="days time-font">00</span>
                                <p>Days</p>
                            </li>
                            <li class="angle-two">
                                <span class="hours time-font">00</span>
                                <p>Hours</p>
                            </li>
                            <li class="angle-one">
                                <span class="minutes time-font">00</span>
                                <p class="minute">Mins</p>
                            </li>                            
                            <li class="angle-two">
                                <span class="seconds time-font">00</span>
                                <p>Secs</p>
                            </li>               
                        </ul>   
                    </div>
                </div>
            </div>
        </div>       
    </section>
    <section id="subscribe">
        <div class="container">
            <div class="row">
                <div class="col-sm-10 col-sm-offset-1">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2><i class="fa fa-envelope-o"></i> SUBSCRIBE TO OUR NEWSLETTER</h2>
                            <p>Quis filet mignon proident, laboris venison tri-tip commodo brisket aute ut. Tail salami pork belly, flank ullamco bacon bresaola do beef<br /> laboris venison tri-tip.</p>
                        </div>
                        <div class="col-sm-6 newsletter">
                            <form id="newsletter">
                                <input class="form-control" type="email" name="email"  value="" placeholder="Enter Your email">
                                <i class="fa fa-check"></i>
                            </form>
                            <p>Don't worry we will not use your email for spam</p>
                        </div>    
                    </div>
                </div>     
            </div>
        </div> 
    </section>

    <section id="coming-soon-footer" class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="text-center">
                    <p>&copy; Your Company 2014. All Rights Reserved.</p>
                    <p>Designed by <a target="_blank" href="http://www.themeum.com">Themeum</a></p>
                </div>
            </div>
        </div>       
    </section>
    

    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/wow.min.js"></script>
    <script type="text/javascript" src="js/coundown-timer.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
    <script type="text/javascript">
        //Countdown js
    /*     $("#countdown").countdown({
            date: "10 march 2015 12:00:00",
            format: "on"
        },      
        function() {
            // callback function
        }); */
    </script>
    
</body>
</html>s