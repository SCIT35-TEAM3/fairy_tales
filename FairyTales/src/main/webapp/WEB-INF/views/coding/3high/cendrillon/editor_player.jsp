<%@page import="global.sesoc.fairytales.dto.Chapter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script src="resources/js/jquery-ui.min.js"></script>
<script src="resources/js/jquery.oLoader.min.js"></script>
<link rel="stylesheet" type="text/css" href = "resources/css/fairy/back_sc_set.css">
<style type="text/css">
.div1 {width:4%;height:6%;top:20.5%; left:54%;padding:opx;border:1px solid #999;position: absolute; margin: 0px; background-color: white; z-index: 1;display:none;}
.div2 {width:4%;height:6%;top:50%; left:32%;padding:opx;border:1px solid #999;position: absolute; margin: 0px;background-color: white; z-index: 10;display:none;}


#loading {
 width: 100%;   
 height: 100%;   
 top: 0px;
 left: 0px;
 position: fixed;   
 display: block;     
 background-color: #fff;   
 z-index: 99;   
 text-align: center; }  
 
#loading-image {   
 position: absolute;   
 top: 50%;  
 left: 50%;   
 z-index: 100; } 


</style>
<script type="text/javascript">
//배경 1
//테두리 2
//캐릭터 및 이펙트 2
//스크립트 테두리3 
//답란 6
//스크립트 4
//정답가리개(?)5
//레이어 넘버 => Z-index

var screen = [];
<c:forEach items="${chapter.screen}" var ="screen" varStatus="status">
var scene<c:out value="${status.index}"/> = [
	<%-- src 추가 이미지 위치 --%>
	{"objId" : "background","top" : "0%","left" : "0%","width" : "100%","height" : "100%",
		"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "0","src" : "${chapter.background}"},
	{"objId" : "background_around","top" : "0%","left" : "0%","width" : "100%","height" : "100%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "2"},
	{"objId" : "script_around","top" : "-10%","left" : "8%","width" : "80%","height" : "80%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "3"},	
		
			
	{"objId" : "answer1","top" : "80%","left" : "28%","width" : "10%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "6"},	
	{"objId" : "answer2","top" : "80%","left" : "44%","width" : "10%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "6"},	
	{"objId" : "answer3","top" : "80%","left" : "60%","width" : "10%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "6"},
			
	{"objId" : "script","top" : "15.5%","left" : "22.2%","width" : "54%","height" : "20%",
			"animate" : "fadeIn",	"time" :  "2000",	"latency" : "0","layerNum" : "4"},		
	
	{"objId" : "code","top" : "45%","left" : "29%","width" : "40%","height" : "30%",
			"animate" : "fadeIn",	"time" :  "2000",	"latency" : "0","layerNum" : "4"},
			
	{"objId" : "script_hide1","top" : "21.5%","left" : "55%","width" : "4%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "5"},
	{"objId" : "script_hide2","top" : "21.5%","left" : "55%","width" : "4%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "5"},
	{"objId" : "script_hide3","top" : "21.5%","left" : "55%","width" : "4%","height" : "6%",
		"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "5"} //, 없으니 주의 할것
		
	<c:forEach items="${screen.scene}" var ="scene" varStatus="sstatus">
		<c:forEach items="${objectList}" var ="obj">
			<c:if test="${scene.objId == obj.objId}">
				<c:if test="${obj.objType eq 'img'}">
				,{
					"objId" :"img${status.index}${sstatus.index}"
					,"top" : "${scene.top}%"
					,"left" : "${scene.left}%"
					,"width" : "${scene.width}%"
					,"height" : "${scene.height}%"
					,"animate" : "${scene.animate}"
					,"time" :  "${scene.time}"
					,"latency" : "${scene.latency}"
					,"layerNum" : "${scene.layerNum}"
					,"src" : "${obj.obj}" <%-- src 추가 이미지 위치 --%>
				} 
				</c:if>
			</c:if>
		</c:forEach>
	</c:forEach>
	];
</c:forEach> 

var questions=[
<c:set var="qCheck" value="no"/>
<c:forEach items="${chapter.screen}" var ="screen" varStatus="status">
	<c:forEach items="${screen.scene}" var ="scene" varStatus="status">
		<c:forEach items="${objectList}" var ="obj">
			<c:if test="${scene.objId == obj.objId}">
				<c:if test="${obj.objType eq 'text'}">
					<c:if test="${qCheck eq 'yes'}">
						,
					</c:if>
						{"text" : "${obj.obj}"}
					<c:set var="qCheck" value="yes"/>
				</c:if>
			</c:if>
		</c:forEach>
	</c:forEach>
</c:forEach>
];

var code_questions=[
<c:set var="cqCheck" value="no"/>
<c:forEach items="${chapter.screen}" var ="screen" varStatus="status">
	<c:forEach items="${screen.scene}" var ="scene" varStatus="status">
		<c:forEach items="${objectList}" var ="obj">
			<c:if test="${scene.objId == obj.objId}">
				<c:if test="${obj.objType eq 'question'}">
					<c:if test="${cqCheck eq 'yes'}">
						,
					</c:if>
						{"text" : "${obj.obj}"}
					<c:set var="cqCheck" value="yes"/>
				</c:if>
			</c:if>
		</c:forEach>
	</c:forEach>
</c:forEach>
];

var answer = [
	<c:set var="aCheck" value="no"/>
	<c:forEach items="${chapter.screen}" var ="screen" varStatus="status">
		<c:forEach items="${screen.scene}" var ="scene" varStatus="status">
			<c:forEach items="${objectList}" var ="obj">
				<c:if test="${scene.objId == obj.objId}">
					<c:if test="${obj.objType eq 'question'}">
						<c:forEach items="${example}" var ="exam">
							<c:if test="${obj.objId == exam.objId}">
								<c:if test="${aCheck eq 'yes'}">
									,
								</c:if>
									{"answer1" : "${exam.answer0}","answer2" : "${exam.answer1}", "answer3" : "${exam.answer2}", "originalobjid" : "${obj.objId}"}
								<c:set var="aCheck" value="yes"/>
							</c:if>
						</c:forEach>
					</c:if>
				</c:if>
			</c:forEach>
		</c:forEach>
	</c:forEach> 
];
 var ss = "의미 없는 태그 개떡같은 이클립스 때문에 넣음";
 
<%-- 불필요 scene, sceneNum // 이미지 경로 objId에 넣는다. 
var scene0 = [
	{"sceneNum" : "1_background_1","objId" : "background","top" : "0%","left" : "0%","width" : "100%","height" : "100%",
		"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "1"},
	{"sceneNum" : "1_background_around_2","objId" : "background_around","top" : "0%","left" : "0%","width" : "100%","height" : "100%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "2"},
	{"sceneNum" : "1_script_around_3","objId" : "script_around","top" : "-10%","left" : "8%","width" : "80%","height" : "80%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "3"},	
		
			
	{"objId" : "answer1","top" : "80%","left" : "28%","width" : "10%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "6"},	
	{"objId" : "answer2","top" : "80%","left" : "44%","width" : "10%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "6"},	
	{"objId" : "answer3","top" : "80%","left" : "60%","width" : "10%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "6"},
			
	{"objId" : "script","top" : "15.5%","left" : "22.2%","width" : "54%","height" : "20%",
			"animate" : "fadeIn",	"time" :  "2000",	"latency" : "0","layerNum" : "4"},		
	
	{"objId" : "code","top" : "45%","left" : "29%","width" : "40%","height" : "30%",
			"animate" : "fadeIn",	"time" :  "2000",	"latency" : "0","layerNum" : "4"},
			
	{"objId" : "script_hide1","top" : "21.5%","left" : "55%","width" : "4%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "5"},
	{"objId" : "script_hide2","top" : "21.5%","left" : "55%","width" : "4%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "5"},
	{"objId" : "script_hide3","top" : "21.5%","left" : "55%","width" : "4%","height" : "6%",
		"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "5"},	
		
																								//빈칸 3개
																								//여기서 끊는다.
																								//배경,테두리,스크립트

	{"objId" : "father1","top" : "50%","left" : "30%","width" : "25%","height" : "50%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "2"},
	{"objId" : "mother","top" : "50%","left" : "50%","width" : "25%","height" : "50%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "2"},
	];
--%>

<%-- 각문제는 한 스크린입니다. 여긴 그냥 텍스트
var questions=[
	{"scene" : "first_1","text" : "むかしむかし、一人の男の人がいました。男の人はある女の人と二回目の結婚をしたのですが、その女の人はいつもえらそうにしている人でした。"},
	{"scene" : "first_2","text" : "女の人も二回目の結婚でして、前のだんなさんとの間に二人の娘がいました。その娘達は気まぐれで女の人にすごく似ていたんです。"},
	{"scene" : "first_3","text" : "同じように男の人にも幼い娘がいました。誰よりも心やさしい少女で、世界で一番うつくしい心の持ち主と言ってもいいくらいでした。。"},
	{"scene" : "first_4","text" : "結婚をしてから、まま母は可愛くて人がよい夫の娘がひどくじゃまに思えました。そこで、少女に家のしごとをおしつけ、狭くて暗いやねうらの部屋に追いやってしまいました。でも自分の娘達にはそれぞれきれいな部屋に住まわせました。"},
	{"scene" : "first_5","text" : "かわいそうな少女はがまんするしかありませんでした。お父さんに言っても忙しくて聞いてくれないし、お父さんはまま母の言いなりだからです。少女は家のしごとが終わるといつも灰だらけの部屋で座っていたので、みんな少女を「灰かぶり姫」という意味の、「シンデレラ」と呼びました。"},
	{"scene" : "first_6","text" : "ある日、王子様がダンスパーティを開くことになりました。お金持ちや有名な人など、色んなな人がまねかれました。シンデレラの二人の姉にも声がかかりました。姉達はとても喜びましたが、彼女達のせわをしなくてはならないシンデレラは嬉しくありませんでした。。"}
	];
 --%>
<%-- 각문제는 한 스크린입니다. 여긴 문제 
var code_questions=[
	{"qNum" : "45","text" : "for(%%;%%;%%){<br/>&nbsp&nbsp&nbspHello World<br/>&nbsp&nbsp&nbsp안녕하세요<br/>&nbsp&nbsp&nbspこんにちは。<br/>}"},
	{"qNum" : "46","text" : "if((1 %% 1) %% (A %% B)){<br/>&nbsp&nbsp&nbspHello World<br/>}"},
	{"qNum" : "47","text" : "int i = 0; <br/> while(true){<br/>&nbsp&nbsp&nbspif(i %% 3)&nbsp&nbsp&nbsp{<br/>&nbsp&nbsp&nbsp%%<br/>&nbsp&nbsp&nbsp}<br/>&nbsp&nbsp&nbsp%%<br/>}"},
	{"qNum" : "48","text" : "%%(1 < 10){<br/>&nbsp&nbsp&nbspHello world<br/>}%%(5 > 3){<br/>&nbsp&nbsp&nbsp안녕하세요<br/>}%%{<br/>&nbsp&nbsp&nbspこんいちは。<br/>}"},
	{"qNum" : "49","text" : "<br/>int i = %%.parseInt(abc);<br/><br/>%% dump = String.%%(123); "},
	{"qNum" : "50","text" : "<br/>%% i = 1;<br/>%% p = 1.0;<br/> %% q = abc;"}
	];    
 --%>
<%-- 각문제는 한 스크린입니다. 여긴 답 
var answer = [
	{"scene" : "first_1","answer1" : "i=0","answer2" : "i++", "answer3" : "i<10"},		//문제
	{"scene" : "first_2","answer1" : "==","answer2" : "||", "answer3" : "!="},
	{"scene" : "first_3","answer1" : ">","answer2" : "break;", "answer3" : "i++"},
	{"scene" : "first_4","answer1" : "else if","answer2" : "else", "answer3" : "if"},
	{"scene" : "first_5","answer1" : "valueOf","answer2" : "Integer", "answer3" : "String"},
	{"scene" : "first_6","answer1" : "String","answer2" : "double", "answer3" : "int"},
	]
--%>
	
</script>
</head>

<body id = "wrapper">
<div id="loading"><img id="loading-image" src="resources/fairy/loader1.gif" alt="Loading..." />
</div>
</body>

<%-- 
<c:forEach items="${chapter.screen}" var="screen" varStatus="i">

</c:forEach>
 --%>

<script type="text/javascript">
var end_count = 0;
var inputtext = '';		//넣을 텍스트
var codetext = '';		//코드넣을 텍스트
var b = '';				//덤프 텍스트
var text_count = 0;		//텍스트 카운터
var page_count = 1;		//페이지번호
var sinId = 0;			//씬번호
var background_per = '';//배경배율 정하는변수
var q_top = 0;			//문제상자 top
var q_left = 0;			//문제상자 left
var answer_offset=[]	//문제상자 이동용
var hide2_decide = 2;
var scene_count = 0;
var answer_count = answer.length-1;	//종료버튼 띄우기용
var originalobjid = ""; // 월래 사용하려던 objId

for(var i = 0 ; i < ${chapter.screen.size()} ; i++){

	screen.push(eval('scene'+i));
} 
 
 start:
	 
	 for(var i in screen[sinId]){
		 console.log("!! :" + JSON.stringify(screen[sinId][i]));
		 if($('#'+screen[sinId][i].objId).length == 0){
			 
			 if(screen[sinId][i].objId == "answer1"){
				 
  			 }else if(screen[sinId][i].objId == "answer2"){
				 
			 }else if(screen[sinId][i].objId == "answer3"){
				 
			 }else if(screen[sinId][i].objId == "script_hide1"){
				 
			 }else if(screen[sinId][i].objId == "script_hide2"){
				 
			 }else if(screen[sinId][i].objId == "script_hide3"){
				 
			 }else if(screen[sinId][i].objId == "code"){
				 
			 }else{
				 $('#wrapper').after('<img id="'+screen[sinId][i].objId+'" src="'+(screen[sinId][i].src != null ? screen[sinId][i].src : "./image?tmpImg="+screen[sinId][i].objId+".png")+'"/>');
				 $('#'+screen[sinId][i].objId).css({
					"width" : 1,
					"height" : 1,
					"position" : "absolute",
					"display" : "none"
				 })
			 }
		 }
	 }
	 
 
 
 $(function() { 
		setTimeout(function(){
			$('#loading').fadeOut(2000);
			$('#com').fadeIn(4000);
		},6000)
		story()
	}); 

function story(){
	
	 $('#script').html("");
	 $('#dump').remove();
	 $('#question1').empty();
	 $('#question2').empty();	
	 $('#script').remove();
	 inputtext = '';
	 b = '';
	 
loop: for(var i in screen[sinId]){
	
	if(screen[sinId][i].objId=="script"){
		
		
		if($('#script').length == 0){
			$('#script_around').after('<div id="'+screen[sinId][i].objId+'"><div>')	
		}
		$('#'+screen[sinId][i].objId).css({
				"position" : "absolute",
				"width" : screen[sinId][i].width,
				"height" : screen[sinId][i].height,
				"top":screen[sinId][i].top,
				"left":screen[sinId][i].left,
				"font-size":"25px",
				"text-align":"center",
				"display":"none",
				"z-index" : screen[sinId][i].layerNum*1
			}).fadeIn(screen[sinId][i].time*1);

		inputtext = questions[text_count].text;
		
	
		$('#script').html(inputtext).fadeIn(2000)	
			
									//추우우우웅려려려려려ㅕ렭
	}else if(screen[sinId][i].objId=="script_hide1"){
		
		if($('#script_hide1').length == 0){
			$('#script').after('<div id="'+screen[sinId][i].objId+'"> <div>')	
		}
		$('#'+screen[sinId][i].objId).css({
				"position" : "absolute",
				"width" : screen[sinId][i].width,
				"height" : screen[sinId][i].height,
				"top":screen[sinId][i].top,
				"left":screen[sinId][i].left,
				"background-color": "white",
				"border":"0.5px solid #999",
				"display":"block",
				"z-index" : screen[sinId][i].layerNum*1	,
				"visibility": "hidden"
			})
			//여기 이하 텍스트 분석
		end_count = i;
		if($('#question2').length == 0){
			break loop;
		}
	}else if(screen[sinId][i].objId=="script_hide2"){
	
		
		if($('#script_hide2').length == 0){
			$('#script').after('<div id="'+screen[sinId][i].objId+'"> <div>')	
		}
		$('#'+screen[sinId][i].objId).css({
				"position" : "absolute",
				"width" : screen[sinId][i].width,
				"height" : screen[sinId][i].height,
				"top":screen[sinId][i].top+1,
				"left":screen[sinId][i].left,
				"background-color": "white",
				"border":"0.5px solid #999",
				"display":"block",
				"z-index" : screen[sinId][i].layerNum*1	,
				"visibility": "hidden"
			})
			//여기 이하 텍스트 분석
		end_count = i;
	}else if(screen[sinId][i].objId=="script_hide3"){
	
		
		if($('#script_hide3').length == 0){
			$('#script').after('<div id="'+screen[sinId][i].objId+'"> <div>')	
		}
		$('#'+screen[sinId][i].objId).css({
				"position" : "absolute",
				"width" : screen[sinId][i].width,
				"height" : screen[sinId][i].height,
				"top":screen[sinId][i].top,
				"left":screen[sinId][i].left,
				"background-color": "white",
				"border":"0.5px solid #999",
				"display":"block",
				"z-index" : screen[sinId][i].layerNum*1	,
				"visibility": "hidden"
			})
			//여기 이하 텍스트 분석
		end_count = i;
		break loop;
	}else if(screen[sinId][i].objId=="code"){

		if($('#code').length == 0){
			$('#script').after('<div id="'+screen[sinId][i].objId+'"> <div>')	
		}
		$('#'+screen[sinId][i].objId).css({
				"position" : "absolute",
				"width" : screen[sinId][i].width,
				"height" : screen[sinId][i].height,
				"top":screen[sinId][i].top,
				"left":screen[sinId][i].left,
				"background-color": "white",
				"opacity": "0.8",
				"border":"0px solid #999",
				"display":"block",
				"z-index" : screen[sinId][i].layerNum*1	,
				//"visibility": "hidden"
			})
			//여기 이하 텍스트 분석
			inputtext = code_questions[text_count].text;
			
		var count = 0;
		
		for(var i = 0; i<inputtext.length;i++){
			
			if(inputtext[i] != '%'){
				b += inputtext[i]
			}else
			{
				if(count ==0){
					b += '<span id="question1" style="display:inline-block; opacity: 0.8; background-color:white; width:100px; height:16px;padding:0px;border:0px solid #999;margin: 0px;">'
					count = 1;
				}else if(count == 1){
					b += '</span>'
					count = 2;
				}
				else if(count ==2){
					b += '<span id="question2" style="display:inline-block; opacity: 0.8; background-color:white; width:100px; height:16px;padding:0px;border:0px solid #999;margin: 0px;">'
					count = 3;
				}else if(count == 3){
					b += '</span>'
					count = 4;
				}else if(count ==4){
					b += '<span id="question3" style="display:inline-block; opacity: 0.8; background-color:white; width:100px; height:16px;padding:0px;border:0px solid #999;margin: 0px;">'
						count = 5;
				}else if(count == 5){
					b += '</span>'
					count = 0;
				}
			}	
			
		}
			//cod_questions
		$('#code').html(b).fadeIn(2000);
		end_count = i;
		
		
	}
	else{

		if(screen[sinId][i].animate == "fadeIn"){

			if(screen[sinId][i].objId == 'answer1'){
				
				$('#'+screen[sinId][i].objId).remove();
				if($('#answer1').length == 0){
					$('#background').after('<div id="'+screen[sinId][i].objId+'" data-anval="'+answer[sinId].answer1+'">'+ answer[sinId].answer1 + '<div>')
					//오리지널 오브젝트 아이디 설정 objId
					console.log("originalobjid"+answer[sinId].originalobjid);
					originalobjid = answer[sinId].originalobjid;
				}
				
				$('#'+screen[sinId][i].objId).css({
					"position" : "absolute",
					"width" : screen[sinId][i].width,
					"height" : screen[sinId][i].height,
					"top":screen[sinId][i].top,
					"left":screen[sinId][i].left,
					"background-color": "white",
					"border":"1px solid #999",
					"display":"none",
					"z-index" : screen[sinId][i].layerNum*1,
					"text-align":"center",
					"line-height":"40px"
				}).fadeIn(screen[sinId][i].time*1)
				
				answer_offset.push({"top":screen[sinId][i].top,"left":screen[sinId][i].left});
				
				an1 = $('#'+screen[sinId][i].objId);
			}else if(screen[sinId][i].objId =='answer2'){
				$('#'+screen[sinId][i].objId).remove();
				if($('#answer2').length == 0){
					$('#background').after('<div id="'+screen[sinId][i].objId+'" data-anval="'+answer[sinId].answer2+'">'+ answer[sinId].answer2 + '<div>')
				}
				
				$('#'+screen[sinId][i].objId).css({
					"position" : "absolute",
					"width" : screen[sinId][i].width,
					"height" : screen[sinId][i].height,
					"top":screen[sinId][i].top,
					"left":screen[sinId][i].left,
					"background-color": "white",
					"border":"1px solid #999",
					"display":"none",
					"z-index" : screen[sinId][i].layerNum*1,
					"text-align":"center",
					"line-height":"40px"
				}).fadeIn(screen[sinId][i].time*1);
				answer_offset.push({"top":screen[sinId][i].top,"left":screen[sinId][i].left});
				an2 = $('#'+screen[sinId][i].objId);
			}else if(screen[sinId][i].objId =='answer3'){
				$('#'+screen[sinId][i].objId).remove();
				if($('#answer3').length == 0){
					$('#background').after('<div id="'+screen[sinId][i].objId+'" data-anval="'+answer[sinId].answer3+'">'+ answer[sinId].answer3 + '<div>')
				}
				
				$('#'+screen[sinId][i].objId).css({
					"position" : "absolute",
					"width" : screen[sinId][i].width,
					"height" : screen[sinId][i].height,
					"top":screen[sinId][i].top,
					"left":screen[sinId][i].left,
					"background-color": "white",
					"border":"1px solid #999",
					"display":"none",
					"z-index" : screen[sinId][i].layerNum*1,
					"text-align":"center",
					"line-height":"40px"
				}).fadeIn(screen[sinId][i].time*1);
				answer_offset.push({"top":screen[sinId][i].top,"left":screen[sinId][i].left});
			}else if(screen[sinId][i].objId =='background'){		
				
				if($('#background').length){
					$('#'+screen[sinId][i].objId).css({
						"background-size"		: "contain",
						"background-position"	: "center",
						"background-origin" 	: "content-box",
						"position"				: "absolute",
						"width"					: "100%", 
						"height"				:  "100%",
						"display": "none",
						"z-index" : screen[sinId][i].layerNum*1
					}).fadeIn(screen[sinId][i].time*1).delay(3000);	
				}else{
					$('#wrapper').after('<img id="'+screen[sinId][i].objId+'" src="'+(screen[sinId][i].src != null ? screen[sinId][i].src : "./image?tmpImg="+screen[sinId][i].objId+".png")+'"/>');
					$('#'+screen[sinId][i].objId).css({
						"background-size"		: "contain",
						"background-position"	: "center",
						"background-origin" 	: "content-box",
						"position"				: "absolute",
						"width"					: "100%", 
						"height"				:  "100%",
						"display": "none",
						"z-index" : screen[sinId][i].layerNum*1
					}).fadeIn(screen[sinId][i].time*1).delay(3000);	
				}
				
				
				background_per = "100%";
				
			}
			else{
				if($('#'+screen[sinId][i].objId).length==0){
					$('#background').after('<img id="'+screen[sinId][i].objId+'" src="'+screen[sinId][i].src+'"/>')	
				}
				
				$('#'+screen[sinId][i].objId).css({
					"position" : "absolute",
					"width" : screen[sinId][i].width,
					"height" : screen[sinId][i].height,
					"top":screen[sinId][i].top,
					"left":screen[sinId][i].left,
					"display": "none",
					"z-index" : screen[sinId][i].layerNum*1
				}).fadeIn(screen[sinId][i].time*1);
			}
		}else if(screen[sinId][i].animate == "animate"){
			console.log("!!!!!!!!!!!! : " +screen[sinId][i].src);
			$('#'+screen[sinId][i].objId).animate({"top" : screen[sinId][i].top, "left" : screen[sinId][i].left},screen[sinId][i].time);
			setTimeout(screen[sinId][i].latency);
		}else if(screen[sinId][i].animate == "fadeOut"){
			$('#'+screen[sinId][i].objId).fadeOut(screen[sinId][i].time*1);
			setTimeout(screen[sinId][i].latency);
		}
	}
	}

  $( function() {
	 var answer_save = []; 	//정답 저장용
	 
	$('#script').on("selectstart", function(event){return false;});
	$('#script').on("dragstart", function(event){return false;});
	$('#answer1').draggable({ revert: true });
	$('#answer2').draggable({ revert: true });
	$('#answer3').draggable({ revert: true });
	var droppableOffset1 = 0;						//	드롭되는 위치 찾기
	var droppableOffset2 = 0;
	var x1 = 0;
	var x2 = 0;
	var y1 = 0;
	var y2 = 0;
	if($('#question1').length != 0){
		droppableOffset1 = $('#question1').offset();
		var x1 = droppableOffset1.left;
		var y1 = droppableOffset1.top;
		$('#script_hide1').css({
			"top":(y1/window.innerHeight)*100+"%",
			"left":(x1/window.innerWidth)*100+"%",
			"width" :"100px",
			"height":"16px",
			 "visibility": "visible"});
		$('#script_hide').fadeIn(500)
		
	}
	if($('#question2').length != 0){
		droppableOffset2 = $('#question2').offset();
		var x2 = droppableOffset2.left;
		var y2 = droppableOffset2.top;
		$('#script_hide2').css({
			"top":(y2/window.innerHeight)*100+"%",
			"left":(x2/window.innerWidth)*100+"%",
			"width" :"100px",
			"height":"16px",
			 "visibility": "visible"});
		$('#script_hide').fadeIn(500)
	}
	if($('#question3').length != 0){
		droppableOffset2 = $('#question3').offset();
		var x2 = droppableOffset2.left;
		var y2 = droppableOffset2.top;
		$('#script_hide3').css({
			"top":(y2/window.innerHeight)*100+"%",
			"left":(x2/window.innerWidth)*100+"%",
			"width" :"100px",
			"height":"16px",
			 "visibility": "visible"});
		$('#script_hide').fadeIn(500)
	}
	
	
	/* $('#question').css({
		"background-color":"black"
	}) */
	 //width:100px;padding:0px;border:1px solid #999;margin: 0px;
	var len1 = $('#question1').length;
	var len2 = $('#question2').length;
	var len3 = $('#question3').length;
	var div1 = false;
	var div2 = false;
	var div3 = false;
	
	if(len1*len2*len3 != 0){

		$( "#question1, #question2, #question3" ).droppable({
			tolerance: "pointer" ,
	        drop: function( event, ui ) {
				location_lock_1 = true;										//	드롭되었다는걸 확인
				var a = [];		//answer1,2,3값
				var b = []; 	//question1,2,3값
				a = ui.draggable.attr('id');
				b = $(this).attr('id');
				var c = '';		//question 이름을 담을 용도
				var d = '';		//answer 이름을 담을 용도
				
				var valueHtml = ui.draggable.data("anval"); //  호출한 쪽에 값
				console.log("valueHtml :" + valueHtml);
				for(var i = 0; i<9;i++){			//question 퍼오기
					c += b[i]
				}
				
				for(var i = 0; i<7;i++){			//answer 퍼오기
					d += a[i];
				}	
				
				if(d == "answer1"){
					
					if(c == "question1"){
						$("#script_hide1").text('(1)').css({
							"font-size":"25px",
							"text-align":"center",
							"line-height":"13px"
							});													//	제대로 드롭되었으면, 드롭값 div1를 참으로
						answer_save[0] = valueHtml;											//	첫번째[정답,정답,페이지번호]
						div1 = true;
					}else if(c == "question2"){
						$("#script_hide2").text('(1)').css({
							"font-size":"25px",
							"text-align":"center",
							"line-height":"13px"
							});													//	제대로 드롭되었으면, 드롭값 div1를 참으로
						answer_save[1] = valueHtml;											//	첫번째[정답,정답,페이지번호]
						div2 = true;
					}else{
						$("#script_hide3").text('(1)').css({
							"font-size":"25px",
							"text-align":"center",
							"line-height":"13px"
							});													//	제대로 드롭되었으면, 드롭값 div1를 참으로
						answer_save[2] = valueHtml;											//	첫번째[정답,정답,페이지번호]
						div3 = true;
					}
					
				}else if(d == "answer2"){
					if(c == "question1"){
						$("#script_hide1").text('(2)').css({
							"font-size":"25px",
							"text-align":"center",
							"line-height":"13px"
							});													//	제대로 드롭되었으면, 드롭값 div1를 참으로
						answer_save[0] = valueHtml;											//	첫번째[정답,정답,페이지번호]
						div1 = true;
					}else if(c == "question2"){
						$("#script_hide2").text('(2)').css({
							"font-size":"25px",
							"text-align":"center",
							"line-height":"13px"
							});													//	제대로 드롭되었으면, 드롭값 div1를 참으로
						answer_save[1] = valueHtml;											//	첫번째[정답,정답,페이지번호]
						div2 = true;
					}else{
						$("#script_hide3").text('(2)').css({
							"font-size":"25px",
							"text-align":"center",
							"line-height":"13px"
							});													//	제대로 드롭되었으면, 드롭값 div1를 참으로
						answer_save[2] = valueHtml;											//	첫번째[정답,정답,페이지번호]
						div3 = true;
					}
				}else if(d == "answer3"){
					if(c == "question1"){
						$("#script_hide1").text('(3)').css({
							"font-size":"25px",
							"text-align":"center",
							"line-height":"13px"
							});													//	제대로 드롭되었으면, 드롭값 div1를 참으로
						answer_save[0] = valueHtml;											//	첫번째[정답,정답,페이지번호]
						div1 = true;
					}else if(c == "question2"){
						$("#script_hide2").text('(3)').css({
							"font-size":"25px",
							"text-align":"center",
							"line-height":"13px"
							});													//	제대로 드롭되었으면, 드롭값 div1를 참으로
						answer_save[1] = valueHtml;											//	첫번째[정답,정답,페이지번호]
						div2 = true;
					}else{
						$("#script_hide3").text('(3)').css({
							"font-size":"25px",
							"text-align":"center",
							"line-height":"13px"
							});													//	제대로 드롭되었으면, 드롭값 div1를 참으로
						answer_save[2] = valueHtml;											//	첫번째[정답,정답,페이지번호]
						div3 = true;
					}
				}

				if(div1&div2&div3){
					//여기 페이지번호 바꿔야함 ! (스크린번호/씬번호 푸쉬)

					answer_save.push(originalobjid);									// objId
					answer_save.push(${chap});											// 챕터 번호
					answer_save.push(${ft});											// 동화 번호
					answer_save.push(${qt});											// 동화 구분 java 일본어
					console.log("answer_save :" + answer_save);
					  $.ajax({
						method	: 'POST',
						url		: 'first_code_answer2',
						data	: "answer="+answer_save,	//함수라서 ''을 쓰지 않는다.
						success : function(resp){
					
							if(resp == 1){			//만약정답이라면
								//answer = [1,1,2]
								
								$('#answer1').fadeOut(500);
								$('#answer2').fadeOut(500);
								$('#answer3').fadeOut(500,function(){				//이하 정답맞추고 나서 뿌리는 부분
								var a = inputtext									//원본텍스트
								var first_index = '';								//빈칸 채우기
		
									var count = 0;
									for(var i = 0; i<a.length;i++){
										if(a[i] != '%'){
											first_index += a[i]
										}else{	
											if(count ==0){
												first_index += '<span style="display:inline-block;width:100px; height:16px;color:red; text-align:center;">';
												first_index +=$('#answer'+answer_save[0]).text();	//답을 적용c 
												first_index +='</span>'
												count = 1;
											}else if(count == 1){
												first_index = first_index
												count = 2;
											}else if(count ==2){
												first_index += '<span style="display:inline-block;width:100px; height:16px;color:red;text-align:center;">';
												first_index +=$('#answer'+answer_save[1]).text();
												first_index += '</span>';
												count = 3;
											}else if(count ==3){
												first_index += '<span style="display:inline-block;width:100px; height:16px;color:red;text-align:center;">';
												first_index +=$('#answer'+answer_save[2]).text();
												first_index += '</span>';
												count = 4;
											}else if(count == 4){
												first_index  = first_index;
												count = 0;
											}
										}
									}
									$('#code').fadeOut(1000,function(){
										$('#question').css({
											"background-color" : "",
											"opacity":"1"
										})
									})
									
									$('#script_hide1').fadeOut(1000,function(){
										$('#question').css({
											"background-color" : "",
											"opacity":"1"
										})
									})
									$('#script_hide2').fadeOut(1000,function(){
										$('#question').css({
											"background-color" : "",
											"opacity":"1"
										})
									})
									
									$('#script_hide3').fadeOut(1000,function(){
										$('#question').css({
											"background-color" : "",
											"opacity":"1"
										})
									})
										//$('#code').html(first_index);						//뿌린다.
										
										
										for(var i = end_count*1+1;i<screen[sinId].length;i++){


											if(screen[sinId][i].animate == "fadeIn"){
													if($('#'+screen[sinId][i].length) == 0){
														$('#background').after('<img id="'+screen[sinId][i].objId+'" src="'+screen[sinId][i].src+'"/>')
													}
													$('#'+screen[sinId][i].objId).css({
														"position" : "absolute",
														"width" : screen[sinId][i].width,
														"height" : screen[sinId][i].height,
														"top":screen[sinId][i].top,
														"left":screen[sinId][i].left,
														"display": "none",
														"z-index" : screen[sinId][i].layerNum
													}).fadeIn(screen[sinId][i].time*10000);
													
											}else if(screen[sinId][i].animate == "animate"){
												$('#'+screen[sinId][i].objId).animate({"top" : screen[sinId][i].top, "left" : screen[sinId][i].left},screen[sinId][i].time);
												setTimeout(screen[sinId][i].latency);
											}else if(screen[sinId][i].animate == "fadeOut"){
												$('#'+screen[sinId][i].objId).fadeOut(screen[sinId][i].time*1);
												setTimeout(screen[sinId][i].latency);
											}
										}
										
									
								});
								
								if(answer_count != sinId){
									$('#background').after('<input type="button" id="next" value="다음버튼" onclick="next()" style="position:absolute;top:85%;left:85%;z-index:10"/>')
								}
								else{
									$('#background').after('<input type="button" id="next" value="종료버튼" onclick="end()" style="position:absolute;top:85%;left:85%;z-index:10"/>')
								}
							
								
								
							
							}
							else if(resp == 0){
								alert("오답!");
								fail();
								//location.href="${pageContext.request.contextPath}/cendrillon_code1";
							}
						
					
				}
					  })
				}	 
	        }
	      });			
	
	}
  });  
 }
 
 $( window ).resize(function() {
	 	/* $('#script_hide').css({
	 		"top" : ($('#question').top / $('#background').top)*100+"%",
	 		"left" : ($('#question').left / $('#background').left)*100+"%",
	 		"width" : ($('#question').width() / $('#background').width())*100+"%",
	 		"heigth" : ($('#question').height() / $('#background').height())*100+"%"
	 	}) */
	 	//alert($('#question').length)
	 if($('#background').length){
		 
		 	if($('#question1').length){
			 	$('#script_hide1').css({
			 		"top" : $('#question1').offset().top,
			 		"left" : $('#question1').offset().left
			 	})
		 	}
		 	
		 	if($('#question2').length){
			 	$('#script_hide2').css({
			 		"top" : $('#question2').offset().top,
			 		"left" : $('#question2').offset().left
			 	})
		 	}
		 	if($('#question3').length){
			 	$('#script_hide3').css({
			 		"top" : $('#question3').offset().top,
			 		"left" : $('#question3').offset().left
			 	})
		 	}
		 	
		 	$('#answer1').css({
		 		"top" : answer_offset[0].top,
		 		"left" : answer_offset[0].left
		 	})
		 	$('#answer2').css({
		 		"top" : answer_offset[1].top,
		 		"left" : answer_offset[1].left
		 	})
		 	$('#answer3').css({
		 		"top" : answer_offset[2].top,
		 		"left" : answer_offset[2].left
		 	}) 
	 }
});

 function end(){
	 window.close();
 }
 
 function fail(){
	 	div1 = false;
	 	div2 = false;
			setTimeout(function(){
				 for(var i in screen[sinId]){
					 
					 /* $(":image").css({
						 "display" : "none"
					 }) */
					 
					 if(screen[sinId][i].objId == "script"){
						 $('#script').html(""); 	 
					 }else{
						$('#'+screen[sinId][i].objId).remove();
					 }
					 /* else if(screen[sinId][i].objId == "script_hide1"){
						 $('#'+screen[sinId][i].objId).remove();
					 }else if(screen[sinId][i].objId == "script_hide2"){
						 $('#'+screen[sinId][i].objId).remove();
					 } */
				 }
				 
				 for(var i in screen[sinId]){
					 
					 if($('#'+screen[sinId][i].objId).length == 0){
						 if(screen[sinId][i].objId == "answer1")
						 {
							 
			  			 }
						 else if(screen[sinId][i].objId == "answer2"){
							 
						 }else if(screen[sinId][i].objId == "answer3"){
							 
						 }else if(screen[sinId][i].objId == "script_hide1"){
							 
						 }else if(screen[sinId][i].objId == "script_hide2"){
							 
						 }else if(screen[sinId][i].objId == "script_hide3"){
							 
						 }else if(screen[sinId][i].objId == "code"){
							 
						 }else{
							 $('#wrapper').after('<img id="'+screen[sinId][i].objId+'" src="'+(screen[sinId][i].src != null ? screen[sinId][i].src : "./image?tmpImg="+screen[sinId][i].objId+".png")+'"/>');
							 $('#'+screen[sinId][i].objId).css({
								"width" : 1,
								"height" : 1,
								"position" : "absolute",
								"display" : "none"
							 })
						 }
					 }
				 }
				 
				 $('#question1').remove();
				 $('#question2').remove();	
				 $('#next').remove();
				 
				 
				 story();
				
			 },1000);
			 
			
}
 
 function next(){
	 	div1 = false;
	 	div2 = false;
			setTimeout(function(){
				 for(var i in screen[sinId]){
					 
					 /* $(":image").css({
						 "display" : "none"
					 }) */
					 
					 if(screen[sinId][i].objId == "script"){
						 $('#script').html("");
						 $('#'+screen[sinId][i].objId).remove();
					 }else if(screen[sinId][i].objId == "answer1"){
						$('#'+screen[sinId][i].objId).remove();
					 }else if(screen[sinId][i].objId == "answer2"){
						$('#'+screen[sinId][i].objId).remove();
					 }else if(screen[sinId][i].objId == "answer3"){
						$('#'+screen[sinId][i].objId).remove();
					 }else if(screen[sinId][i].objId == "script_hide1"){
						$('#'+screen[sinId][i].objId).remove();
					 }else if(screen[sinId][i].objId == "script_hide2"){
						$('#'+screen[sinId][i].objId).remove();
					 }else if(screen[sinId][i].objId == "script_hide3"){
						$('#'+screen[sinId][i].objId).remove();
					 }
					 /* else if(screen[sinId][i].objId == "script_hide1"){
						 $('#'+screen[sinId][i].objId).remove();
					 }else if(screen[sinId][i].objId == "script_hide2"){
						 $('#'+screen[sinId][i].objId).remove();
					 } */
				 }
				 sinId++;
				 for(var i in screen[sinId]){
					 
					 if($('#'+screen[sinId][i].objId).length == 0){
						 if(screen[sinId][i].objId == "answer1")
						 {
							 
			  			 }
						 else if(screen[sinId][i].objId == "answer2"){
							 
						 }else if(screen[sinId][i].objId == "answer3"){
							 
						 }else if(screen[sinId][i].objId == "script_hide1"){
							 
						 }else if(screen[sinId][i].objId == "script_hide2"){
							 
						 }else if(screen[sinId][i].objId == "script_hide3"){
							 
						 }else if(screen[sinId][i].objId == "code"){
							 
						 }else{
							 $('#wrapper').after('<img id="'+screen[sinId][i].objId+'" src="'+(screen[sinId][i].src != null ? screen[sinId][i].src : "./image?tmpImg="+screen[sinId][i].objId+".png")+'"/>');
							 $('#'+screen[sinId][i].objId).css({
								"width" : 1,
								"height" : 1,
								"position" : "absolute",
								"display" : "none"
							 })
						 }
					 }
				 }
				 
				 $('#question1').remove();
				 $('#question2').remove();	
				 $('#next').remove();
				 text_count++;
				 
				 story();
				
			 },1000);
			 
			
 }
 
</script>
</html>