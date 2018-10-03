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



var screen = [];/* 
var scene0 = [		
	{"sceneNum" : "1_background_1","objId" : "background","top" : "0%","left" : "0%","width" : "100%","height" : "100%",
		"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "1"},
	{"sceneNum" : "1_background_around_2","objId" : "background_around","top" : "0%","left" : "0%","width" : "100%","height" : "100%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "2"},
	{"sceneNum" : "1_script_around_3","objId" : "script_around","top" : "-10%","left" : "8%","width" : "80%","height" : "80%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "3"},	
		
			
	{"objId" : "answer1","top" : "50%","left" : "32%","width" : "10%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "6"},	
	{"objId" : "answer2","top" : "50%","left" : "47%","width" : "10%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "6"},	
	{"objId" : "answer3","top" : "50%","left" : "62%","width" : "10%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "6"},
			
	{"objId" : "script","top" : "15.5%","left" : "22.2%","width" : "54%","height" : "20%",
			"animate" : "fadeIn",	"time" :  "2000",	"latency" : "0","layerNum" : "4"},
	{"objId" : "script_hide1","top" : "21.5%","left" : "55%","width" : "4%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "5"},
	{"objId" : "script_hide2","top" : "21.5%","left" : "55%","width" : "4%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "5"},
																								//여기서 끊는다.
																								//배경,테두리,스크립트

	{"objId" : "father1","top" : "50%","left" : "30%","width" : "25%","height" : "50%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "2"},
	{"objId" : "mother","top" : "50%","left" : "50%","width" : "25%","height" : "50%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "2"},
	];

var scene1 = [		
	{"sceneNum" : "1_background_1","objId" : "background","top" : "0%","left" : "0%","width" : "100%","height" : "100%",
		"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "1"},
	{"sceneNum" : "1_background_around_2","objId" : "background_around","top" : "0%","left" : "0%","width" : "100%","height" : "100%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "2"},
	{"sceneNum" : "1_script_around_3","objId" : "script_around","top" : "-10%","left" : "8%","width" : "80%","height" : "80%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "3"},	
		
			
	{"objId" : "answer1","top" : "50%","left" : "32%","width" : "10%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "6"},	
	{"objId" : "answer2","top" : "50%","left" : "47%","width" : "10%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "6"},	
	{"objId" : "answer3","top" : "50%","left" : "62%","width" : "10%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "6"},
			
	{"objId" : "script","top" : "15.5%","left" : "22.2%","width" : "54%","height" : "20%",
			"animate" : "fadeIn",	"time" :  "2000",	"latency" : "0","layerNum" : "4"},
	{"objId" : "script_hide1","top" : "21.5%","left" : "55%","width" : "4%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "5"},
																								//여기서 끊는다.
																								//배경,테두리,스크립트

	{"objId" : "sis2_sha","top" : "50%","left" : "30%","width" : "25%","height" : "50%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "2"},
	{"objId" : "sis1_sha","top" : "50%","left" : "50%","width" : "25%","height" : "50%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "2"},
	{"objId" : "mother","top" : "45%","left" : "70%","width" : "25%","height" : "50%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "2"},
		
	{"objId" : "sis2_sha","top" : "45%","left" : "30%","width" : "25%","height" : "50%",
		"animate" : "animate",	"time" :  "200",	"latency" : "0","layerNum" : "2"},
	{"objId" : "sis2_sha","top" : "50%","left" : "30%","width" : "25%","height" : "50%",
		"animate" : "animate",	"time" :  "200",	"latency" : "0","layerNum" : "2"},
	{"objId" : "sis1_sha","top" : "45%","left" : "50%","width" : "25%","height" : "50%",
		"animate" : "animate",	"time" :  "600",	"latency" : "0","layerNum" : "2"},
	{"objId" : "sis1_sha","top" : "50%","left" : "50%","width" : "25%","height" : "50%",
		"animate" : "animate",	"time" :  "600",	"latency" : "0","layerNum" : "2"},
	{"objId" : "sis2_sha","top" : "45%","left" : "30%","width" : "25%","height" : "50%",
		"animate" : "animate",	"time" :  "200",	"latency" : "0","layerNum" : "2"},
	{"objId" : "sis2_sha","top" : "50%","left" : "30%","width" : "25%","height" : "50%",
		"animate" : "animate",	"time" :  "200",	"latency" : "0","layerNum" : "2"},
	{"objId" : "sis1_sha","top" : "45%","left" : "50%","width" : "25%","height" : "50%",
		"animate" : "animate",	"time" :  "600",	"latency" : "0","layerNum" : "2"},
	{"objId" : "sis1_sha","top" : "50%","left" : "50%","width" : "25%","height" : "50%",
		"animate" : "animate",	"time" :  "600",	"latency" : "0","layerNum" : "2"},
	];
	

var scene2 = [		
	{"sceneNum" : "1_background_1","objId" : "background","top" : "0%","left" : "0%","width" : "100%","height" : "100%",
		"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "1"},
	{"sceneNum" : "1_background_around_2","objId" : "background_around","top" : "0%","left" : "0%","width" : "100%","height" : "100%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "2"},
	{"sceneNum" : "1_script_around_3","objId" : "script_around","top" : "-10%","left" : "8%","width" : "80%","height" : "80%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "3"},	
		
			
	{"objId" : "answer1","top" : "50%","left" : "32%","width" : "10%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "6"},	
	{"objId" : "answer2","top" : "50%","left" : "47%","width" : "10%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "6"},	
	{"objId" : "answer3","top" : "50%","left" : "62%","width" : "10%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "6"},
			
	{"objId" : "script","top" : "15.5%","left" : "22.2%","width" : "54%","height" : "20%",
			"animate" : "fadeIn",	"time" :  "2000",	"latency" : "0","layerNum" : "4"},
	{"objId" : "script_hide1","top" : "21.5%","left" : "55%","width" : "4%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "5"},
	{"objId" : "script_hide2","top" : "21.5%","left" : "55%","width" : "4%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "5"},
																								//여기서 끊는다.
																								//배경,테두리,스크립트
	
	{"objId" : "father1","top" : "50%","left" : "20%","width" : "25%","height" : "50%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "2"},
	{"objId" : "sin_sha","top" : "50%","left" : "40%","width" : "25%","height" : "50%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "2"},
	{"objId" : "shin","top" : "50%","left" : "40%","width" : "25%","height" : "50%",
		"animate" : "fadeIn",	"time" :  "2000",	"latency" : "0","layerNum" : "2"},
	{"objId" : "shin","top" : "50%","left" : "40%","width" : "25%","height" : "50%",
		"animate" : "fadeOut",	"time" :  "500",	"latency" : "0","layerNum" : "2"},
	{"objId" : "shin","top" : "50%","left" : "40%","width" : "25%","height" : "50%",
		"animate" : "fadeIn",	"time" :  "500",	"latency" : "0","layerNum" : "2"},
	{"objId" : "shin","top" : "50%","left" : "40%","width" : "25%","height" : "50%",
		"animate" : "fadeOut",	"time" :  "500",	"latency" : "0","layerNum" : "2"},
	{"objId" : "shin","top" : "50%","left" : "40%","width" : "25%","height" : "50%",
		"animate" : "fadeIn",	"time" :  "500",	"latency" : "0","layerNum" : "2"},
	{"objId" : "shin","top" : "50%","left" : "40%","width" : "25%","height" : "50%",
		"animate" : "fadeOut",	"time" :  "500",	"latency" : "0","layerNum" : "2"},
	];
	
var scene3 = [		
	{"sceneNum" : "1_background_1","objId" : "background","top" : "0%","left" : "0%","width" : "100%","height" : "100%",
		"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "1"},
	{"sceneNum" : "1_background_around_2","objId" : "background_around","top" : "0%","left" : "0%","width" : "100%","height" : "100%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "2"},
	{"sceneNum" : "1_script_around_3","objId" : "script_around","top" : "-10%","left" : "8%","width" : "80%","height" : "80%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "3"},	
		
			
	{"objId" : "answer1","top" : "50%","left" : "32%","width" : "10%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "6"},	
	{"objId" : "answer2","top" : "50%","left" : "47%","width" : "10%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "6"},	
	{"objId" : "answer3","top" : "50%","left" : "62%","width" : "10%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "6"},
			
	{"objId" : "script","top" : "15.5%","left" : "22.2%","width" : "54%","height" : "20%",
			"animate" : "fadeIn",	"time" :  "2000",	"latency" : "0","layerNum" : "4"},
	{"objId" : "script_hide1","top" : "21.5%","left" : "55%","width" : "4%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "5"},
																								//여기서 끊는다.
																								//배경,테두리,스크립트
	{"objId" : "sis2_sha","top" : "45%","left" : "5%","width" : "25%","height" : "50%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "2"},
	{"objId" : "sis1_sha","top" : "46%","left" : "22%","width" : "25%","height" : "50%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "2"},
	{"objId" : "sin_sha","top" : "50%","left" : "45%","width" : "25%","height" : "50%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "2"},
	{"objId" : "mother_re","top" : "45%","left" : "70%","width" : "25%","height" : "50%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "2"},
		
	{"objId" : "bucket","top" : "75%","left" : "67%","width" : "10%","height" : "20%",
		"animate" : "fadeIn",	"time" :  "3000",	"latency" : "0","layerNum" : "3"},
	{"objId" : "houki","top" : "74%","left" : "69%","width" : "10%","height" : "20%",
		"animate" : "fadeIn",	"time" :  "3000",	"latency" : "0","layerNum" : "2"},
	{"objId" : "mom_ar","top" : "60%","left" : "88%","width" : "7%","height" : "20%",
		"animate" : "fadeIn",	"time" :  "500",	"latency" : "0","layerNum" : "2"},
	{"objId" : "sad","top" : "66.2%","left" : "49.7%","width" : "15%","height" : "13%",
		"animate" : "fadeIn",	"time" :  "500",	"latency" : "0","layerNum" : "3"},
		
	{"objId" : "sis_ha","top" : "44.2%","left" : "3%","width" : "44%","height" : "50%",
		"animate" : "fadeIn",	"time" :  "3000",	"latency" : "0","layerNum" : "3"},
	{"objId" : "sis_ha","top" : "44.2%","left" : "3%","width" : "44%","height" : "50%",
		"animate" : "fadeOut",	"time" :  "500",	"latency" : "0","layerNum" : "3"},
	{"objId" : "mom_ar","top" : "60%","left" : "88%","width" : "7%","height" : "20%",
		"animate" : "fadeOut",	"time" :  "0",	"latency" : "0","layerNum" : "2"},	
	{"objId" : "sis_ha","top" : "44.2%","left" : "3%","width" : "44%","height" : "50%",
		"animate" : "fadeIn",	"time" :  "500",	"latency" : "0","layerNum" : "3"},
	{"objId" : "mom_ar","top" : "60%","left" : "92%","width" : "7%","height" : "20%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "2"},	
	{"objId" : "sis_ha","top" : "44.2%","left" : "3%","width" : "44%","height" : "50%",
		"animate" : "fadeOut",	"time" :  "500",	"latency" : "0","layerNum" : "3"},
	{"objId" : "sis_ha","top" : "44.2%","left" : "3%","width" : "44%","height" : "50%",
		"animate" : "fadeIn",	"time" :  "500",	"latency" : "0","layerNum" : "3"},
	
	
	];
	
var scene4 = [		
	{"sceneNum" : "1_background_1","objId" : "background","top" : "0%","left" : "0%","width" : "100%","height" : "100%",
		"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "1"},
	{"sceneNum" : "1_background_around_2","objId" : "background_around","top" : "0%","left" : "0%","width" : "100%","height" : "100%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "2"},
	{"sceneNum" : "1_script_around_3","objId" : "script_around","top" : "-10%","left" : "8%","width" : "80%","height" : "80%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "3"},	
		
			
	{"objId" : "answer1","top" : "50%","left" : "32%","width" : "10%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "6"},	
	{"objId" : "answer2","top" : "50%","left" : "47%","width" : "10%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "6"},	
	{"objId" : "answer3","top" : "50%","left" : "62%","width" : "10%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "6"},
			
	{"objId" : "script","top" : "15.5%","left" : "22.2%","width" : "54%","height" : "20%",
			"animate" : "fadeIn",	"time" :  "2000",	"latency" : "0","layerNum" : "4"},
	{"objId" : "script_hide1","top" : "21.5%","left" : "55%","width" : "4%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "5"},
																								//여기서 끊는다.
																								//배경,테두리,스크립트
	{"objId" : "sin_sad1","top" : "45%","left" : "65%","width" : "25%","height" : "50%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "3"},
	{"objId" : "father_re","top" : "43%","left" : "24%","width" : "25%","height" : "50%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "2"},
	{"objId" : "mother_re","top" : "40%","left" : "5%","width" : "25%","height" : "50%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "2"},
	{"objId" : "shadow","top" : "84%","left" : "60%","width" : "25%","height" : "15%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "2"},
	{"objId" : "sin_sad2","top" : "44.5%","left" : "65.2%","width" : "25%","height" : "50%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "2"},
	{"objId" : "sin_sad1","top" : "45%","left" : "65%","width" : "25%","height" : "50%",
		"animate" : "fadeOut",	"time" :  "2000",	"latency" : "0","layerNum" : "2"},
		
	{"objId" : "shin","top" : "37%","left" : "-5%","width" : "60%","height" : "60%",
		"animate" : "fadeIn",	"time" :  "2000",	"latency" : "0","layerNum" : "2"},
	{"objId" : "shin","top" : "37%","left" : "-5%","width" : "60%","height" : "60%",
		"animate" : "fadeOut",	"time" :  "500",	"latency" : "0","layerNum" : "2"},
		
	{"objId" : "shin","top" : "37%","left" : "-5%","width" : "60%","height" : "60%",
		"animate" : "fadeIn",	"time" :  "500",	"latency" : "0","layerNum" : "2"},
	{"objId" : "shin","top" : "37%","left" : "-5%","width" : "60%","height" : "60%",
		"animate" : "fadeOut",	"time" :  "500",	"latency" : "0","layerNum" : "2"},	
	{"objId" : "shin","top" : "37%","left" : "-5%","width" : "60%","height" : "60%",
		"animate" : "fadeIn",	"time" :  "500",	"latency" : "0","layerNum" : "2"},
	{"objId" : "shin","top" : "37%","left" : "-5%","width" : "60%","height" : "60%",
		"animate" : "fadeOut",	"time" :  "500",	"latency" : "0","layerNum" : "2"},	
	];
	
var scene5 = [		
	{"sceneNum" : "1_background_1","objId" : "background","top" : "0%","left" : "0%","width" : "100%","height" : "100%",
		"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "1"},
	{"sceneNum" : "1_background_around_2","objId" : "background_around","top" : "0%","left" : "0%","width" : "100%","height" : "100%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "2"},
	{"sceneNum" : "1_script_around_3","objId" : "script_around","top" : "-10%","left" : "8%","width" : "80%","height" : "80%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "3"},	
		
			
	{"objId" : "answer1","top" : "50%","left" : "32%","width" : "10%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "6"},	
	{"objId" : "answer2","top" : "50%","left" : "47%","width" : "10%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "6"},	
	{"objId" : "answer3","top" : "50%","left" : "62%","width" : "10%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "6"},
			
	{"objId" : "script","top" : "15.5%","left" : "22.2%","width" : "54%","height" : "20%",
			"animate" : "fadeIn",	"time" :  "2000",	"latency" : "0","layerNum" : "4"},
	{"objId" : "script_hide1","top" : "21.5%","left" : "55%","width" : "4%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "5"},
	{"objId" : "script_hide2","top" : "21.5%","left" : "55%","width" : "4%","height" : "6%",
			"animate" : "fadeIn",	"time" :  "200",	"latency" : "0","layerNum" : "5"},
																								//여기서 끊는다.
																								//배경,테두리,스크립트
	{"objId" : "sin_normal","top" : "47%","left" : "65%","width" : "25%","height" : "50%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "3"},
	{"objId" : "sis2","top" : "45%","left" : "3%","width" : "25%","height" : "50%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "3"},
	{"objId" : "sis1_re","top" : "45%","left" : "25%","width" : "25%","height" : "50%",
		"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "3"},
	
	];
*/	
var questions=[
	{"qNum" : "48","text" : "むかしむかし、一人の男の人がいました。%%の人はある女の人と二回目の%%をしたのですが、その女の人はいつもえらそうにしている人でした。"},
	{"qNum" : "49","text" : "女の人も二回目の結婚でして、前のだんなさんとの間に二人の娘がいました。その娘達は気まぐれで女の人にすごく%%いたんです。"},
	{"qNum" : "50","text" : "同じように男の人にも%%娘がいました。%%よりも心やさしい少女で、世界で一番うつくしい心の持ち主と言ってもいいくらいでした。"},
	{"qNum" : "51","text" : "結婚をしてから、まま母は可愛くて人がよい夫の娘がひどくじゃまに思えました。そこで、少女に家のしごとをおしつけ、狭くて%%やねうらの部屋に追いやってしまいました。でも自分の娘達にはそれぞれきれいな部屋に住まわせました。"},
	{"qNum" : "52","text" : "かわいそうな少女はがまんするしかありませんでした。お父さんに言っても忙しくて聞いてくれないし、お父さんはまま母の言いなりだからです。少女は家のしごとが%%といつも灰だらけの部屋で座っていたので、みんな少女を「灰かぶり姫」という意味の、「シンデレラ」と呼びました。"},
	{"qNum" : "53","text" : "ある日、王子様がダンスパーティを%%ことになりました。お金持ちや有名な人など、色んなな人がまねかれました。シンデレラの二人の姉にも声がかかりました。姉達はとても喜びましたが、彼女達のせわをしなくてはならないシンデレラは嬉しくありませんでした。"}
	];

var answer = [
	{"scene" : "first_1","answer1" : "結婚","answer2" : "人", "answer3" : "男"},
	{"scene" : "first_2","answer1" : "結婚","answer2" : "似て", "answer3" : "男"},
	{"scene" : "first_3","answer1" : "少女","answer2" : "人", "answer3" : "幼い"},
	{"scene" : "first_4","answer1" : "暗い","answer2" : "人", "answer3" : "男"},
	{"scene" : "first_5","answer1" : "結婚","answer2" : "終わる", "answer3" : "男"},
	{"scene" : "first_6","answer1" : "結婚","answer2" : "人", "answer3" : "開く"},
	]
	
var true_answer = [
	{"scene" : "first_1","answer1" : "結婚","answer2" : "人", "answer3" : "男"},
	]
	 
	
</script>
</head>

<body id = "wrapper">

<!-- <div id="loading"><img id="loading-image" src="resources/fairy/loader1.gif" alt="Loading..." /> -->
<!-- <input id="dump" type="button" value="꾸욱" onclick="story()"/> -->
</div>
<!-- <img id="background" src="./image?tmpImg=background.png" style="display: none;width: 1;height: 1;"/> -->
</body>

<script type="text/javascript">
var end_count = 0;
var inputtext = '';		//넣을 텍스트
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
var new_len = ${playlist}.length
var questionList = ${questionList}
var objList = ${objList}
var someList = ${someList}
/* alert(${playlist}[0].scene[0].top);
alert(${objList}[0].obj); */
for(var i = 0 ; i < new_len ; i++){

	//screen.push(eval('scene'+i));
	//screen.push(${playlist}[i]);
	//alert(${playlist}[i].scene.length);
	for(var y = 0 ; y < ${playlist}[i].scene.length ; y++){
		screen.push(${playlist}[i])
	}
} 
/* 
alert("스크린의 길이 : " + screen.length);
alert("씬의 길이 : " + screen[0].scene[0].width);
alert("obj꺼 : " + objList[0].objId);
alert("백그라운드 주소" + someList.background)  */
 start:
	
	 //alert(scene.length)
	 /* for(var p = 0 ; p < screen.length ; p++){
		 
		 for(var q = 0 ; q < screen[p].scene.length;q++){
			 
			 if($('#'+screen[p].scene[q].objId).length == 0){
				 
				 if(screen[p].scene[q].objId == "answer1")
				 {
					 
	  			 }
				 else if(screen[p].scene[q].objId == "answer2"){
					 
				 }else if(screen[p].scene[q].objId == "answer3"){
					 
				 }else if(screen[p].scene[q].objId == "script_hide1"){
					 
				 }else if(screen[p].scene[q].objId == "script_hide2"){
					 
				 }else{
					alert("q else 내부")
					 $('#wrapper').after('<img id="'+screen[sinId].scene[i].objId+'" src="'+${objList}[i].obj+'"/>');
					 $('#'+screen[sinId][i].objId).css({
						"width" : 1,
						"height" : 1,
						"position" : "absolute",
						"display" : "none"
					 })  
				 }
			 }
			 
		 }
		 alert("q 이타치")
	 } */
	 
	/*  for(var i in screen[sinId].scene[sinId]){
		 alert(i)
		 
		 if($('#'+screen[sinId].scene[i].objId).length == 0){
			 
			 if(screen[sinId][i].objId == "answer1")
			 {
				 
  			 }
			 else if(screen[sinId][i].objId == "answer2"){
				 
			 }else if(screen[sinId][i].objId == "answer3"){
				 
			 }else if(screen[sinId][i].objId == "script_hide1"){
				 
			 }else if(screen[sinId][i].objId == "script_hide2"){
				 
			 }else{
				 alert(sinId + " : " + i);
				 alert(screen[sinId].scene[i].objId)
				 $('#wrapper').after('<img id="'+screen[sinId].scene[i].objId+'" src="'+${objList}[i].obj+'"/>');
				 $('#'+screen[sinId][i].objId).css({
					"width" : 1,
					"height" : 1,
					"position" : "absolute",
					"display" : "none"
				 })
			 }
		 }
		 alert("나옴")
	 } */

 
 $(function() { 
	 
		setTimeout(function(){
			$('#loading').fadeOut(2000);
			$('#com').fadeIn(4000);
		},1000)
		story()
	}); 

function story(){
	$('#wrapper').after('<img id="background" src="'+someList.background+'"/>');
	$('#background').css({
				"background-size"		: "contain",
				"background-position"	: "center",
				"background-origin" 	: "content-box",
				"position"				: "absolute",
				"width"					: "100%", 
				"height"				:  "100%",
				"display": "none",
				"z-index" : 0
	}).fadeIn(1000);	//배경
	
/* 	$('#wrapper').after('<img id="'+objList[0].objId+'" src="'+objList[0].obj+'"/>');
	$('#'+objList[0].objId).css({
		"position" : "absolute",
		"width" : screen[0].scene[0].width,
		"height" : screen[0].scene[0].height,
		"top":screen[0].scene[0].top,
		"left":screen[0].scene[0].left,
		"display": "none",
		"z-index" : screen[0].scene[0].layerNum*1
	}).fadeIn(screen[0].scene[0].time*1); */
	
	//문제 번호 저장용
	var q_loc = 0;
	var h_question = '';
	//문제 번호 찾기
	for(var i = 0 ; i < objList.length;i++){
		if(objList[i].objType == "question"){
			q_loc = i;
			break;
		}
	}
	
	//문제 먼저 붙이기
	if($('#'+q_loc).length == 0){
		/* if($('#'+screen[sinId][i].objId).length==0){
			$('#background').after('<img id="'+screen[sinId][i].objId+'" src="./image?tmpImg='+screen[sinId][i].objId+'.png"/>')	
		}
		{"sceneNum" : "1_script_around_3","objId" : "script_around","top" : "-10%","left" : "8%","width" : "80%","height" : "80%",
			"animate" : "fadeIn",	"time" :  "1000",	"latency" : "0","layerNum" : "3"}, */
		$('#wrapper').after('<div id="'+q_loc+'"><div>');
		
		$('#'+q_loc).css({
			"position" : "absolute",
			"width" : screen[0].scene[q_loc].width+'%',
			"height" : screen[0].scene[q_loc].height+'%',
			"top":screen[0].scene[q_loc].top+'%',
			"left":screen[0].scene[q_loc].left+'%',
			"font-size":"18.5px",
			"text-align":"center",
			"display": "none",
			"z-index" : screen[0].scene[q_loc].layerNum*1
		}).fadeIn(1000);
			h_question = objList[q_loc].obj;
		
			var count = 0;
			var h_b = '';
			for(var i = 0; i<h_question.length;i++){
				
				if(h_question[i] != '%'){
					h_b += h_question[i]
				}else
				{
					if(count ==0){
						h_b += '<span id="question1" style="display:inline-block; background-color:white; width:150px; height:20px;padding:0px;border:0px solid #999;margin: 0px;">'
						count = 1;
					}else if(count == 1){
						h_b += '</span>'
						count = 2;
						$('#background').after('<div id="script_hide1"><div>');
						$('#script_hide1').css({
							"position" : "absolute",
							"width" : "25%",
							"height" : "15%",
							"top":"21.5%",
							"left":"55%",
							"background-color": "white",
							"border":"0px solid #999",		
							"display":"block",
							"z-index" : 5	,
							"visibility": "hidden"
						}).fadeIn(1000)
	
					}
					else if(count ==2){
						h_b += '<span id="question2" style="display:inline-block; opacity: 0.8; background-color:white; width:100px; height:16px;padding:0px;border:0px solid #999;margin: 0px;">'
						count = 3;
					}else if(count == 3){
						h_b += '</span>'
						$('#background').after('<div id="script_hide2"><div>');
						$('#script_hide2').css({
							"position" : "absolute",
							"width" : "4%",
							"height" : "15%",
							"top":"21.5%",
							"left":"55%",
							"background-color": "white",
							"border":"0px solid #999",		
							"display":"block",
							"z-index" : 5	,
							"visibility": "hidden"
						}).fadeIn(1000)
						count = 0
					}
				}	
			}
			$('#'+q_loc).html(h_b).fadeIn(2000);
	}	
	
	//보기
	/* var qpqp = 1;
	
	alert(eval('questionList[0].answer'+qpqp)) */
	var h_q_ans1 = questionList[0].answer0
	var h_q_ans2 = questionList[0].answer1
	var h_q_ans3 = questionList[0].answer2
	
	if(typeof h_q_ans1 != "undefined"){

		$('#background').after('<div id="answer1">'+ questionList[0].answer0 + '<div>')	
		$('#answer1').css({
			"position" : "absolute",
			"width" : "10%",
			"height" : "6%",
			"top":"50%",
			"left":"32%",
			"background-color": "white",
			"border":"1px solid #999",
			"display":"none",
			"z-index" : 6,
			"text-align":"center",
			"line-height":"40px"
		}).fadeIn(1000)
		
		answer_offset.push({"top":"10%","left":"6%"});
		
		an1 = $('#answer1');
	}
	if(typeof h_q_ans2 != "undefined"){
		$('#background').after('<div id="answer2">'+ questionList[0].answer1 + '<div>')	
		$('#answer2').css({
					"position" : "absolute",
					"width" : "10%",
					"height" : "6%",
					"top":"50%",
					"left":"47%",
					"background-color": "white",
					"border":"1px solid #999",
					"display":"none",
					"z-index" : 6,
					"text-align":"center",
					"line-height":"40px"
				}).fadeIn(1000)
	}
	if(typeof h_q_ans3 != "undefined"){
		$('#background').after('<div id="answer3">'+ questionList[0].answer2 + '<div>')	
		$('#answer3').css({
					"position" : "absolute",
					"width" : "10%",
					"height" : "6%",
					"top":"50%",
					"left":"62%",
					"background-color": "white",
					"border":"1px solid #999",
					"display":"none",
					"z-index" : 6,
					"text-align":"center",
					"line-height":"40px"
				}).fadeIn(1000)
	}
	
	 $( function() {
		 var answer_save = []; 	//정답 저장용
		 
		$('#script').on("selectstart", function(event){return false;});
		$('#script').on("dragstart", function(event){return false;});
		if($('#answer1').length != 0){
			$('#answer1').draggable({ revert: true });
		}
		if($('#answer2').length != 0){
			$('#answer2').draggable({ revert: true });
		}
		if($('#answer3').length != 0){
			$('#answer3').draggable({ revert: true });
		}
	
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
		
		/* $('#question').css({
			"background-color":"black"
		}) */
		 //width:100px;padding:0px;border:1px solid #999;margin: 0px;
		var len1 = $('#question1').length;
		var len2 = $('#question2').length;
		var div1 = false;
		var div2 = false;

		if(len1==1 &&len2 == 0){

	    $( "#question1" ).droppable({
	    	tolerance: "pointer" ,
	        drop: function( event, ui ) {
	        	
				location_lock_1 = true;										//	드롭되었다는걸 확인
				var a = [];
				a = ui.draggable.attr('id');
				var d = '';
				for(var i = 0; i<7;i++){
					d += a[i];
				}
				var c = $(ui).closest("div");
				if(d == "answer1"){	
					$("#script_hide1").text('(1)').css({
						"font-size":"15.5px",
						"text-align":"center",
						"line-height":"13px"
						});							//	제대로 드롭되었으면, 드롭값 div1를 참으로
					answer_save[0] = 1;											//	첫번째[정답,정답,페이지번호]

					div1 = true;
				}else if(d == "answer2"){
					$("#script_hide1").text('(2)').css({
						"font-size":"15.5px",
						"text-align":"center",
						"line-height":"13px"
						});	
					answer_save[0] = 2;											//	첫번째[정답,정답,페이지번호]

					div1 = true;
				}else if(d == "answer3"){
					$("#script_hide1").text('(3)').css({
						"font-size":"15.5px",
						"text-align":"center",
						"line-height":"13px"
						});	
					answer_save[0] = 3;											//	첫번째[정답,정답,페이지번호]

					div1 = true;
				}
				if(div1){ 

					answer_save.push(sinId+1);											//	페이지 번호를 의미 [정답,정답,페이지번호]
					answer_save.push(1);											// 씬번호
					answer_save.push(4);											// 동화 번호
					  $.ajax({
						method	: 'POST',
						url		: 'editor_answer',
						data	: "answer="+answer_save,	//함수라서 ''을 쓰지 않는다.
						success : function(resp){
							
								alert("나는 자연인이다.")
							if(resp == 1){
								
								$('#answer1').fadeOut(500);
								$('#answer2').fadeOut(500);
								$('#answer3').fadeOut(500,function(){				//이하 정답맞추고 나서 뿌리는 부분
								var a = h_question;									//원본텍스트
								var c = '';											//넘길것
									
									var count = 0;
									for(var i = 0; i<a.length;i++){
										if(a[i] != '%'){
											c += a[i]
										}else{	
											if(count ==0){
												c += '<span style="display:inline-block;width:150px; height:16px;color:red;">';
												
												c +=$('#answer'+answer_save[0]).text();	//답을 적용c 
												c +='</span>'
												count = 1;
											}else if(count == 1){
												c = c
											}
											
											
										}
									}
									$('#script_hide1').fadeOut(1000,function(){
										$('#question').css({
											"background-color" : "",
											"opacity":"1"
										})
										$('#'+q_loc).html(c);						//뿌린다.
										
										for(var i = 0 ; i < screen.length ; i++){
											for(var j = 0; j < screen[i].scene.length;j++){
												if(screen[i].scene[j].animate == "fadeIn"){
													var p = 0;
													while(true){
														if(screen[i].scene[j].objId == objList[p].objId){
															break;
														}else{
															p++;
														}
													}
													if($('#'+screen[i].scene[j].objId).length == 0){
														$('#wrapper').after('<img id="'+screen[i].scene[j].objId+'" src="'+objList[p].obj+'"/>')
													}
													$('#'+screen[i].scene[j].objId).css({
														"position" : "absolute",
														"width" : screen[i].scene[j].width+'%',
														"height" : screen[i].scene[j].height+'%',
														"top":screen[i].scene[j].top+'%',
														"left":screen[i].scene[j].left+'%',
														"display": "none",
														"z-index" : screen[i].scene[j].layerNum*1
													}).fadeIn(1000);
												}
												else if(screen[i].scene[j].animate == "fadeOut"){
													$('#'+screen[i].scene[j].objId).css({
														"position" : "absolute",
														"width" : screen[i].scene[j].width,
														"height" : screen[i].scene[j].height,
														"top":screen[i].scene[j].top,
														"left":screen[i].scene[j].left,
														"display": "none",
														"z-index" : screen[i].scene[j].layerNum*1
													}).fadeOut(screen[i].scene[j].time*1);
												}
												else if(screen[i].scene[j].animate == "animate"){
													$('#'+screen[i].scene[j].objId).css({
														"position" : "absolute",
														"width" : screen[i].scene[j].width,
														"height" : screen[i].scene[j].height,
														"top":screen[i].scene[j].top,
														"left":screen[i].scene[j].left,
														"display": "none",
														"z-index" : screen[i].scene[j].layerNum*1
													}).animate({"top" :screen[i].scene[j].top, "left" : screen[i].scene[j].left},screen[i].scene[j].time);
												}
											}	
										}
										
									});
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
							} 
						}
					}) 
				} 
	        }
	      });
		}
	  }); 
		/* else if(eval('questionList[0].answer'+i) =='answer2'){
			$('#'+screen[sinId][i].objId).remove();
			if($('#answer2').length == 0){
				$('#background').after('<div id="'+screen[sinId][i].objId+'">'+ answer[sinId].answer2 + '<div>')
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
		}else if(eval('questionList[0].answer'+i) =='answer3'){
			$('#'+screen[sinId][i].objId).remove();
			if($('#answer3').length == 0){
				$('#background').after('<div id="'+screen[sinId][i].objId+'">'+ answer[sinId].answer3 + '<div>')
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
		}
	} */
	
	 
	/* for(var i = 0 ; i < 1 ; i++){
		for(var j = 0; j < screen[i].scene.length;j++){
			//alert(screen[i].scene[j].animate)
			if(screen[i].scene[j].animate == "fadeIn"){
				//alert("페이드인")
				var p = 0;
				while(true){
					if(screen[i].scene[j].objId == objList[p].objId){
						break;
					}else{
						p++;
					}
				}
				if($('#'+screen[i].scene[j].objId).length == 0){
					$('#wrapper').after('<img id="'+screen[i].scene[j].objId+'" src="'+objList[p].obj+'"/>')
				}
				$('#'+screen[i].scene[j].objId).css({
					"position" : "absolute",
					"width" : screen[i].scene[j].width+'%',
					"height" : screen[i].scene[j].height+'%',
					"top":screen[i].scene[j].top+'%',
					"left":screen[i].scene[j].left+'%',
					"display": "none",
					"z-index" : screen[i].scene[j].layerNum*1
				}).fadeIn(1000);
			}
			else if(screen[i].scene[j].animate == "fadeOut"){
				$('#'+screen[i].scene[j].objId).css({
					"position" : "absolute",
					"width" : screen[i].scene[j].width,
					"height" : screen[i].scene[j].height,
					"top":screen[i].scene[j].top,
					"left":screen[i].scene[j].left,
					"display": "none",
					"z-index" : screen[i].scene[j].layerNum*1
				}).fadeOut(screen[i].scene[j].time*1);
			}
			else if(screen[i].scene[j].animate == "animate"){
				$('#'+screen[i].scene[j].objId).css({
					"position" : "absolute",
					"width" : screen[i].scene[j].width,
					"height" : screen[i].scene[j].height,
					"top":screen[i].scene[j].top,
					"left":screen[i].scene[j].left,
					"display": "none",
					"z-index" : screen[i].scene[j].layerNum*1
				}).animate({"top" :screen[i].scene[j].top, "left" : screen[i].scene[j].left},screen[i].scene[j].time);
			}
		}	
	} */
	
	
	
	
}
/* 
	 
function story2(){
	
	
	 
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
				"font-size":"15.5px",
				"text-align":"center",
				"display":"none",
				"z-index" : screen[sinId][i].layerNum*1
			}).fadeIn(screen[sinId][i].time*1);

			inputtext = questions[text_count].text;
		
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
						count = 0;
					}
				}	
				
			}
	
			$('#script').html(b).fadeIn(2000)	
			
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
				"border":"0px solid #999",
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
				"top":screen[sinId][i].top,
				"left":screen[sinId][i].left,
				"background-color": "white",
				"border":"0px solid #999",
				"display":"block",
				"z-index" : screen[sinId][i].layerNum*1	,
				"visibility": "hidden"
			})
			//여기 이하 텍스트 분석
		end_count = i;
		break loop;
	}
	else{

		if(screen[sinId][i].animate == "fadeIn"){

			if(screen[sinId][i].objId == 'answer1'){
				$('#'+screen[sinId][i].objId).remove();
				if($('#answer1').length == 0){
					$('#background').after('<div id="'+screen[sinId][i].objId+'">'+ answer[sinId].answer1 + '<div>')	
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
					$('#background').after('<div id="'+screen[sinId][i].objId+'">'+ answer[sinId].answer2 + '<div>')
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
					$('#background').after('<div id="'+screen[sinId][i].objId+'">'+ answer[sinId].answer3 + '<div>')
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
					$('#wrapper').after('<img id="'+screen[sinId][i].objId+'" src="./image?tmpImg='+screen[sinId][i].objId+'.png"/>')
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
					$('#background').after('<img id="'+screen[sinId][i].objId+'" src="./image?tmpImg='+screen[sinId][i].objId+'.png"/>')	
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
			$('#'+screen[sinId][i].objId).animate({"top" : screen[sinId][i].top, "left" : screen[sinId][i].left},screen[sinId][i].time);
			setTimeout(screen[sinId][i].latency);
		}else if(screen[sinId][i].animate == "fadeOut"){
			$('#'+screen[sinId][i].objId).fadeOut(screen[sinId][i].time*1);
			setTimeout(screen[sinId][i].latency);
		}else{
			
		}
	}
	}

  
 }
  */
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
							 $('#wrapper').after('<img id="'+screen[sinId][i].objId+'" src="./image?tmpImg='+screen[sinId][i].objId+'.png"/>');
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
					 }else{
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
							 
						 }else{
							 $('#wrapper').after('<img id="'+screen[sinId][i].objId+'" src="./image?tmpImg='+screen[sinId][i].objId+'.png"/>');
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