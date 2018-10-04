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
				, "background" : null
				, "mainImg"	: null
				, "maxLayer": 1
			  };

// 보기 배열
var exampleBox = [];
// 정답 배열
var anwserBox = [];
/*
 * 
 * var tAnwser = {
				"sceneNum" : ""
				"answer"
				
			 };
*/
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
			, "background" : "url('./images/backimg.png')"
		}
	);
	var size = $(".fairyTale").width() + "px " + $(".fairyTale").height() + "px"
	$(".fairyTale").css( "background-size", size);
	
	
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
	
	// %%체크
	$("#objText").on("change", function(){
		var content = $("#objText").val();
		var check = content.match(/%%/g);
		var count = 0;
		if(check){
			count = check.length;
		}else{
			//없을경우
			return false;
		}
		
		if( count > 3){
			alert("최대 문제는 3개입니다.");
			count = 3;
		}
		
		while(true){
			if(count == $(".anwser").length){
				break;
			} else if(count < $(".anwser").length){
				$(".anwser").last().remove();
			} else if(count > $(".anwser").length){
				$("#anwserBase").append('<input class="anwser" type="text">');
			}
		}
		
		if($(".example").length < $(".anwser").length){
			while(true){
				if($(".example").length == $(".anwser").length){
					break;
				}
				$("#exampleBase").append("<input class='example' type='text'>");
			}
		}
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
	
	//sceneSet scene 저장
	$("#saveChapterBtn").on("click",saveChapterBtn);
	
	//layer radio event
	$("input[name='layer']").on("click",selectClear);
	
	//layer radio event
	$("#screensView").on("change",changeScreen);
	
	//img file upload click
	$("#imgFileBtn").on("click",function(){$("#fileUp").click();});
	
	//Back Ground file upload click
	$("#BGIBtn").on("click",function(){$("#backGroundUp").click();});
	
	//Chapter file upload click
	$("#CIBtn").on("click",function(){$("#ChapterUp").click();});
	
	//스크린 추가
	$("#addScreen").on("click",addScreen);
	
	//스크린 삭제
	$("#delScreen").on("click",delScreen);
	
	//scene을 다음 스크린에 복사
	$("#cNextScreen").on("click",cNextScreen);
	
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
	$("#addLayer").on("click",layerAdd);
	
	$("#delLayer").on("click", function(){
		var lastNum = $(".move").length;
		
		if(!(lastNum > 1)){alert("최소 하나의 레이어는 존재하여야 합니다.");return false;};
		
		var tf = confirm("마지막 레이어를 삭제 합니다.\n관련된 모든 객체는 삭제됩니다.");
		if(!tf){return false;};
		
		
		$(".group"+lastNum).remove();
		
		$(chapter.screen).each(function(index,screen){
			var maxScene = screen.scene.length - 1;
			$($(screen.scene).get().reverse()).each(function(index,scene){
				if(scene.layerNum == lastNum){
					screen.scene.splice((maxScene - index),1);
				};
			});
		});
		
		chapter.maxLayer = lastNum-1;
		
		$("input[name='layer']").last().parent().remove();
		$("input[name='layer']").last().prop("checked",true);
		//green box
		greenBox();
		
		return false;
	});
	
	//오브젝트 사용
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
				/*	폰트 크기
				case 107 :
					var fontSize = Number.parseInt($(selectTarget).css("font-size"));
					$(selectTarget).css("font-size",(fontSize + 1) + "px").css("white-space","normal");
					break;
				 */
				case 104 : fMovement("+=0","-="+keyAniVal,0);
					break;
				case 98 : fMovement("+=0","+="+keyAniVal,0);
					break;
				case 100 : fMovement("-="+keyAniVal,"+=0",0);
					break;
				case 102 : fMovement("+="+keyAniVal,"+=0",0);
					break;
				case 103 : fMovement("-="+keyAniVal,"-="+keyAniVal,0);
					break;
				case 105 : fMovement("+="+keyAniVal,"-="+keyAniVal,0);
					break;
				case 99 : fMovement("+="+keyAniVal,"+="+keyAniVal,0);
					break;
				case 97 : fMovement("-="+keyAniVal,"+="+keyAniVal,0);
					break;
				case 101 : 
					//var centerX = $(".fairyTale").offset().left + (($(".fairyTale").width() / 2) - ($(selectTarget).width() / 2));
					//var centerY = $(".fairyTale").offset().top + (($(".fairyTale").height() / 2) - ($(selectTarget).height() / 2));
					
					var centerX = (($(".fairyTale").width() / 2) - ($(selectTarget).width() / 2));
					var centerY = (($(".fairyTale").height() / 2) - ($(selectTarget).height() / 2));
					
					fMovement(centerX,centerY,0);
					break;
				case 46 :
					//Delete key
					sceneDelete(selectTarget);
					
					//selectTarget.remove();
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
	
	//Json데이터 넣기
	initJson();
});
//***********************************************************************************//
//레이어 추가
function layerAdd(){
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
	$(span).append("&nbsp;Layer"+newNum+"&nbsp;");
	$(".layerSelector").append(span);
	
	resize();
	fIndexSet();
	
	//selectClear event
	$("input[name='layer']").on("click",selectClear);
	$("input[name='layer']").last().prop("checked",true);
	//green box
	greenBox();
}
//스크린 변경
function changeScreen(){
	var screenNum = screenSelector();
	console.log("screenNum : " + screenNum);
	//layer 전부 초기화
	$(".layer").html("");
	$($(chapter.screen).get(screenNum).scene).each(function(index,scene){
		//console.log(screenNum + ": scene : " + JSON.stringify(scene));
		//다시그려야함
		//scene.objId
		$(objList).each(function(index,obj){
			if(obj.objId == scene.objId){
				if(obj.objType == "img"){
					addImgObject (obj.obj,scene);
				}else if(obj.objType == "text" ||  obj.objType == "question"){
					addTxtObject(obj.obj,obj.objType,scene);
				};
				/*
				addImgObject(obj.obj,null,obj.view,obj.objId);
				addTxtObject(obj.obj,question,null,obj.objId);
				*/
			};
		});
	});
	//스크린 번호
	//$("#screensView").html("Screens " + (Number(screenNum) + 1));
	//선택 초기화;
	selectClear();
	//뷰리스트
	sceneViewList();
	
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
// 오브젝트 사용
function addObject(){
	console.log("!!asdasdas");
	$(".objCheck").each(function(index,check){
		if($(check).prop('checked')){
			console.log("!!check " + $(check).val());
			$(objList).each(function(index,obj){
				if(obj.objId == $(check).val()){
					console.log("!!obj " + obj);
					switch(obj.objType){
						//keyAniVal reSet
						case "img" :
							console.log("!!img");
							//addImgObject (file,scene,view,objId)
							addImgObject(obj.obj,null,obj.view,obj.objId);
							break;
						case "text" : case "question" :
							console.log("!!text");
							//addTxtObject(value,question,scene,objId)
							var question = false;
							if(obj.objType == "question"){
								question = true;
							}
							addTxtObject(obj.obj,question,null,obj.objId);
							break;
					};
				};
			});
		};
	});
	//view set
	objViewList();
	
	return false;
};

//selected obj clear
function selectClear(){
	selectTarget = null;
	$("#fElementTarget").remove();
	$("#sObjId").val("");
	$("#sTime").val("");
	$("#sLatency").val("");
	$("#top").val("");
	$("#left").val("");
	$("#width").val("");
	$("#height").val("");
	//green box
	greenBox();
}
//오브젝트 삭제
function objCheck(){
	var tf = confirm("정말 삭제하시겠습니까? 관련된 모든 객체는 삭제됩니다.");
	if(tf){
		$(".objCheck").each(function(index,check){
			if($(check).prop('checked')){
				objDelete($(check).val());
			};
		});
		//선택 초기화;
		selectClear();
		//뷰리스트
		sceneViewList();
		//object view
		objViewList();
		//다시그려
		changeScreen();
	};
	return false;
};
//object delete
function objDelete(delObjNum){
	$(chapter.screen).each(function(index,screen){
		var maxScene = screen.scene.length - 1;
		$($(screen.scene).get().reverse()).each(function(index,scene){
			if(scene.objId == delObjNum){
				screen.scene.splice((maxScene - index),1);
				
				if(scene.objType == 'question'){
					$(anwserBox).each(function(index,anwsers){
						if(anwsers.obj_id == scene.objId){
							anwserBox.splice(index,1);
						};
					});
					
					$(exampleBox).each(function(index,example){
						if(example.objId == scene.objId){
							exampleBox.splice(index,1);
						};
					});
				};
			};
		});
	});
	
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
	
	var wWidth = $("#editTable").width() * 0.75 - 50;
	//var wWidth = $(window).width() * 0.5 - 50;
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
	var size = $(".fairyTale").width() + "px " + $(".fairyTale").height() + "px"
	$(".fairyTale").css( "background-size", size);
	
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
	
	//다시그려
	changeScreen();
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
function imgFilePut(files,check){
	//새 이미지
	var formData = new FormData();
	formData.append("file"	 ,$(files).get(0));
	formData.append("fpkNum"	 ,$("#fpkNum").val());
	formData.append("chapterNum",$("#chapterNum").val());
	
	//console.log("formData : " + JSON.get("fpk"));
	var fileName = $(files).get(0).name;
	//이미지 업로드
	$.ajax({
			  url		: "./editdata"
			, type		: "post"			
			, processData: false
			, contentType: false
			, data		: formData
			, dataType	: 'text'
			, success	: function (response) {
				var url = "./image?tmpImg="+response+"&fpk=" + $("#fpkNum").val() + "&chapter="+ $("#chapterNum").val();
				if(check == "img"){
					addImgObject(url,null,fileName);
					$("input[type=file]").val("");
					
					//ie
					if (/msie/.test(navigator.userAgent.toLowerCase())) { 
						$("input[type=file]").replaceWith( $("input[type=file]").clone(true) );
					} else {
						$("input[type=file]").val("");
					}
				}else if(check == "back"){
					//배경
					$(".fairyTale").css( "background" , "url('"+url+"')");
					var size = $(".fairyTale").width() + "px " + $(".fairyTale").height() + "px"
					$(".fairyTale").css( "background-size", size);
					chapter.background = url;
				}else if(check == "chapter"){
					//대표 이미지
					chapter.mainImg = url;
				}
				
			}
	});
};

//add image
function addImgObject (file,scene,view,objId){
	
	var image = new Image();
	image.src = file;
	image.onload = function(){
		if(scene == null){// 기존 scene 정보가 없다면 새로 그리기
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
			if(objId == null){//file 파일 위치값 obj.obj
				objId = objPush("img",file,view);
			}
			
		}else{ // 기존 scene 정보가 있다면 기존 정보로 그리기
			var ftWidth		= $(".fairyTale").width();
			var ftHeigth	= $(".fairyTale").height();
			$(this).css(
				{
					  "width"	: ftWidth	* (scene.width/100)
					, "height"	: ftHeigth	* (scene.height/100)
					, "left"	: ftWidth	* (scene.left/100)
					, "top"		: ftHeigth	* (scene.top/100)
					, "position" : "absolute"
				}
			);
		}
		
		//오브젝트 아이디
		$(this).data("objId", scene == null ? objId : scene.objId).css("position", "absolute");
		
		var layerGroupNum = (scene == null ? layerSelector() : scene.layerNum);
		var sceneNum ="";
		if(scene == null){
			// 기존 scene 정보가 없다면 새로 등록
			//초기화playAnimateSet(target,screenNum,objId,layerNum,animate,time,latency)
			//appear 첫번째는 나타나는 이벤트만
			//두번째 scene에는 이동및 없어지는 이벤트만
			sceneNum = playAnimateSet(this,screenSelector(),objId,layerGroupNum,"fadeIn",0,0);
		}else{
			//복사해온 것 sceneNum 지정
			sceneNum = scene.sceneNum;
		}
		
		//sceneNum 넣기
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
		console.log("!! 왜 안먹지");
		//객체 크기 json setting
		setWHLT(selectTarget);
	};

};

//object push objList
/*!! 주의 !! objMaxNum()의 실행 순서에의 해 오류가 발생할 수 있으니
  마지막에 실행하던가 검증하여 정확히 입력하도록하자 !!*/
function objPush(objType,obj,view){
	var objId = objMaxNum();
	objList.push({
					  "objId"	: objId
					// 오브젝트 이름
					, "objType"	: objType
					//원본
					, "obj"		: obj
					//에디터 표시될 명칭
					, "view"	: view
				});
	
	return objId;
};
//챕터
//chapter{ screen : {{scene,scene}} , {{scene,scene}} }, img }

//장면추가
//scene push screen
function playAnimateSet(target,screenNum,objId,layerNum,animate,time,latency){
	var sceneNum = screenNum + "_" + objId + "_" + sceneMaxNum(screenNum,objId);
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
	/*
	var $nextScreen = $(chapter.screen).get(parseInt(screenNum)+1);
	if($nextScreen != null){
		//Deep copy *
		var clone = deepCopy(scene);
		clone.animate = "fadeOut";
		$nextScreen.scene.push(clone);
		//* Deep copy
	};
	*/
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
function sceneMaxNum(screenNum,objId){
	var maxNum = 0;
	if($(chapter.screen).get(screenNum).scene.length != 0){
		$($(chapter.screen).get(screenNum).scene).each(function(index,scene){
			var sceneArry = scene.sceneNum.split("_");
			//스크린번호(0) _ 오브젝트아이디(1) _ 스크린에 쌓인 고유번호(2)
			//console.log("scene : " + sceneArry[0] + " / "+ sceneArry[1] + " / "+ sceneArry[2]);
			if(sceneArry[0] == screenNum){
				if(sceneArry[1] == objId){
					if(parseInt(sceneArry[2]) >= maxNum){
						maxNum = parseInt(sceneArry[2]) + 1;
					};
				};						
			};
		});
	};
	return maxNum;
};

//view div set objList 
function objViewList(){
	var putInfo = "";
	
	var event = false;
	
	$(objList).each(function(index,obj){
		var icon = "";
		if(obj.objType == "img"){
			icon = "fa-file-image-o";
		}else if(obj.objType == "text"){
			icon = "fa-file-text-o";
		}else if(obj.objType == "question"){
			icon = "fa-file-text";
		}
		
		putInfo += "<input type='checkbox' class='objCheck' value='"+obj.objId+"' />&nbsp;";
		if(obj.objType == "text" || obj.objType == "question"){
			putInfo += '<a href="#layer_'+obj.objId+'" class="btn btn-popup ">';
		};
		putInfo += "ID : " + obj.objId + "&nbsp;<i class='fa "+icon+"'>&nbsp;"+ obj.view +"</i>&nbsp;";
		if(obj.objType == "text" || obj.objType == "question"){
			putInfo += '</a>';
			event = true;
		};
	});
	$("#objList").html(putInfo);
	
	if(event){
		//팝업 클릭 이벤트
		$('.btn-popup').click(function(){
			var $href = $(this).attr('href');
			layer_popup($href,$(this));
			return false;
		});
	}
};

//add object text
function addObjTxt(){
	if($("#objText").val().length < 1){
		alert("글을 입력하세요.");
		return false;
	}
	if($("#qOnOff").prop("checked")){

		var check = false;
		$(".anwser").each(function(index,anwser){
			if($(anwser).val().length < 1){
				check = true;
			}
		});
		if(check){
			alert("모든 정답을 넣으세요.");
			return false;
		};
		
		check = false;
		$(".example").each(function(index,example){
			if($(example).val().length < 1){
				check = true;
			}
		});
		if(check){
			alert("모든 보기를 입력하세요.");
			return false;
		}
	}
	var objId = null;
	
	if($("#popObjID").val() == ''){
		//등록
		//Text object
		objId = addTxtObject($("#objText").val(),$("#qOnOff").prop("checked"));

		if($("#qOnOff").prop("checked")){
			//체크된 상태라면 
			var anwser = "";
			$(".anwser").each(function(index,vlaue){
				if(index != 0){
					anwser += "_";
				}
				anwser += $(vlaue).val();
			});
			
			//정답 저장	
			anwserBox.push({
					 "obj_id"	: objId
					,"answer"	: anwser
			});
			
			var exJson = '{ "objId":"'+objId+'"'; 
			$(".example").each(function(index,ex){
				var answer = $(ex).val();
				exJson += ', "answer'+index+'":"' + answer + '"';
			});
			exJson += '}';
			//보기 저장
			exampleBox.push(JSON.parse(exJson));
		};
	
	}else{
		//수정
		objId = $("#popObjID").val();
		
		$(objList).each(function(index,obj){
			if(obj.objId == objId){
				
				var type = "text"										//일반 텍스트
				if($("#qOnOff").prop("checked")){type = "question"}		//문제 텍스트
				obj.objType = type;
				
				var value = $("#objText").val();
				obj.obj = value;
				var view = '';
				if(value.length > 3){
					view = value.substring(0,3)+"..";
				}else{
					view = value
				}
				obj.view = view;
			}
		});
		
		//삭제후
		$(anwserBox).each(function(index,anwsers){
			if(anwsers.obj_id == objId){
				anwserBox.splice(index,1);
			};
		});
		if($("#qOnOff").prop("checked")){
			//생성
			var anwser = "";
			$(".anwser").each(function(index,vlaue){
				if(index != 0){
					anwser += "_";
				}
				anwser += $(vlaue).val();
			});
		
			//정답 저장	
			anwserBox.push({
					 "obj_id"	: objId
					,"answer"	: anwser
			});
		}
		//삭제후
		$(exampleBox).each(function(index,example){
			if(example.objId == objId){
				exampleBox.splice(index,1);
			};
		});
		if($("#qOnOff").prop("checked")){
			//새로 생성
			var exJson = '{ "objId":"'+objId+'"'; 
			$(".example").each(function(index,ex){
				var answer = $(ex).val();
				exJson += ', "answer'+index+'":"' + answer + '"';
			});
			exJson += '}';
			//보기 저장
			exampleBox.push(JSON.parse(exJson));
		}
	}
	
	//뷰리스트
	sceneViewList();
	//object view
	objViewList();
	//다시그려
	changeScreen();
	//팝업 닫기
	closePop();
	return true;
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

//텍스트 넣기 (문제)
// add text object
function addTxtObject(value,question,scene,objId){
	var span = document.createElement("span");
	if(scene == null){ // 기본 scene 정보가 없다면
		$(span).html(value).css("position", "absolute");
		$(span).css("font-size", "25px");
		$(span).css("white-space","pre");
		var view = "";
		if(value.length > 3){
			view = value.substring(0,3)+"..";
		}else{
			view = value
		}
		
		var type = "text"					//일반 텍스트
		if(question){type = "question"}		//문제 텍스트
		
		if(objId == null){
			objId = objPush(type,value,view);
		}
	}else{	// 기본 scene가 있다면
		$(objList).each(function(index,obj){
			if(obj.objId == scene.objId){
				$(span).html(obj.obj);
				$(span).css("font-size", "25px");
				$(span).css("white-space","pre");
				return false;
			};
		});
		var ftWidth		= $(".fairyTale").width();
		var ftHeigth	= $(".fairyTale").height();
		$(span).css(
			{
				  "width"	: ftWidth	* (scene.width/100)
				, "height"	: ftHeigth	* (scene.height/100)
				, "left"	: ftWidth	* (scene.left/100)
				, "top"		: ftHeigth	* (scene.top/100)
				, "position" : "absolute"
			}
		);
		$(span).css("font-size", "25px");
		$(span).css("white-space","pre");
	}
	
	var sceneNum ="";
	
	var layerGroupNum = (scene == null ? layerSelector() : scene.layerNum);
	if(scene == null){
		// 기존 scene 정보가 없다면 새로 등록
		//appear 첫번째는 나타나는 이벤트만
		//두번째 scene에는 이동및 없어지는 이벤트만
		sceneNum = playAnimateSet(span,screenSelector(),objId,layerGroupNum,"fadeIn",0,0);
	}else{
		//복사해온 것 sceneNum 지정
		sceneNum = scene.sceneNum;
	}
	
	//오브젝트 아이디 넣기
	objId = scene == null ? objId : scene.objId;
	$(span).data("objId",objId);
	
	//sceneNum 넣기
	$(span).data("sceneNum",sceneNum);
	
	$(".move.group"+layerGroupNum).append(span);
	
	//객체 선택
	selectTarget = span;
	//green box
	greenBox(span);
	//scene view
	sceneViewList();
	//object view
	objViewList();
	//객체 크기 json setting
	setWHLT(span);
	
	return objId;
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
			  "width" 		: ftWidth	* (sceneInfo.width / 100)
			, "height"		: ftHeigth	* (sceneInfo.height / 100)
			, "left"		: ftWidth	* (sceneInfo.left / 100)
			, "top"			: ftHeigth	* (sceneInfo.top / 100)
			, "position"	: "absolute"
		}
	)
}


//선택된 화면
function screenSelector(){
	var screenNum = $("#screensView").val();
	return screenNum;
}

//화면 추가 스크린
//screens push chapterSet
function screenSet(scene){
	//console.warn("문제 screen을 만들어야함 \n chapter{ screens : [screen : {{scene,scene}} , {{scene,scene}} }, img } \n chapter :" + chapter.size);
	//var sceneNumber = chapter.length;
	chapter.screen.push({
						  "scene"		: scene==null ? [] : scene
						//, "clickEvent"	: null
					});
};
//Deep copy 복사
function deepCopy(obj){
	

	console.log("deepCopy :" + $(obj).length);
	
	//Deep copy *
	var clone = JSON.parse(JSON.stringify(obj));
	return clone;
	//* Deep copy
}
//추가 복사 스크린
function addScreen(){
	//Deep copy *
	var clone = deepCopy($(chapter.screen).get(screenSelector()).scene);
	$(clone).each(function(index,scene){
		scene.animate = "";
	})
	console.log("clone : " + JSON.stringify(clone));
	screenSet(clone);
	//* Deep copy
	
	//option 추가;
	var newNum = $(chapter.screen).length;
	addTagScreen(newNum);
	/*라디오 버튼 생성
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
	
	*/
	//스크린 변경
	changeScreen();
	
	return false;
}
//option태그 추가
function addTagScreen(newNum){
	
	var option = document.createElement("option");
	$(option).val(newNum-1);
	$(option).append("Screen "+newNum);
	$(option).prop("selected","selected");
	$("#screensView").append(option);
}

//스크린 삭제
function delScreen(){
	var length =  $(chapter.screen).length;
	
	if(!(length > 1)){alert("최소 하나의 스크린은 존재하여야 합니다.");return false;};
	var tf = confirm("마지막 스크린을 삭제 합니다.\n관련된 모든 객체는 삭제됩니다.");
	if(!tf){return false;};
	
	
	chapter.screen.splice(length-1,1);
	
	$("#screensView").children("option").last().remove();
	$("#screensView").children("option").last().prop("selected","selected");
	
	//스크린 변경
	changeScreen();
	
	return false;
}

//scene을 다음 스크린에 복사
function cNextScreen(){
	var sceneNum = null;
	//선택된 radio 버튼
	$("input[name='scene']").each(function(index,sRadio){
		if($(sRadio).prop('checked')){
			sceneNum = $(sRadio).data("sceneNum");
			return false;
		}
	});
	
	var screenNum = Number(screenSelector());
	if(sceneNum!=null){
		var MaxScreenNum = $(chapter.screen).length;
		if((MaxScreenNum - 1) > screenNum){
			
			var sceneCheck = false;
			console.log("screenNum" + screenNum);
			console.log("screenNum" + (screenNum+1));
			$($(chapter.screen).get(screenNum+1).scene).each(function(index,scene){
				if(scene.sceneNum == sceneNum){
					sceneCheck = true;
					return false;
				}
			})
			
			if(sceneCheck){
				alert("이미 존재합니다.")
				return false;
			}
			
			///*Deep copy
			var clone = null;
			$($(chapter.screen).get(screenNum).scene).each(function(index,scene){
				if(scene.sceneNum == sceneNum){
					clone = deepCopy(scene);
					return false;
				}
			})
			clone.animate = "";
			$(chapter.screen).get(screenNum+1).scene.push(clone);
			//Deep copy*/
		}
	}
}

//scene 선택
function changeScene(element){
	console.log("sceneNum");
	//objId img 와 radio 구분
	//selectTarget 선택	
	if($(element).is("img")||$(element).is("span")){
		selectTarget = element;
	}else{
		console.log("sceneNum :" + $(this).data("sceneNum"));
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
		if($(sRadio).data("sceneNum") == $(selectTarget).data("sceneNum")){
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
	$("#sceneList").html("");
	$($(chapter.screen).get(screenSelector()).scene).each(function(index,scene){
		var span = document.createElement("span");
		var i = document.createElement("i");
		$(i).addClass("fa fa-cube");
		var input = document.createElement("input");
		$(input).attr("type","radio");
		$(input).prop('checked',true);
		$(input).attr("name","scene");
		$(input).addClass("sceneCheck");
		$(input).data("objId",scene.objId);
		$(input).data("sceneNum",scene.sceneNum);
		
		$(span).append(input);
		$(span).append(i);
		$(span).append("&nbsp;ID : " + scene.sceneNum);
		
		$("#sceneList").append(span);
		
	});
	var last = $($(chapter.screen).get(screenSelector()).scene).length;
	if(last > 0){
		sceneInfoSet($($(chapter.screen).get(screenSelector()).scene).get(last-1));
	}
	
	
	//scene
	$("input[name='scene']").on("click",changeScene);
}

//width height left top setting 객체 크기
function setWHLT(target){
	
	//데이터 넣기
	$($(chapter.screen).get(screenSelector()).scene).each(function(index,scene){
		if(scene.sceneNum == $(target).data("sceneNum")){
			scene.width		= ($(target).width() / $(".fairyTale").width() * 100).toFixed(1);
			scene.height	= ($(target).height() / $(".fairyTale").height() * 100).toFixed(1);
			scene.left		= ($(target).position().left / $(".fairyTale").width() * 100).toFixed(1);
			scene.top		= ($(target).position().top / $(".fairyTale").height() * 100).toFixed(1);
			
			console.log("scene : " + scene);
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

function jsonView(){
	$("#chapterJsonView").val(JSON.stringify(chapter));
	$("#objListJsonView").val(JSON.stringify(objList));
	$("#exampleBoxJsonView").val(JSON.stringify(exampleBox));
	$("#anwserBoxJsonView").val(JSON.stringify(anwserBox));
}

function saveFairy(){
	$("#saveChapter").val(JSON.stringify(chapter));
	$("#saveObjList").val(JSON.stringify(objList));
	$("#saveExample").val(JSON.stringify(exampleBox));
	$("#saveAnwser").val(JSON.stringify(anwserBox));		
	return true;
}

function sceneDelete(target){
	var scenes = $(chapter.screen).get(screenSelector()).scene; 
	
	$(scenes).each(function(index,scene){
		if($(target).data("sceneNum") == scene.sceneNum){
			console.log("sceneNum : " + scene.sceneNum);
			scenes.splice(index,1);
			return false;
		}
	});
	//타겟 삭제
	$(target).remove();
	//뷰리스트
	sceneViewList();
	//object view
	objViewList();
	//children green box;
	greenBox();
}


//json set
function setJson(chapterJson,objListJson,exampleJson,anwserJson){
	//오브젝트
	if(objListJson.length > 0){
		
		//objList = JSON.parse(objListJson);
		objList = objListJson;
		//object view
		objViewList();
	}
	//보기
	if(exampleJson.length > 0){
		//exampleBox = JSON.parse(exampleJson);
		exampleBox = exampleJson;
	}
	//답변
	if(anwserJson.length > 0){
		//anwserBox = JSON.parse(anwserJson);
		anwserBox = anwserJson;
	}
	//챕터
	if(chapterJson.length > 2){
		chapter = JSON.parse(chapterJson);
		//chapter = chapterJson;
		
		//최대챕터수 layerNum
		$("#screensView").html("");
		
		for(var i=0; i < (chapter.screen.length); ++i){
			addTagScreen(i+1);
		}
		
		for(var i=0; i < (chapter.maxLayer-1); ++i){
			console.log("i : " + i);
			layerAdd();
		}
		
		//green box
		greenBox();
		//뷰리스트
		sceneViewList();
		//다시 그려
		changeScreen();
		//백그라운드
		var background = "";
		if(chapter.background){
			background = chapter.background;
		};
		if(background.length > 0){
			$(".fairyTale").css( "background" , "url('"+background+"')");
			var size = $(".fairyTale").width() + "px " + $(".fairyTale").height() + "px"
			$(".fairyTale").css( "background-size", size);
		}
	}
}

function saveChapterBtn(){
	$("#saveFairy").submit();
}