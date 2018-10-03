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

<!-- 팝업 css -->
<style type="text/css">
	b {
		color : #a5732a;
	}
		
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
	
	.padding-top2 {
	  padding-top: 35px;
	}
</style>
<!-- 팝업 css -->

<!-- editor css -->
<style>
	.fairyTale{
		border:1px solid #a5732c;
	}
	/* 
	.move{
		border:1px solid rad;
	}
	.effect{
		border:1px solid blue;
	}
	.fEdit{
		border:1px solid green;
	}
	 */
</style>

<script src="resources/jquery-3.3.1.min.js"></script>
<script src="resources/js/editor.js"></script>

<!-- editor css -->

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
							<h1 class="title">${fairytales.fairy_name}</h1>
							<p>FairyTales Editor [Chapter${chapter}]</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/#page-breadcrumb-->
	<section id="blog" class="padding-top2">
		<div class="container">
			<div class="col-md-12 col-sm-12">
				<div class="row">
					<!-- Notice Board -->
					<div class="col-sm-12 col-md-12">
						<div class="user-data m-b-30">
							<div class="sidebar blog-sidebar">
								<div class="sidebar-item  recent">
								<%-- 본문위치 --%>
									<table id="editTable" class="table" style="table-layout:fixed">
										<thead>
											<tr>
												<td colspan="2">
													<i class="fa fa-files-o">&nbsp;Layer</i>&nbsp;&nbsp;
													<a href="#layer" id="addLayer" class="btn">Add Layer</a>
													<a href="#layer" id="delLayer" class="btn">Delete Layer</a>
													<a href="#imgae" id="BGIBtn" class="btn">Back Ground Image</a>
													<input type="file" id="backGroundUp" onchange="imgFilePut(this.files,'back')" style="display: none;"/>
													<a href="#imgae" id="CIBtn" class="btn">Chapter Image</a>
													<input type="file" id="ChapterUp" onchange="imgFilePut(this.files,'chapter')" style="display: none;"/>
													<div class="layerSelector"  style="width:100%; height:50px; overflow-x: scroll; white-space: nowrap;">
													<span><input type="radio" name="layer" value="1" checked />Layer1</span>
													</div>
												</td>
											</tr>
											<%-- 
											<tr>
												<td>
													<div class="layerSelector">
														<span><input type="radio" name="layer" value="1" checked />레이어1</span>
													</div>
												</td>
												<td>
													<span>레이어</span><br>
													<div class="layerDiv">
														<input type="button" value="<<">
														<input type="button" value=">>">
														<input type="button" id = "addLayer" value="레이어 추가"/>
													</div>
												</td>
											</tr>
											 --%>
											<tr>
												<td colspan="2">
												<!-- <i class="fa fa-film"> <span id="screensView">Screens 1</span></i> -->
												<i class="fa fa-film"></i>
												<select id="screensView" name="screen">
													<option value="0">Screen 1</option>
												</select>&nbsp;&nbsp;<a href="#screen" id="addScreen" class="btn">Add Screen</a>
												<a href="#screen" id="cNextScreen" class="btn">Copy To Next Screen</a>
												<a href="#screen" id="delScreen" class="btn">Delete Screen</a>
												<div id="sceneList"  style="width:100%; height:50px; overflow-x: scroll; white-space: nowrap;"></div>
												</td>
											</tr>
											<tr>
												<!-- <td>
													<div id="objList" style="overflow-y:hidden;">
														<span>--- Object List ---</span><br/>
													</div>
												</td> -->
												<td colspan = "2">
													<div class="col-md-9 col-sm-9">
														<div class="fairyTale" id="fairyTale">
															<div class="layer fEdit"></div>
															<div class="layer move group1"></div>
															<div class="layer effect group1"></div>
														</div>
													</div>
													<div class="col-md-3 col-sm-3">
														<table class="table" >
															<thead>
															<tr>
																<td>
																	<p>Object</p>
																</td>
																<td>
																	<input type="number" id="sObjId" placeholder="Object Seleted" disabled/>
																</td>
															</tr>
															</thead>
															<tbody>
															<tr>
																<td>
																	<p>Time</p>
																	<p>Latency</p>
																</td>
																<td>
																	<input type="number" id="sTime"		placeholder="Time"/>
																	<input type="number" id="sLatency"	placeholder="Waiting Time"/>
																</td>
															</tr>
															<tr>
																<td>
																	<p>Top</p>
																	<p>Left</p>
																</td>
																<td>
																	<input type="number" id="top"		placeholder="top" style="width: 70%; text-align:right;"/> %
																	<input type="number" id="left"		placeholder="left"style="width: 70%; text-align:right;"/> %
																</td>
															</tr>
															<tr>
																<td>
																	<p>Width</p>
																	<p>Height</p>
																</td>
																<td>
																	<input type="number" id="width"		placeholder="width" style="width: 70%; text-align:right;"/> %
																	<input type="number" id="height"	placeholder="height"style="width: 70%; text-align:right;"/> %
																</td>
															</tr>
															<tr>
																<td colspan="2">
																	<p>Animate Event</p>
																	<select id ="animate" name="animate">
																		<option value="fadeIn" >SHOW</option>
																		<option value="animate" >MOVE</option>
																		<option value="" >STOP</option>
																		<option value="fadeOut" >REMOVE</option>
																	</select>
																</td>
															</tr>
															<tr>
																<td colspan="2">
																	<a href="#save" id="sceneSet" class="btn"><i class="fa fa-save">&nbsp;&nbsp;Save Info</i></a>
																	<a href="#save" id="saveChapterBtn" class="btn"><i class="fa fa-edit">&nbsp;&nbsp;Save Chapter</i></a>
																</td>
															</tr>
															</tbody>
														</table>
													</div>
												</td>
												<!-- 
												<td>
													<div id = "chapter">
														<span id="chapterView">--- Chapter 0 ---</span>
													</div>
													<div id = "screens">
														<span id="screensView">--- Screens 0 ---</span>
													</div>
													<div id = "sceneList">
														<span>--- Scene List ---</span><br/>
													</div>
												</td> -->
											</tr>
										</thead>
										<tbody>
											<tr >
												<td colspan = "2">
												<span><i class="fa fa-cubes">  Object List</i></span>&nbsp;&nbsp;
												<a href="#use" id="addObjectBtn" class="btn">Use Object</a>&nbsp;&nbsp;
												<a href="#delete" id="objCheckBtn" class="btn">Delete Object</a>
												<div id="objList"  style="width:100%; height:50px; overflow-x: scroll; white-space: nowrap;"></div>
												</td>
											</tr>
											<tr>
												<td colspan = "2">
													<!-- 
													<div class="objectSelector">
														<span><input type="radio" value="text" name="object" checked />글</span>
														<span><input type="radio" value="img" name="object" />이미지</span>
														<span><input type="radio" value="effect" name="object" />효과</span>
													</div>
													 -->
													<i class="fa fa-dropbox">&nbsp;&nbsp;Add Object</i>
													<a href="#imgae" id="imgFileBtn" class="btn">Image</a>
													<input type="file" id="fileUp" onchange="imgFilePut(this.files,'img')" style="display: none;"/>
													<!-- <input type="text" id="objText"/> -->
													<a href="#layer1" class="btn btn-popup ">Word/Question</a>
													<!-- <input type="button" id="addObjTxtBtn" value="word add"/> -->
													
													<!-- 눈 비 안개 효과.. 보류
													<select id ="effect" name="effect">
														<option value="effect1" >눈</option>
														<option value="effect2" >비</option>
														<option value="effect3" >안개</option>
													</select>
													 
													<input type="button" id="effectAddBtn" value="효과추가"/>
													-->
													<!-- file  
													<form action="#" method="post" id="editForm" enctype="multipart/mixed">
														<input type="file" onchange="imgFilePut(this.files)" />
													</form>
													-->
													<!-- file
													<input type="button" id="addObjectBtn" value="기존 오브젝트 추가"/>
													<input type="button" id="objCheckBtn" value="오브젝트 삭제"/>
													 -->
												</td>
											</tr>
											<!-- 
											<tr>
												<td colspan = "2">
													선택된 objId <br/>
													<input type="number" id="sObjId" disabled/>
													<br/> 시간 / 대기 시간 <br/>
													<input type="number" id="sTime"		placeholder="시간"/>
													<input type="number" id="sLatency"	placeholder="대기시간"/>
													<br/> top / left <br/>
													<input type="number" id="top"		placeholder="top"/>
													<input type="number" id="left"		placeholder="left"/>
													<br/> width / height <br/>
													<input type="number" id="width"		placeholder="width"/>
													<input type="number" id="height"	placeholder="height"/>
													<select id ="animate" name="animate">
														<option value="animate" >animate(움직임)</option>
														<option value="fadeIn" >fadeIn(나타남)</option>
														<option value="fadeOut" >fadeOut(없어짐)</option>
													</select>
													
													<input type="button" id="sceneSet" value="입력" />
												</td>
											</tr>
											 -->
											<%-- 
											<tr>
												<td>
													<div class="layerSelector">
														<span><input type="radio" name="layer" value="1" checked />레이어1</span>
													</div>
												</td>
												<td>
													<span>레이어</span><br>
													<div class="layerDiv">
														<input type="button" value="<<">
														<input type="button" value=">>">
														<input type="button" id = "addLayer" value="레이어 추가"/>
													</div>
												</td>
											</tr>
											 --%>
											<!--
											<tr>
												<td colspan = "2">
													<div class="sceneSelector">
														<span><input type="radio" name="scene" value="0" checked />scene 추가</span>
													</div>
												</td>
												<td>
													<span>scene</span><br>
													<div class="layerDiv">
														<input type="button" value="<<">
														<input type="button" value=">>">
														<input type="button" id = "addScene" value="scene 추가"/>
													</div>
												</td>
											</tr>
											-->
											<%-- 
											<tr>
												<td >
													<div class="screenSelector">
														<span><input type="radio" name="screen" value="0" checked />스크린1</span>
													</div>
												</td>
												<td>
													<span>스크린</span><br>
													<div class="layerDiv">
														<input type="button" value="<<">
														<input type="button" value=">>">
														<input type="button" id = "addScreen" onclick="addScreen()" value="스크린 추가"/>
													</div>
												</td>
											</tr>
											 --%>
											<!--
											<tr>
												<td colspan = "2">
													<div class="chapterSelector">
														<span><input type="radio" name="chapter" value="1" checked />챕터1</span>
													</div>
												</td>
												<td>
													<span>챕터</span><br>
													<div class="chapterDiv">
														<input type="button" id = "chapterPrev" value="<<">
														<input type="button" id = "chapterNext" value=">>">
														<input type="button" id = "addChapter" value="챕터 추가"/>
													</div>
												</td>
											</tr>
											-->
											<!-- 
											<tr>
												<td colspan = "2">
													<input type="button" onclick="jsonView()" value="출력">
													<p> chapter 출력 JSON</p>
													<textarea rows="20" cols="100" id="chapterJsonView"></textarea>
													<p> objList 출력 JSON</p>
													<textarea rows="20" cols="100" id="objListJsonView"></textarea>
													<p> xampleBox 출력 JSON</p>
													<textarea rows="20" cols="100" id="exampleBoxJsonView"></textarea>
													<p> anwserBox 출력 JSON</p>
													<textarea rows="20" cols="100" id="anwserBoxJsonView"></textarea>
												</td>
											</tr>
											 -->
											<tr>
												<td colspan = "2">
													<form id="saveFairy" action="saveFairy" method="post" onsubmit="return saveFairy()">
														<!-- <input type="submit" value="저장"/> -->
														<input type="hidden"  name="fpkNum" id="fpkNum" value="${fpk}"/>
														<input type="hidden"  name="chapterNum" id="chapterNum" value="${chapter}"/>
														<input type="hidden"  name="questionType" value="${fairytales.fairy_code}"/>
														<input type="hidden" id="saveChapter" name="chapter"/>
														<input type="hidden" id="saveObjList" name="objList"/>
														<input type="hidden" id="saveExample" name="exampleBox"/>
														<input type="hidden" id="saveAnwser" name="anwserBox"/>
													</form>
												</td>
											</tr>
										</tbody>
									</table>
								<%-- /본문위치 --%>
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
	<!-- 팝업 HTML -->
	<div class="dim-layer">
	    <div class="dimBg"></div>
	    <div id="layer" class="pop-layer">
	        <div class="pop-container">
	            <div class="pop-conts">
	            	<input type="hidden" id="popObjID">
	            	<!-- <form method="post" id="pop"> -->
						<table class="table text-center">
							<thead>
								<tr>
									<td>
										<b>Content</b><br>
										<textarea id="objText" rows="10" cols="50" style="resize: none;"></textarea>
										<input type="checkbox" id="qOnOff"><b>Question<b>
									</td>
								</tr>
							</thead>
							<tbody id="questionBase">
								<tr>
									<td id="anwserBase">
										<div class="col-md-12 col-sm-12"><b>정답</b></div>
										<input class="anwser" type="text">
									</td>
								</tr>
								<tr>
									<td id="exampleBase">	
										<div class="col-md-4 col-sm-4">
											<a href="#" class="btn" id="examplePlus"><i class="fa fa-plus-square">&nbsp;&nbsp;추가</i></a>
										</div>
										<div class="col-md-4 col-sm-4">
											<b>보기</b>
										</div>
										<div class="col-md-4 col-sm-4">
											<a href="#" class="btn" id="exampleMinus"><i class="fa fa-minus-square">&nbsp;&nbsp;삭제</i></a>
										</div>
										<input class="example" type="text">
									</td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td>
										<br>
										<a href="#" id=addObjTxtBtn class="btn btn-submit btn-layer">Register</a>
										<a href="#" id="btnDelet" class="btn btn-submit btn-layer">Delete</a>
			                			<a href="#" id="btnClose" class="btn btn-submit btn-layer">Close</a>
									</td>
								</tr>
							</tfoot>
						</table>
						
						<!-- 
						<table class="table text-center">
							<tr>
								<td>
									<b>분류</b>
								</td>
								<td>
									<select id="fcode" name = "fcode">
										<option value="jp">일본어
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
									<a href="#" id="btnDelet" hidden class="btn btn-submit btn-layer">Delete</a>
									<a href="#" id="btnSubmit" class="btn btn-submit btn-layer">Register</a>
		                			<a href="#" id="btnClose" class="btn btn-submit btn-layer">Close</a>
								</td>
							</tr>
						</table>
						 -->
					<!-- </form> -->
	                <!--// content-->
	            </div>
	        </div>
	    </div>
	</div>
	<!-- /팝업 HTML -->
	
	<!--/#footer-->
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/lightbox.min.js"></script>
	<script type="text/javascript" src="js/wow.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
	
	<!-- 팝업 스크립트 -->
	<script type="text/javascript">
		$(document).ready(function() {
			$('.btn-popup').click(function(){
				var $href = $(this).attr('href');
				layer_popup($href,$(this));
				return false;
			});
			//보기 추가
			$("#examplePlus").on("click",function(){
				if($(".example").length < 3){
					$("#exampleBase").append("<input class='example' type='text'>");
				}else{
					alert("너무 많습니다.");
				}
				return false;
			});
			//보기 삭제
			$("#exampleMinus").on("click",function(){
				if($(".example").length > $(".anwser").length){
					$(".example").last().remove();
				}else{
					alert("정답보다 적을 수는 없습니다.");
				}
				return false;
			});
			
			//팝업창 체크 유무
			$("#qOnOff").on("click",function(){
				if($("#qOnOff").prop("checked")){
					$("#questionBase").show();
				}else{
					$("#questionBase").hide();
				}
			});
			
			$('#btnSubmit').click(function(){insertFt(); return false;});
		});
		
		function layer_popup(el,$element){
			<%-- #layer수행번호 --%>
			if(el.substr(6) == 1){
				//등록
				$("#btnDelet").hide();
				$("#addObjTxtBtn").html('Register');
				$("#popObjID").val('');
				$("#objText").val('');
				$(".anwser").each(function(index,anwser){
					//전부 삭제
					$(anwser).remove();
				});
				$("#anwserBase").append("<input class='anwser' type='text'>");
				$(".example").each(function(index,example){
					//전부 삭제
					$(example).remove();
				});
				$("#exampleBase").append("<input class='example' type='text'>");
				$("#qOnOff").prop("checked",false);
				$("#questionBase").hide();
			}else{
				//수정
				$("#btnDelet").show();
				$("#addObjTxtBtn").html('Modify');
				$(objList).each(function(index,obj){
					if(obj.objId == el.substr(7)){
						$("#objText").val(obj.obj);
						if(obj.objType == "text"){
							$("#qOnOff").prop("checked",false);
							$("#questionBase").hide();
						}else{
							$("#qOnOff").prop("checked",true);
							$("#questionBase").show();
						}
					}
				});
				
				$("#popObjID").val(el.substr(7));
				
				//전체 삭제
				$(".anwser").each(function(index,anwser){
					$(anwser).remove();
				});
				var anwserCheck = true;
				$(anwserBox).each(function(index,anwsers){
					if(anwsers.obj_id == el.substr(7)){
						anwserCheck = false;
						console.log(anwsers.answer);
						var anwsplit = anwsers.answer.split("_");
						console.log(anwsplit.length);
						$(anwsplit).each(function(index,answer){
							console.log(answer);
							$("#anwserBase").append("<input class='anwser' type='text' value="+answer+">");
						})
					}
				});
				if(anwserCheck){
					$("#anwserBase").append("<input class='anwser' type='text'>");
				}
				
				//전체 삭제
				$(".example").each(function(index,example){
					$(example).remove();
				});
				var exampleCheck = true; 
				$(exampleBox).each(function(index,example){
					if(example.objId == el.substr(7)){
						exampleCheck = false;
						if(example.answer0){
							$("#exampleBase").append("<input class='example' type='text' value="+example.answer0+">");
						}
						if(example.answer1){
							$("#exampleBase").append("<input class='example' type='text' value="+example.answer1+">");
						}
						if(example.answer2){
							$("#exampleBase").append("<input class='example' type='text' value="+example.answer2+">");
						}
					}
				});
				//example 없으면 기본적인 하나 생성 수정!! 해야 할것 택스트에서 문제로 전환 및 문제에서 텍스트로 전환
				if(exampleCheck){
					$("#exampleBase").append("<input class='example' type='text'>");
				}
				
				//1.objId 넣어서 수정하고 2.업로드 3.screen 4.레이어 삭제
			}
			
			var $el = $(el.substr(0,6));				//레이어의 id를 $el 변수에 저장
			var isDim = $el.prev().hasClass('dimBg');	//dimmed 레이어를 감지하기 위한 boolean 변수
			
			isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();
			
			var  $elWidth  = $el.outerWidth()
			  	,$elHeight = $el.outerHeight()
			  	,docWidth  = $(document).width()
			  	,docHeight = $(document).height();
			
			// 화면의 중앙에 레이어를 띄운다.
			if ($elHeight < docHeight || $elWidth < docWidth) {
			    $el.css({
			    	  marginTop : (-$elHeight/2)-55
			    	, marginLeft: -$elWidth/2
			    })
			} else {
				$el.css({top: 0, left: 0});
			}
			
			
		};
		
		$('.layer .dimBg').click(function(){
			$('.dim-layer').fadeOut();
			return false;
		});
		//닫기
		$("#layer").find('#btnClose').click(function(){
			closePop();
			return false;
		});
		//텍스트/퀴즈 넣기
		$("#layer").find('#addObjTxtBtn').click(function(){
			if(addObjTxt()){
				closePop();
			};
			return false;
		});
		//지우기
		$("#layer").find('#btnDelet').click(function(){
			var objId = $("#popObjID").val();
			objDelete(objId);
			
			$(anwserBox).each(function(index,anwsers){
				if(anwsers.obj_id == objId){
					anwserBox.splice(index,1);
				}
			});
			
			$(exampleBox).each(function(index,example){
				if(example.objId == objId){
					exampleBox.splice(index,1);
				}
			});
			
			//선택 초기화;
			selectClear();
			//뷰리스트
			sceneViewList();
			//object view
			objViewList();
			//다시그려
			changeScreen();
			//팝업 닫기
			closePop();
			return false;
		});
		
		//팝업 닫기
		function closePop(){
			var isDim = $("#layer").prev().hasClass('dimBg');	//dimmed 레이어를 감지하기 위한 boolean 변수
			isDim ? $('.dim-layer').fadeOut() : $("#layer").fadeOut();
		}
		
		//initJson
		function initJson(){
			chapterJson = '${getChapter == ""? "{}" : getChapter}';
			objListJson = ${getObjList == ''? '[]' : getObjList};
			exampleJson = ${getExample == ''? '[]' : getExample};
			anwserJson  = ${getAnwser == ''? '[]' : getAnwser};
			
			setJson(chapterJson,objListJson,exampleJson,anwserJson);
		}
	</script>
</body>
</html>