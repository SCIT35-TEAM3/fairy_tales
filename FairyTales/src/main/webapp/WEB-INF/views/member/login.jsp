<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	function loginCheck() {
		var userid = document.getElementById("user_id").value;
		var userpwd = document.getElementById("user_pwd").value;

		if (userid.length == 0) {
			alert("아이디를 입력해주세요.");
			userid.focus();
			return false;
		}
		if (userpwd.length == 0) {
			alert("비밀번호를 입력해주세요.");
			userpwd.focus();
			return false;
		}
	}
</script><!-- /script --> 
</head><!--/head-->

<body>
    <div class="logo-image">                                
       <a href="./"><img class="img-responsive" src="images/logo.png" alt=""> </a> 
    </div>
     <section id="coming-soon">        
         <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2">                    
                    <div class="contact-form bottom" align="center">
                        <h2>Login</h2>
                        <form id="login" name="login" method="post" action="login">
                            <div class="form-group">
                                <input type="text" name="user_id" id="user_id" class="form-control" required="required" placeholder="ID">
                            </div>
                            <br/>
                            <div class="form-group">
                                <input type="password" id="user_pwd" name="user_pwd" class="form-control" required="required" placeholder="Password">
                            </div>
                            <br/>   
                            <div class="form-group" align="center">
                                <input type="submit" id="btn" name="submit" class="btn btn-submit" value="Login" onclick="return loginCheck()" >
                            </div>
                        </form>
                    </div>                 
                </div>
              <!--   <div class="col-sm-12">
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
                </div> -->
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
</html>s