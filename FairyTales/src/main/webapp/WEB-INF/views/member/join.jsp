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

//가입버튼 클릭시 유효성 검사
function allChecked() {
	var user_id = document.getElementById("user_id");
	var user_pwd = document.getElementById("user_pwd");
	var check_pwd = document.getElementById("check_pwd");
	var user_name = document.getElementById("user_name");
	var user_age = document.getElementById("user_age");
	var phone_num = document.getElementById("phone_num");
	var user_email = document.getElementById("user_email");
	//var user_email2 = document.getElementById("user_email2").value;
	var address = document.getElementById("address");
	var subject = document.getElementsByClassName("subject");

	console.log(user_id);
	console.log(user_pwd);
	console.log(check_pwd); 
	console.log(user_name);
	console.log(user_age);
	console.log(phone_num);
	console.log(user_email);
	//console.log(user_email2);
	console.log(address);
	console.log(subject);
	
	

	if (user_id.value == "") {
		alert("아이디를 입력해주세요.");
		user_id.focus();
		return false;
	}
	if (user_pwd.value == "") {
		alert("비밀번호를 입력해주세요.");
		user_pwd.focus();
		return false;
	}
	if (check_pwd.value == "") {
		alert("비밀번호를 재입력해주세요.");
		check_pwd.focus();
		return false;
	}
	if (user_name.value == "") {
		alert("이름을 입력해주세요.");
		user_name.focus();
		return false;
	}
	if (isNaN(user_age.value)||user_age.value == "") {
		alert("나이를 입력해주세요.");
		user_age.focus();
		return false;
	}
	if (phone_num.value == "") {
		alert("전화번호를 입력해주세요.");
		phone_num.focus();
		return false;
	}
	
/* 	var user_email = user_email1.value + user_email2;
	document.getElementById("user_email").value = user_email;
	if (user_email.value == "") {
		alert("이메일을 입력해주세요.");
		user_email.focus();
		return false;
	} */
	
	if (address.value == "") {
		alert("주소를 입력해주세요.");
		address.focus();
		return false;
	}
	
	var sub = "";
	for (var i = 0; i < subject.length; i++) {
		if (subject[i].checked)
			sub += subject[i].value + " ";
	}
	//document.getElementById("subject").value = sub; 

	memberform.submit();
}

//아이디 중복체크
$(function() {
	$("#user_id").keyup(function() {
		console.log("키업 들어옴");
		var user_id = $(this).val();
		if (user_id.length<3 || user_id.length>11) {
			$('#id_check').text('길이는 3~10사이입니다.');
		} else {
			$.ajax({
				method : 'POST',
				url : "id_check",
				data : {
					'user_id' : user_id
				},
				success : function(r) {
					console.log("성공함")
					if (r == 1) {
						$('#id_check').text('중복된 아이디입니다.');
					} else {
						$('#id_check').text('사용 가능한 아이디입니다.');
					}
				},
				error : function(xhr, option, error) {
					console.log(xhr.status); //오류코드
					console.log(error); //오류내용
				}
			});
		}
	});

	//패스워드 재확인
	$('#user_pwd').keyup(function() {
		$('font[name=check]').text('');
		console.log("비밀번호 들어옴");
	}); //#user_pwd.keyup

	$('#check_pwd').keyup(function() {
		console.log("비밀번호 재확인 성공");
		if ($('#user_pwd').val() != $('#check_pwd').val()) {
			$('font[name=check]').text('');
			$('font[name=check]').html("암호 틀립니다.");
		} else {
			$('font[name=check]').text('');
			$('font[name=check]').html("암호 사용가능합니다.");
		}
	}); //#check_pwd.keyup
/* 
	$("#user_email").keyup(function() {
		console.log("email중복체크중....");
		var user_email = $(this).val();
		if (user_email.length<3 || user_email.length>11) {
			$('#email_check').text('길이는 3~10사이입니다.');
		} else {
			$.ajax({
				method : 'POST',
				url : "email_check",
				data : {
					'user_email' : user_email
				},
				success : function(r) {
					console.log("성공함")
					if (r == 1) {
						$('#email_check').text('사용불가능한 e-mail입니다.');
					} else {
						$('#email_check').text('사용 가능한 e-mail입니다.');
					}
				},
				error : function(xhr, option, error) {
					console.log(xhr.status); //오류코드
					console.log(error); //오류내용
				}
			});
		}
	}); */

});
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
    
    
     <section id="coming-soon">        
         <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2"> 
                                   
                    <div class="contact-form bottom" align="center">
                        <h2>Join</h2>
                        <form id="memberform" name="member" action="join" method="post">
                            <div class="form-group">
                                <input type="text" name="user_id" id="user_id" class="form-control" required="required" placeholder=" * ID">
                                <font id="id_check" size="2" color="red"></font>
                            </div>
                            <div class="form-group">
                                <input type="password" id="user_pwd" name="user_pwd" class="form-control" required="required" placeholder=" * Password">
                            </div>
                                       
                            <div class="form-group">
                                <input type="password" id="check_pwd" name="check_pwd" class="form-control" placeholder=" * Password reconfirm">
                            	<font name="check" size="2" color="red"></font>
                            </div>
                            <div class="form-group">
                                <input type="text" name="user_name" id="user_name" class="form-control" required="required" placeholder=" * Name">
                            </div>
                            <div class="form-group">
                                <input type="text" id="user_age" name="user_age" class="form-control" required="required" placeholder=" * Age">
                            </div>
                             <div class="form-group">
                                <input type="text" name="phone_num" id="phone_num" class="form-control" required="required" placeholder=" * Phone Number">
                            </div>
							<div class="form-group">
								<input type="email" id="user_email" name="user_email" class="form-control" required="required" placeholder=" * E-mail"> 
					
								<!-- <select name="user_email2" id="user_email2" class="form-control">
									<option value="@gmail.com">gmail.com</option>
									<option value="@hanmail.net">hanmail.net</option>
									<option value="@naver.com">naver.com</option>
									<option value="@daum.net">daum.net</option>
								</select> -->
							<!-- 	<input id="user_email" type="hidden" name="user_email" value="" /> -->
							</div>
							<div class="form-group">
								<input type="text" id="address" name="address" class="form-control" required="required" placeholder=" * Address">
							</div>
							<div class="form-group">
								<input class="subject" type="checkbox" name="subject" value="Japanese Fairy"> 일본어 동화 
								<input class="subject" type="checkbox" name="subject" value="Codding Puzzle"> 코딩 퍼즐
							    <input id="subject" type="hidden" name="subject" value="" />
							</div>
							<div class="form-group" align="center">
                                <input type="submit" id="btn" name="submit" class="btn btn-submit" value="Join">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           		<input type="reset" class="btn btn-submit" value="Cancel">
                            </div>
                        </form>
                    </div>                 
                </div>
               
            </div>
        </div>       
    </section>
	<section id="subscribe">
		<div class="container" align="center">
			<!-- <div class="copyright-text text-center"> -->
				<h2>
					<i class="fa fa-envelope-o"></i> 팀이름
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

	<!-- <section id="coming-soon-footer" class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="text-center">
                   <p>Copyright &copy; SC IT MASTER </p>
                   <p>Designed by C class 3Group</a></p>
                </div>
            </div>
        </div>       
    </section> -->
    

    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/wow.min.js"></script>
    <script type="text/javascript" src="js/coundown-timer.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
    <!-- <script type="text/javascript">
        //Countdown js
        $("#countdown").countdown({
            date: "10 march 2015 12:00:00",
            format: "on"
        },      
        function() {
            // callback function
        });
    </script> -->
    
</body>
</html>