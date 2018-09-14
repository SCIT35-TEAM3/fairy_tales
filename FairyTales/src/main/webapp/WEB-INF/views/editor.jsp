<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Title of the document</title>
	<script src="resources/jquery-3.3.1.min.js"></script>
	<script>
		// 선택된 오브젝트
		var selectTarget;
		// 움직임 클릭 체크
		var ckMovement = false;
		// 어떤 키가 입력되고 있는지 체크
		var keydownSet;
		// 키 이동 간격
		var keyAniVal;
		// 컨트롤 눌러있는지 유무
		var ctrlSet = false;
		var shiftSet = false;
		// 오브젝트 배열(Json)
		var objList = [];
		// 챕터 screen 의 집합, 챕터 대표 이미지, 총 레이어 수 *레이어 삭제시 관련된 정보 모두 삭제
		var chapter = {
						  "screen"	: []
						, "img"		: null
						, "maxLayer": 1
					  };
		// 이전 width
		var oldWidth;
		var fPercent;
		// 마우스 위치
		var mouseX = 0;
		var mouseY = 0;
		var xWPointOld = 0;
		var yHPointOld = 0;
		// 선택된 scene
		var sScene;
		//***********************************************************************************//
		$(document).ready(function(){
			console.log("hello world");
			/* console 목록
			console.log("https://developer.mozilla.org/ko/docs/Web/API/Console");
			//console.table();
			console.time();
			//console.timeStamp();
			console.timeEnd();
			console.trace();
			console.warn("warn");
			console.error("error");
			console.assert(false);
			console.count();
			console.count();
			var d = {"11":"22"};
			console.dir(d);
			*/
			
			//첫 챕터 넣기;
			screenSet();
			
			/*fairyTale init*/
			fIndexSet();
			resize();
			$(".fairyTale").css(
				{
					  "background-size": "cover"
					//, "background" : "url('../신데렐라 정산/배경.png')"
				}
			);
			
			//z-index set
			/*/fairyTale init*/
			
			//move object
			$(".fairyTale").mousemove(function(events){
				//select check
				
				//클릭하고 있는 상태라면 움직임
				if(ckMovement){
				
					//크기 조절
					if(ctrlSet || shiftSet){
						var xWPoint = events.pageX - $(selectTarget).offset().left - (mouseX);
						var width = parseInt($(selectTarget).width()) + parseInt(xWPoint - xWPointOld);
						
						if(shiftSet){
							var yHPoint = events.pageY - $(selectTarget).offset().top - (mouseY);
							var height = parseInt($(selectTarget).height()) + parseInt(yHPoint - yHPointOld);
							//var fontSize = $(selectTarget).css("font-size") ;
							
							console.log("white-space : "+ $(selectTarget).css("white-space"));
							//유동적 증감
							$(selectTarget).css(
								{
									  "width"		: width
									, "height"		: height
									//, "white-space"	: "normal"
									, "word-break"	: "break-all"
								}
							);
							
							
							yHPointOld = yHPoint;
						}else{
							var height = parseInt($(selectTarget).height()) + parseInt(xWPoint - xWPointOld);
							//비율증감
							$(selectTarget).css(
								{
									  "width"		: width
									, "height"		: height
									//, "white-space"	: "normal"
									, "word-break"	: "break-all"
								}
							);
						}
						
						$("#fElementTarget").css(
							{
								  "width" : $(selectTarget).width()
								, "height": $(selectTarget).height()
								//, "white-space"	: "normal"
								, "word-break"	: "break-all"
							}
						);
					
						xWPointOld = xWPoint;
						
						//객체 크기 setting
						setWHLT(selectTarget);
						return false;
					}
					
					//fairyTale
					var FT = getBTWN(".fairyTale");
					
					// check element
					if((FT.TWMin <= events.pageX && FT.TWMax >= events.pageX)
						&& (FT.THMin <= events.pageY && FT.THMax >= events.pageY)){
						
						//그림중앙
						//var x = $(selectTarget).width() / 2;
						//var y = $(selectTarget).height() / 2;
						
						//click point
						var xPoint = events.pageX - FT.$target.offset().left - (mouseX);
						var yPoint = events.pageY - FT.$target.offset().top - (mouseY);
						
						//movement
						fMovement(xPoint,yPoint,0);
						return false;
					}else{
						selectClear();
						return false;
					};
				};
			});
			
			$(".fairyTale").mouseup(function(events){
				//선택해제
				//클릭하고 있는 상태였다면 해지
				if(ckMovement){
					ckMovement = false;
					//selectClear();
					return false;
				}
			});
			
			//chapterPrev
			$("#chapterPrev").on("click",chapterPrev);
			$("#chapterNext").on("click",chapterNext);
			
			//sceneSet scene 저장
			$("#sceneSet").on("click",sceneSet);
			
			//layer radio event
			$("input[name='layer']").on("click",selectClear);
			
			//layer radio event
			$("input[name='screen']").on("click",changeScreen);
			
			//scene
			$("input[name='scene']").on("click",changeScene)
			
			//select object
			$(".fairyTale").mousedown(function(events){
				$($(".move.group"+layerSelector()).children().get().reverse()).each(function(index,element){
					
					//크기 변경 변수 초기화
					xWPointOld = 0;
					yHPointOld = 0;
					
					//선택해지 있어야 하나?
					/*
					if(ctrlSet){
						selectClear();	
						return false;
					}
					*/
					
					//element
					var ele = getBTWN(element);
					
					//마우스 위치 계산
					mouseX = events.pageX - ele.$target.offset().left;
					mouseY = events.pageY - ele.$target.offset().top;
					
					
					// check element
					if((ele.TWMin <= events.pageX && ele.TWMax >= events.pageX) 
						&& (ele.THMin <= events.pageY && ele.THMax >= events.pageY)){
						
						if(!ckMovement){
							//selectTarget set!!
							ckMovement = true;
							
							//selectTarget = element;
							//scene 선택
							changeScene(element);		
						}
						//stop
						return false;
					};
				});
			});
			
			//add new layer
			$("#addLayer").on("click", function(){
				//레이어 생성
				var move = document.createElement("div");
				var effect = document.createElement("div");
				var newNum = $(".move").length + 1 ;
				$(move).addClass("layer move group"+newNum);
				$(effect).addClass("layer effect group"+newNum);
				
				$(".fairyTale").append(move,effect);
				
				//총레이어 수 업데이트
				chapter.maxLayer = newNum;
				
				//라디오 버튼 생성
				var newLayer = document.createElement("input");
				var span = document.createElement("span");
				$(newLayer).attr("type","radio");
				$(newLayer).attr("name","layer");
				$(newLayer).val(newNum);
				$(span).append(newLayer);
				$(span).append("레이어"+newNum);
				$(".layerSelector").append(span);
				
				resize();
				fIndexSet();
				
				//selectClear event
				$("input[name='layer']").on("click",selectClear);
			});
			
			//add object Text object
			$("#addObjTxtBtn").on("click", addObjTxt);
			
			$("#addObjectBtn").on("click", addObject);
			
			//object delete
			$("#objCheckBtn").on("click", objCheck);
			
			//keypad set
			$(document).keydown(function(event){
				var keydown = event.which;
				console.log(keydown);
				//ctrl click
				if(keydown == 17){
					ctrlSet = true;
					return false;
				}
				//shift click
				if(keydown == 16){
					shiftSet = true;
					return false;
				}
				//ctrl space layer selet
				if(ctrlSet && keydown == 32){
					var lyck = false
					$("input[name='layer']").each(function(index,layer){
						if((index+1) == $("input[name='layer']").length){
							$("input[name='layer'][value='1']").prop('checked',true);
						}
						if(lyck){
							$(layer).prop('checked',true);
							return false;
						}
						if($(layer).prop('checked')){
							lyck = true;
						}
					});
				}
				
				//select check
				if(selectTarget != null){
					//keyAniVal set
					if(keydownSet != keydown){
						keydownSet = keydown;
						keyAniVal = 1;
					}else{
						keyAniVal += 0.25;
					}
					
					switch(keydown){
						//keypad
						case 107 :
							var fontSize = Number.parseInt($(selectTarget).css("font-size"));
							$(selectTarget).css("font-size",(fontSize + 1) + "px").css("white-space","normal");
							break;
						case 38 : fMovement("+=0","-="+keyAniVal,0);
							break;
						case 40 : fMovement("+=0","+="+keyAniVal,0);
							break;
						case 37 : fMovement("-="+keyAniVal,"+=0",0);
							break;
						case 39 : fMovement("+="+keyAniVal,"+=0",0);
							break;
						case 36 : fMovement("-="+keyAniVal,"-="+keyAniVal,0);
							break;
						case 33 : fMovement("+="+keyAniVal,"-="+keyAniVal,0);
							break;
						case 34 : fMovement("+="+keyAniVal,"+="+keyAniVal,0);
							break;
						case 35 : fMovement("-="+keyAniVal,"+="+keyAniVal,0);
							break;
						case 12 : 
							//var centerX = $(".fairyTale").offset().left + (($(".fairyTale").width() / 2) - ($(selectTarget).width() / 2));
							//var centerY = $(".fairyTale").offset().top + (($(".fairyTale").height() / 2) - ($(selectTarget).height() / 2));
							
							var centerX = (($(".fairyTale").width() / 2) - ($(selectTarget).width() / 2));
							var centerY = (($(".fairyTale").height() / 2) - ($(selectTarget).height() / 2));
							
							fMovement(centerX,centerY,0);
							break;
						case 46 :
							//Delete key
							selectTarget.remove();
							selectClear();
							//object view
							objViewList();
							break;
					}
				}
			});
			$(document).keyup(function(event){
				var keyup = event.which;
				switch(keyup){
					//keyAniVal reSet
					case 12 : case 33 : case 34 : case 35 : case 36 : case 37 : case 38 : case 39 : case 40 :
						if(selectTarget != null){
							keyAniVal = 1;
						}
						break;
					//ctrl reSet
					case 17 : 
						ctrlSet = false;
						break;
					//shift reSet
					case 16 : 
						shiftSet = false;
						break;
				}
			});
			
		});
		//***********************************************************************************//
		function changeScreen(){
			var screenNum;
			if($(this).is("input")){
				//console.log("this : " + $(this).val());
				screenNum = $(this).val();
			}else{
				$("input[name='screen']").each(function(index,screenChk){
					if($(screenChk).prop('checked')){
						//console.log("this : " + $(screenChk).val());
						screenNum = $(screenChk).val();
						return false;
					};
				});
			}
			//layer 전부 초기화
			$(".layer").html("");
			$($(chapter.screen).get(screenNum).scene).each(function(index,scene){
				//console.log(screenNum + ": scene : " + JSON.stringify(scene));
				//다시그려야함
				//scene.objId
				$(objList).each(function(index,obj){
					if(obj.objId == scene.objId){
						if(obj.objNm == "img"){
							addImgObject (obj.obj,obj.objId,scene);
						}else if(obj.objNm == "text"){
							document.createElement("span");
						};
					};
				});
			});
			//스크린 번호
			$("#screensView").html("--- Screens " + screenNum + " ---");
			//선택 초기화;
			selectClear();
		};
		
		//div 범위
		function getBTWN(target){
			var $target = $(target);
			// target width
			var TWMin = $target.offset().left;
			var TWMax = $target.offset().left + $target.width();
			
			// target height
			var THMin = $target.offset().top;
			var THMax = $target.offset().top + $target.height();
			
			return {$target,TWMin,TWMax,THMin,THMax};
		}
		
		//add object 
		function addObject(){
			$(".objCheck").each(function(index,check){
				if($(check).prop('checked')){
					$(objList).each(function(index,obj){
						if(obj.objId == $(check).val()){
							switch(obj.objNm){
								//keyAniVal reSet
								case "img" :
									addImgObject(obj.obj,obj.objId);
									break;
								case "text" : 
									addTxtObject();
									break;
							};
						};
					});
				};
			});
			//view set
			objViewList();
		};
		//selected obj clear
		function selectClear(){
			selectTarget = null;
			$("#fElementTarget").remove();
			//green box
			greenBox();
		}
		//checkbox
		function objCheck(){
			var tf = confirm("정말 삭제하시겠습니까?");
			if(tf){
				$(".objCheck").each(function(index,check){
					if($(check).prop('checked')){
						objDelete($(check).val());
					};
				});
				//object view
				objViewList();
				//children green box;
				greenBox(selectTarget);
			};
		};
		//object delete
		function objDelete(delObjNum){
			$(objList).each(function(index,obj){
				$(".layer").children().each(function(index,layer){
					if(layer == selectTarget){
						selectClear();
					};
					//layer에 있는 오브젝트 삭제
					if($(layer).data("objId") == delObjNum){
						$(layer).remove();
					}
				});
				//오브젝트 삭제
				if(obj.objId == delObjNum){
					objList.splice(index,1);
				}
			});
		}
		
		//selected group green box
		function greenBox(element){
			//초기화
			$(".fEdit").html("");
			$(".greenBox").remove();
			$(".group"+layerSelector()).children().each(function(index,obj){
				var greenBox = document.createElement("div");
				$(greenBox).addClass("greenBox");
				$(greenBox).attr("id",obj == element ? "fElementTarget" : "greenBox"+index );
				$(greenBox).data("objId",$(obj).data("objId"));
				$(greenBox).css(
					{
						  "position"	: "absolute"
						, "top"			: $(obj).offset().top - $(".fairyTale").offset().top
						, "left"		: $(obj).offset().left - $(".fairyTale").offset().left
						, "width"		: $(obj).width()
						, "height"		: $(obj).height()
						, "border"		: obj == element ? "1px solid red" : "1px solid green"
					}
				);
				$(".fEdit").append(greenBox);
			});
		}
		
		//movement 객체 움직임
		function fMovement(xPoint,yPoint,speed) {
			//img setting
			//$(selectTarget).css("position", "absolute");
			
			$(selectTarget).animate({ "left" : xPoint+"px" , "top" : yPoint+"px" }, speed);
			$("#fElementTarget").animate({ "left" : xPoint+"px" , "top" : yPoint+"px" }, speed);
			
			//객체 크기 setting
			setWHLT(selectTarget);
		}
		
		//layerSelector
		function layerSelector(){
			var groupNum = 0;
			$("input[name='layer']").each(function(index,layer){
				if($(layer).prop('checked')){
					groupNum = $(layer).val();
				}
			});
			return groupNum;
		}
		
		//resize
		$(window).resize(resize);
		function resize() {
		
			//기준 비율
			var wWidth = $(window).width() * 0.6 - 50;
			//var $wHeight = $(window).height() * 0.7 - 50;
			//console.log("window size: " + $wWidth + " / " + $wHeight);
			
			//CSS 미디어 쿼리 사용가능
			//console.log("배경크기 = w2560 x h1440 >> 1.77778:1");
			
			var ff;
			if(oldWidth != null){
				fPercent = wWidth / oldWidth;
				ff = wWidth - oldWidth;
			}
			oldWidth = wWidth;
			
			// fairyTale view resize set!!
			$(".fairyTale").css(
				{
					  "width" : wWidth 
					, "height": wWidth / 1.77778
				}
			);
			
			//*layer 통합
			// move resize set!!
			// effect resize set!!
			// fEdit resize set!!
			$(".layer").css(
				{
					  "width" : wWidth 
					, "height": wWidth / 1.77778
					, "position" : "absolute"
				}
			);
			
			$(".layer").children().each(function(){
				//타겟 정보
				var targetInfo
				var targetId = $(this).data("objId");
				$($(chapter.screen).get(screenSelector()).scene).each(function(index,scene){
					if(scene.objId == targetId){
						targetInfo = scene;
						return false;
					};
				});
				//다시그리기
				setSScene(this,targetInfo);
			});
		};
		
		// z-index set
		function fIndexSet(){
			$(".move").each(function(index){
				var gIndex = index + 1;
				var zIndex = gIndex * 2;
				
				//z-index fairyTale
				$(".fairyTale").css(
					{
						  "position" : "relative"
						, "z-index": 0
					}
				);
				//z-index fEdit
				$(".fEdit").css(
					{
						  "position" : "absolute"
						, "z-index": 9999
					}
				);
				
				//*group
				//z-index move group
				$(".move.group"+gIndex).css(
					{
						  "position" : "absolute"
						, "z-index": zIndex-1
						, "pointer-events": "none"
					}
				);
				//z-index effect group
				$(".effect.group"+gIndex).css(
					{
						  "position" : "absolute"
						, "z-index": zIndex
						, "pointer-events": "none"
					}
				);
				//group*
			});
		};
		
		//image file push
		function imgFilePut(files){
			//새 이미지
			var formData = new FormData();
			formData.append("file",$(files).get(0));
			//이미지 업로드
			$.ajax({
					  url		: "./editdata"
					, type		: "post"			
					, processData: false
					, contentType: false
					, data		: formData
					, dataType	: 'text'
					, success	: function (response) {
						alert("./image?tmpImg="+response);
						addImgObject("./image?tmpImg="+response);
						$("input[type=file]").val("");
						
						//ie
						if (/msie/.test(navigator.userAgent.toLowerCase())) { 
							$("input[type=file]").replaceWith( $("input[type=file]").clone(true) );
						} else {
							$("input[type=file]").val("");
						}
					}
			});
		};
		
		//add image
		function addImgObject (file,objId,scene){
			
			var image = new Image();
			image.src = file;
			image.onload = function(){
				
				if(scene == null){
					//image size set
					while(true){
						if((this.width > $(".fairyTale").width()) || (this.height > $(".fairyTale").height())){
							//50%
							this.width = this.width * 0.5;
							this.height = this.height * 0.5;
						}else{
							break;
						}
					}
				}else{
					var ftWidth		= $(".fairyTale").width();
					var ftHeigth	= $(".fairyTale").height();
					$(this).css(
						{
							  "width"	: ftWidth	* scene.width
							, "height"	: ftHeigth	* scene.height
							, "left"	: ftWidth	* scene.left
							, "top"		: ftHeigth	* scene.top
							, "position" : "absolute"
						}
					);
				}
				$(this).data("objId", objId == null ? objMaxNum() : objId ).css("position", "absolute");
				var layerGroupNum = (scene == null ? layerSelector() : scene.layerNum);
				//console.log("layerGroupNum : " + layerGroupNum);
				if(objId == null){
					objId = objPush("img",file);
				};
				var sceneNum
				//처음 들어가는 것 Scene 만들기
				if(scene == null){
					//초기화playAnimateSet(target,screenNum,objId,layerNum,animate,time,latency)
					//appear 첫번째는 나타나는 이벤트만
					//두번째 scene에는 이동및 없어지는 이벤트만
					sceneNum = playAnimateSet(this,screenSelector(),objId,layerGroupNum,"fadeIn",0,0);
				}else{
					//복사해온 것 sceneNum 지정
					sceneNum = scene.sceneNum;
				}
				$(this).data("sceneNum", sceneNum);
				
				$(".move.group"+layerGroupNum).append(this);
				//객체 선택
				selectTarget = this;
				//green box
				greenBox(this);
				//scene view
				sceneViewList();
				//object view
				objViewList();
			};
		
		};
		
		//object push objList
		/*!! 주의 !! objMaxNum()의 실행 순서에의 해 오류가 발생할 수 있으니
		  마지막에 실행하던가 검증하여 정확히 입력하도록하자 !!*/
		function objPush(objNm,obj){
			var objId = objMaxNum();
			objList.push({
							  "objId"	: objId
							// 오브젝트 이름
							, "objNm"	: objNm
							//원본
							, "obj"		: obj
						});
			
			return objId;
		};
		//챕터
		//chapter{ screen : {{scene,scene}} , {{scene,scene}} }, img }
		
		//장면추가
		//scene push screen
		function playAnimateSet(target,screenNum,objId,layerNum,animate,time,latency){
			//console.error("여기 해라 뭐해야되는지는 까먹음");
			//appear
			var sceneNum = screenNum + "_" + objId + "_" + sceneMaxNum(screenNum);
			var scene = {
							//sceneNumber 스크린번호 _ 오브젝트아이디 _ 스크린에 쌓인 고유번호
							  "sceneNum"	: sceneNum
							//적용 오브젝트
							, "objId"		: objId
							//위치
							, "top"			: $(target).position().top / $(".fairyTale").height()
							, "left"		: $(target).position().left / $(".fairyTale").width()
							//레이어 넘버
							, "layerNum"	: layerNum
							//크기
							, "width"		: $(target).width() / $(".fairyTale").width()
							, "height"		: $(target).height() / $(".fairyTale").height()
							//적용애니메이션 종류
							, "animate"		: animate
							//타임시간
							, "time"		: time
							//대기시간
							, "latency"		: latency
						}
			//새로추가
			$(chapter.screen).get(screenNum).scene.push(scene);
			
			//추가한 screen 다음 screen 존재하는 경우 다음 screen에 scene추가 animate = "fadeOut"으로 추가하자
			var $nextScreen = $(chapter.screen).get(parseInt(screenNum)+1);
			if($nextScreen != null){
				//Deep copy *
				var clone = deepCopy(scene);
				clone.animate = "fadeOut";
				$nextScreen.scene.push(clone);
				//* Deep copy
			};
			
			return sceneNum;
		};
		
		//다음 챕터
		function chapterNext(){
			console.log("다음");
		}
		//이전 챕터
		function chapterPrev(){
			console.log("이전");
		}
		
		//다음 챕터
		function chapterNext(){
			console.log("다음");
		}
		//이전 챕터
		function chapterPrev(){
			console.log("이전");
		}
		//objList objId Max Number 오브젝트의 최대값
		function objMaxNum(){
			var maxNum = 0;
			if(objList.length != 0){
				$(objList).each(function(index,obj){
					if(obj.objId >= maxNum){
						maxNum = obj.objId + 1;
					};
				});
			};
			return maxNum;
		};
		
		//screen Max Number 같은 스크린에 같은 오브젝트의 최대값
		function sceneMaxNum(screenNum){
			var maxNum = 0;
			if($(chapter.screen).get(screenNum).scene.length != 0){
				$($(chapter.screen).get(screenNum).scene).each(function(index,scene){
					var sceneArry = scene.sceneNum.split("_");
					//스크린번호(0) _ 오브젝트아이디(1) _ 스크린에 쌓인 고유번호(2)
					//console.log("scene : " + sceneArry[0] + " / "+ sceneArry[1] + " / "+ sceneArry[2]);
					if(sceneArry[0] == screenNum){
						if(sceneArry[1] == scene.objId){
							if(sceneArry[2] >= maxNum){
								maxNum = parseInt(sceneArry[1]) + 1;
							};
						};						
					};
				});
			};
			return maxNum;
		};
		
		//view div set objList 
		function objViewList(){
			var putInfo = "<span>--- Object List ---</span><br/>";
			$(objList).each(function(index,obj){
				putInfo += "<input type='checkbox' class='objCheck' value='"+obj.objId+"' >"
				putInfo += "<span> ID : " + obj.objId + "</span><br>";
				putInfo += "<span> Name : " + obj.objNm + "</span><br>";
				putInfo += "<span> Obj : " + obj.obj + "</span><br>";
				putInfo += "<span>-------------------</span><br/>";
			});
			$("#objList").html(putInfo);
		};
		
		//add object text
		function addObjTxt(){
			
			if($("#objText").val().length < 1){
				alert("글을 입력하세요.");
			}else{
				//Text object
				addTxtObject($("#objText").val());
			}
			////////여기여기
			/*
			$("input[name='object']").each(function(index,object){
				if($(object).prop('checked')){
					//Text object
					if($(object).val() == "text"){
						addTxtObject($("#objText").val());
						//add objList
						objPush("text",$("#objText").val());
						//view set
						objViewList();
					}
					return false;
				}
			});
			*/
		};
		
		//텍스트 여기
		// add text object
		function addTxtObject(value){
			var span = document.createElement("span");
			$(span).html(value).css("position", "absolute");
			//add objList
			objId = objPush("text",value);
			
			sceneNum = playAnimateSet(span,screenSelector(),objId,layerSelector(),"fadeIn",0,0);
			
			$(span).data("objId",objId);
			$(span).data("sceneNum",sceneNum);
			
			alert($(span).data("objId"));
			
			$(".move.group"+layerSelector()).append(span);
			
			//객체 선택
			selectTarget = span;
			//green box
			greenBox(span);
			//scene view
			sceneViewList();
			//object view
			objViewList();
		}
		
		//선택된 scene
		function sceneInfoSet(scene){
			//선택
			sScene = scene;
			//정보 표시
			$("#sObjId").val(scene.objId);
			$("#sTime").val(scene.time);
			$("#sLatency").val(scene.latency);
			$("#animate").val(scene.animate);
			$("#top").val(scene.top);
			$("#left").val(scene.left);
			$("#width").val(scene.width);
			$("#height").val(scene.height);
		}
		
		//입력 scene
		function sceneSet(){
			sScene.objId = $("#sObjId").val();
			sScene.time = $("#sTime").val();
			sScene.latency = $("#sLatency").val();
			sScene.animate = $("#animate").val();
			sScene.top = $("#top").val();
			sScene.left = $("#left").val();
			sScene.width = $("#width").val();
			sScene.height = $("#height").val();
			//다시그리기
			setSScene(selectTarget,sScene);
			//green box
			greenBox(selectTarget);
		}
		
		//선택된 객체에 scene 정보적용
		function setSScene(targetObj,sceneInfo){
			var ftWidth		= $(".fairyTale").width();
			var ftHeigth	= $(".fairyTale").height();
			
			$(targetObj).css(
				{
					  "width" 		: ftWidth	* sceneInfo.width
					, "height"		: ftHeigth	* sceneInfo.height
					, "left"		: ftWidth	* sceneInfo.left
					, "top"			: ftHeigth	* sceneInfo.top
					, "position"	: "absolute"
				}
			)
		}
		
		
		//선택된 화면
		function screenSelector(){
			var screenNum = 0;
			$("input[name='screen']").each(function(index,layer){
				if($(layer).prop('checked')){
					screenNum = $(layer).val();
				}
			});
			return screenNum;
		}
		
		//화면 추가 스크린
		//screens push chapterSet
		function screenSet(scene){
			//console.warn("문제 screen을 만들어야함 \n chapter{ screens : [screen : {{scene,scene}} , {{scene,scene}} }, img } \n chapter :" + chapter.size);
			//var sceneNumber = chapter.length;
			chapter.screen.push({
								  "scene"		: scene==null ? [] : scene
								, "clickEvent"	: null
							});
		};
		//Deep copy 복사
		function deepCopy(obj){
			//Deep copy *
			var clone = JSON.parse(JSON.stringify(obj));
			return clone;
			//* Deep copy
		}
		//추가 복사 스크린
		function addScreen(){
			//Deep copy *
			var clone = deepCopy($(chapter.screen).get(screenSelector()).scene);
			screenSet(clone);
			//* Deep copy
			
			var newNum = $(chapter.screen).length;
			//라디오 버튼 생성
			var newLayer = document.createElement("input");
			var span = document.createElement("span");
			$(newLayer).attr("type","radio");
			$(newLayer).attr("name","screen");
			$(newLayer).val(newNum-1);
			$(newLayer).on("click",changeScreen);
			$(newLayer).prop('checked',true);
			$(span).append(newLayer);
			$(span).append("스크린"+newNum);
			$(".screenSelector").append(span);
			changeScreen();
		}
		
		//scene 선택
		function changeScene(element){
			
			//objId img 와 radio 구분
			//selectTarget 선택	
			if($(element).is("img")||$(element).is("span")){
				selectTarget = element;
			}else{
				var sceneNum = $(this).data("sceneNum");
				$(".layer").children().each(function(index,obj){
					if($(obj).data("sceneNum") == sceneNum){
						selectTarget = obj;
						return false;
					};
				}); 
			};
			
			//scene 선택
			$("input[name='scene']").each(function(index,sRadio){
				if($(sRadio).val() == $(selectTarget).data("objId")){
					$(sRadio).prop('checked',true);
					return false;
				}
			});
			
			//set info 정보넣기
			//console.log("selectTarget :" + selectTarget + ", screenSelector() :" + screenSelector());
			//console.log("sceness>>>>>> :" + JSON.stringify($(chapter.screen).get(screenSelector()).scene));
			//console.log("$(selectTarget).data('objId') : " + $(selectTarget).data("objId")); 
			//$(selectTarget).data("objId") 아니라 sceneNum 가져와야함
			//퐁당퐁당 삽입할경우 중간값이 없는 상태에서 objId가 오닌깐 오류남
			//console.error("오류난다 아 몰라.......... 고쳐라좀"); 고쳤다
			
			sceneInfoSet(targetScene($(selectTarget).data("sceneNum")));
			
			//children green box;
			greenBox(selectTarget);
		}
		
		// scene 뷰
		function sceneViewList(){
			$("#sceneList").html("<span>--- Scene List ---</span><br/>");
			$($(chapter.screen).get(screenSelector()).scene).each(function(index,scene){
				var span = document.createElement("span");
				var input = document.createElement("input");
				$(input).attr("type","radio");
				$(input).prop('checked',true);
				$(input).attr("name","scene");
				$(input).addClass("sceneCheck");
				$(input).data("objId",scene.objId);
				$(input).data("sceneNum",scene.sceneNum);
				$(input).change(changeScene);
				
				$(span).html("objId :" + scene.objId + "<br/>layerNum :" + scene.layerNum + "<br/>");
				
				$("#sceneList").append(input,span);
				
				/*
				$(objList).each(function(index,obj){
					console.log(index + " : " + obj);
					if(obj.objId == scene.objId){
						console.log(obj);
					}
				});
				*/
				
				//console.log(index + " : " + JSON.stringify(scene));
			});
			var last = $($(chapter.screen).get(screenSelector()).scene).length;
			sceneInfoSet($($(chapter.screen).get(screenSelector()).scene).get(last-1))
		}
		
		//width height left top setting 객체 크기
		function setWHLT(target){
			
			//데이터 넣기
			$($(chapter.screen).get(screenSelector()).scene).each(function(index,scene){
				if(scene.objId == $(target).data("objId")){
					scene.width		= $(target).width() / $(".fairyTale").width();
					scene.height	= $(target).height() / $(".fairyTale").height();
					scene.left		= $(target).position().left / $(".fairyTale").width();
					scene.top		= $(target).position().top / $(".fairyTale").height();
					
					//scene 정보 표시
					sceneInfoSet(scene);
					return false;
				};
			});
			/*
			console.log("=============="+$(target).data("objId")+"============");
			console.log("width : " + target.width / $(".fairyTale").width());
			console.log("height : " + target.height / $(".fairyTale").height());
			console.log("left : " + $(target).position().left / $(".fairyTale").width());
			console.log("top : " + $(target).position().top / $(".fairyTale").height());
			console.log("==========================");
			*/
		}
		
		//sceneNum 조건의 scene 가져오기
		function targetScene(sceneNum){
			var returnScene = null;
			$($(chapter.screen).get(screenSelector()).scene).each(function(index,scene){
				if(scene.sceneNum == sceneNum){
					returnScene = scene;
					return false;
				};
			});
			return returnScene;
		}
		
		/*
		function editdata(){
			//$("#chapter").val(JSON.stringify(chapter));
			$("#objList").val(objList[0]);
			console.log("objList[0] : " + JSON.stringify(objList[0]));
			
			var form = new FormData(document.getElementById('editForm'));
			$.ajax({
						  url		: "./editdata"
						, method	: "post"
						, processData: false
						//, contentType: false
						, type		: "multipart/mixed"
						, data		: form
						//, dataType	: 'text'
						, contentType	: 'application/json; charset=UTF-8'
						, success	: function (response) {
							console.log(response + " : 아리가또네");
						}
			});
		}
		
		//submitEdit
		function submitEdit(){
			$("#chapter").val(JSON.stringify(chapter));
			//$("#objList").val(objList);
		}
		*/
	</script>
	<style>
		.fairyTale{
			border:1px solid gold;
		}
		
		.move{
			border:1px solid rad;
		}
		
		.effect{
			border:1px solid blue;
		}
		.fEdit{
			border:1px solid green;
		}
	</style>
</head>
<body>
	<table>
		<tr>
			<td>
				<div id="objList">
					<span>--- Object List ---</span><br/>
				</div>
			</td>
			<td>
				<div class="fairyTale">
					<div class="layer fEdit"></div>
					<div class="layer move group1"></div>
					<div class="layer effect group1"></div>
				</div>
			</td>
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
			</td>
		</tr>
		<tr>
			<td colspan = "3">
				<!-- 
				<div class="objectSelector">
					<span><input type="radio" value="text" name="object" checked />글</span>
					<span><input type="radio" value="img" name="object" />이미지</span>
					<span><input type="radio" value="effect" name="object" />효과</span>
				</div>
				 -->
				<input type="text" id="objText"/>
				<input type="button" id="addObjTxtBtn" value="새 텍스트 추가"/>
				
				<select id ="effect" name="effect">
					<option value="effect1" >눈</option>
					<option value="effect2" >비</option>
					<option value="effect3" >안개</option>
				</select>
				
				<input type="button" id="effectAddBtn" value="효과추가"/>
				<!-- file  -->
				<form action="#" method="post" id="editForm" enctype="multipart/mixed">
					<input type="file" onchange="imgFilePut(this.files)" />
				</form>
				<!-- file  -->
				<input type="button" id="addObjectBtn" value="기존 오브젝트 추가"/>
				<input type="button" id="objCheckBtn" value="오브젝트 삭제"/>
			</td>
		</tr>
		<tr>
			<td colspan = "3">
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
		<tr>
			<td colspan = "2">
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
		<tr>
			<td colspan = "2">
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
	</table>
</body>
</html>