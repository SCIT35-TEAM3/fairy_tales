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
    <title>My Infomation | POFT</title>
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
	console.log('test');
	var user_pwd = document.getElementById("user_pwd");
	if (user_pwd.value.length == 0) {
		alert("비밀번호를 입력해주세요.");
		user_pwd.focus();
		return false;
	}
	
	var oldpwd=document.getElementById("oldpwd");
	
	/* if(oldpwd.value==user_pwd.value){
		alert('비밀번호는 변경하셔야 합니다.!!');
		return false;
	} */
	 var params = jQuery("#updateform").serialize(); 
	$.ajax({
		method:'post',
		url: 'my_info_update',
		data:params,
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		success:function(resp){
			if(resp=="ok"){
				location.href="./";
			}else{
				user_pwd.value="";
				oldpwd.value="";
				
				alert('개인정보 변경에 실패했습니다!! 비밀번호를 확인하세요.');
			}
		}
		
	})

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
						
                        <li class="active" class="dropdown"><a href="#">My Page <i class="fa fa-angle-down"></i></a>
                            <ul role="menu" class="sub-menu">
                                <li class="active"><a href="my_info_detail">My Infomation</a></li>
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
    
    
    
     <section id="coming-soon">        
         <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2">                    
                    <div class="contact-form bottom" align="center">
                        <h2>My Infomation</h2>
                        <form action="gomain" method="get" id="updateform">
                        
                            <div class="form-group">
                          <input type="text" name="user_id" id="user_id" class="form-control" value="${memberdetail.user_id}">
                                <%-- <div class="form-control" align="left">*  ${memberdetail.user_id}</div> --%>
                            </div>
                             <div class="form-group">
                                <input type="password" id="oldpwd" name="oldpwd" class="form-control" required="required" placeholder=" * Password">
                            </div>
                            <div class="form-group">
                                <input type="password" id="user_pwd" name="user_pwd" class="form-control" required="required" placeholder=" * New Password">
                            </div>
                          
                            <div class="form-group">
                                <div class="form-control" align="left">* ${memberdetail.user_name}</div>
                            </div>
                            <div class="form-group">
                                <div class="form-control" align="left">* ${memberdetail.user_age}</div>
                            </div>
                             <div class="form-group">
                                <input type="text" name="phone_num" id="phone_num" class="form-control" required="required" value="${memberdetail.phone_num}">
                            </div>
							<div class="form-group">
								<input type="email" id="user_email" name="user_email" class="form-control" required="required" value="${memberdetail.user_email}"> 
					
								<!-- <select name="user_email2" id="user_email2" class="form-control">
									<option value="@gmail.com">gmail.com</option>
									<option value="@hanmail.net">hanmail.net</option>
									<option value="@naver.com">naver.com</option>
									<option value="@daum.net">daum.net</option>
								</select> -->
							<!-- 	<input id="user_email" type="hidden" name="user_email" value="" /> -->
							</div>
							<div class="form-group">
								<input type="text" id="address" name="address" class="form-control" required="required" value="${memberdetail.address}">
							</div>
							<div class="form-group">
								<div class="form-control" align="left">*  ${memberdetail.new_date}</div>
							</div>
							<div class="form-group">
								<div class="form-control" align="left">* ${memberdetail.subject}</div>
							</div>
							<div class="form-group" align="center">
                                <input type="button" id="btn" class="btn btn-submit" value="OK" onclick="check()">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           		<input type="reset" class="btn btn-submit" value="Cancel">
                            </div>
                        </form>
                    </div>                 
                </div>
                
            </div>
        </div>       
    </section>

	<!-- footer -->
	<section id="subscribe">
		<div class="container" align="center">
			<!-- <div class="copyright-text text-center"> -->
				<h2>
					<img src="images/로고.png" alt="logo">
				</h2>
				<p>
					513 COEX office Korea International Trade Association, <br>
					Yeongdong-daero, Gangnam-gu, Seoul <br>
					Copyright &copy; SC IT MASTER <br>
					Designed by C class 3Group
				</p>
			</div>

		<!-- </div> -->

	</section>
 		<!-- /footer -->


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
        });  */
    </script>
    
</body>
</html>