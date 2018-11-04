// 選択しているElement
var selectTarget;

// クリック イベント チェック
var ckMovement = false;

// 連続した入力チェック
var keydownSet;

// Element移動間隔
var keyAniVal;

// CtrlとShift の Click チェック
var ctrlSet = false;
var shiftSet = false; 

// 童話を構成しているオブジェクト(Json)
var objList = [];

// 童話のチャプター
// screen : 個々の場面  < scene : 画面を構成するシーン
// background : 背景
// mainImg : チャプターの代表画面
// maxLayer : レイヤーの総数			** レイヤーはDivにZ-index属性を付与して具現しました。** レイヤー == Divと考えても大丈夫です。
var chapter = {
				  "screen"	: []
				, "background" : null
				, "mainImg"	: null
				, "maxLayer": 1
			  };

// 問題の選択項目
var exampleBox = [];
// 問題の正解
var anwserBox = [];

// マウスの位置
var mouseX = 0;
var mouseY = 0;

// Elementサイズ調節のための変更前の値
var xWPointOld = 0;
var yHPointOld = 0;

// 選択している scene Element
var sScene;

$(document).ready(function(){
	/** テキストと問題を追加するポップアップ **/
	$('.btn-popup').click(function(){
		var $href = $(this).attr('href');
		layer_popup($href,$(this));
		return false;
	});
	//問題の項目追加
	$("#examplePlus").on("click",function(){
		if($(".example").length < 3){
			$("#exampleBase").append("<input class='example' type='text'>");
		}else{
			alert("너무 많습니다.");
		}
		return false;
	});
	//問題の項目削除
	$("#exampleMinus").on("click",function(){
		if($(".example").length > $(".anwser").length){
			$(".example").last().remove();
		}else{
			alert("정답보다 적을 수는 없습니다.");
		}
		return false;
	});
	
	//テキストと問題を区分します。
	$("#qOnOff").on("click",function(){
		if($("#qOnOff").prop("checked")){
			$("#questionBase").show();
		}else{
			$("#questionBase").hide();
		}
	});
	
	//ポップアップ閉めます。
	$("#layer").find('#btnClose').click(function(){
		closePop();
		return false;
	});
	
	//テキストと問題を同録します。
	$("#layer").find('#addObjTxtBtn').click(function(){
		if(addObjTxt()){
			closePop();
		};
		return false;
	});
	
	//テキストと問題を消します。
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
		
		//選択初期化
		selectClear();
		//sceneのリスト再設定
		sceneViewList();
		//objectのリスト再設定
		objViewList();
		//画面を再設定
		changeScreen();
		//ポップアップ閉めます
		closePop();
		return false;
	});
	/******************************************/
	
	//初のチャプターを設定します。
	screenSet();
	//z indexを設定します。
	fIndexSet();
	//画面サイズを再調整します。
	resize();
	
	//技本レイヤー 設定
	$(".fairyTale").css(
		{
			  "background-size": "cover"
			//, "background" : "url('./images/backimg.png')"
		}
	);
	//技本レイヤー background-size設定
	var size = $(".fairyTale").width() + "px " + $(".fairyTale").height() + "px"
	$(".fairyTale").css( "background-size", size);
	
	//マウス制御
	$(".fairyTale").mousemove(function(events){
		//クリックしている場合は移動
		if(ckMovement){
			//サイズ調節
			if(shiftSet){
				var xWPoint = events.pageX - $(selectTarget).offset().left - (mouseX);
				var width = parseInt($(selectTarget).width()) + parseInt(xWPoint - xWPointOld);
				var yHPoint = events.pageY - $(selectTarget).offset().top - (mouseY);
				var height = parseInt($(selectTarget).height()) + parseInt(yHPoint - yHPointOld);
				$(selectTarget).css(
					{
						  "width"		: width
						, "height"		: height
						, "word-break"	: "break-all"
					}
				);
				yHPointOld = yHPoint;
				
				//選択案内ボックスサイズ調節
				$("#fElementTarget").css(
					{
						  "width" : $(selectTarget).width()
						, "height": $(selectTarget).height()
						, "word-break"	: "break-all"
					}
				);
			
				xWPointOld = xWPoint;
				
				//サイズ情報保存
				setWHLT(selectTarget);
				return false;
			}
			
			// 技本レイヤーの座標をセーブします。
			var FT = getBTWN(".fairyTale");
			
			// 選択されたレイヤーで対象を探します。
			if((FT.TWMin <= events.pageX && FT.TWMax >= events.pageX)
				&& (FT.THMin <= events.pageY && FT.THMax >= events.pageY)){
				
				//click point
				var xPoint = events.pageX - FT.$target.offset().left - (mouseX);
				var yPoint = events.pageY - FT.$target.offset().top - (mouseY);
				
				//対象を移動します。
				fMovement(xPoint,yPoint,0);
				return false;
			}else{
				//選択初期化
				selectClear();
				return false;
			};
		};
	});
	
	// 問題に正答を入れ場合％％を利用してエリアを区分します。
	/*
	例
	問題:今日は%%です。
	正答:日曜日
	項目:日曜日,月曜日,火曜日
	*/
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
		//選択解約
		if(ckMovement){
			ckMovement = false;
			return false;
		}
	});
	
	//scene情報保存
	$("#sceneSet").on("click",sceneSet);
	
	//童話情報保存
	$("#saveChapterBtn").on("click",saveChapterBtn);
	
	//layer radio event
	$("input[name='layer']").on("click",selectClear);
	
	//画面を再設定
	$("#screensView").on("change",changeScreen);
	
	//img file upload click
	$("#imgFileBtn").on("click",function(){$("#fileUp").click();});
	
	//BackGround file upload click
	$("#BGIBtn").on("click",function(){$("#backGroundUp").click();});
	
	//Chapter file upload click
	$("#CIBtn").on("click",function(){$("#ChapterUp").click();});
	
	//Screen追加
	$("#addScreen").on("click",addScreen);
	
	//Screen削除
	$("#delScreen").on("click",delScreen);
	
	//sceneを次のscreenにコピーします。
	$("#cNextScreen").on("click",cNextScreen);
	
	//Elementを選択する
	$(".fairyTale").mousedown(function(events){
		$($(".move.group"+layerSelector()).children().get().reverse()).each(function(index,element){
			
			//初期化
			xWPointOld = 0;
			yHPointOld = 0;
			
			//elementの座標をセーブします。
			var ele = getBTWN(element);
			
			// マウス座標
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
	
	//新しいレイヤー登録
	$("#addLayer").on("click",layerAdd);
	//レイヤー削除
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
	
	//選択したオブジェクトをスクリーンで使用
	$("#addObjectBtn").on("click", addObject);
	
	//オブジェクト削除
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
					var centerX = (($(".fairyTale").width() / 2) - ($(selectTarget).width() / 2));
					var centerY = (($(".fairyTale").height() / 2) - ($(selectTarget).height() / 2));
					
					fMovement(centerX,centerY,0);
					break;
				case 46 :
					//Delete key
					sceneDelete(selectTarget);
					//選択初期化
					selectClear();
					//objectのリスト再設定
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
	
	//昔のデーターがあったらロードします。
	initJson();
});
//***********************************************************************************//
//新しいレイヤー登録
function layerAdd(){
	//레이어 생성
	var move = document.createElement("div");
	var effect = document.createElement("div");
	var newNum = $(".move").length + 1 ;
	$(move).addClass("layer move group"+newNum);
	$(effect).addClass("layer effect group"+newNum);
	
	$(".fairyTale").append(move,effect);
	
	//レイヤーの総数 upload
	chapter.maxLayer = newNum;
	
	//ラジオボタン生成
	var newLayer = document.createElement("input");
	var span = document.createElement("span");
	$(newLayer).attr("type","radio");
	$(newLayer).attr("name","layer");
	$(newLayer).val(newNum);
	$(span).append(newLayer);
	$(span).append("&nbsp;Layer"+newNum+"&nbsp;");
	$(".layerSelector").append(span);
	
	//resize();
	fIndexSet();
	
	//selectClear event
	$("input[name='layer']").on("click",selectClear);
	$("input[name='layer']").last().prop("checked",true);
	//green box
	greenBox();
}

//Screen 再表現
function changeScreen(){
	var screenNum = screenSelector();
	console.log("screenNum : " + screenNum);
	//layer 전부 초기화
	$(".layer").html("");
	$($(chapter.screen).get(screenNum).scene).each(function(index,scene){
		$(objList).each(function(index,obj){
			if(obj.objId == scene.objId){
				if(obj.objType == "img"){
					addImgObject (obj.obj,scene);
				}else if(obj.objType == "text" ||  obj.objType == "question"){
					addTxtObject(obj.obj,obj.objType,scene);
				};
			};
		});
	});
	//選択初期化
	selectClear();
	//sceneのリスト再設定
	sceneViewList();
};

//divの座標
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

//オブジェクト 追加
function addObject(){
	$(".objCheck").each(function(index,check){
		if($(check).prop('checked')){
			$(objList).each(function(index,obj){
				if(obj.objId == $(check).val()){
					switch(obj.objType){
						//keyAniVal reSet
						case "img" :
							console.log("!!img");
							addImgObject(obj.obj,null,obj.view,obj.objId);
							break;
						case "text" : case "question" :
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
	//objectのリスト再設定
	objViewList();
	
	return false;
};

//選択初期化
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
//オブジェクト削除確認
function objCheck(){
	var tf = confirm("정말 삭제하시겠습니까? 관련된 모든 객체는 삭제됩니다.");
	if(tf){
		$(".objCheck").each(function(index,check){
			if($(check).prop('checked')){
				objDelete($(check).val());
			};
		});
		//選択初期化
		selectClear();
		//sceneのリスト再設定
		sceneViewList();
		//objectのリスト再設定
		objViewList();
		//画面を再設定
		changeScreen();
	};
	return false;
};
//オブジェクト削除
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

//選択可能なオブジェクト表示
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

//対象を移動します
function fMovement(xPoint,yPoint,speed) {
	$(selectTarget).animate({ "left" : xPoint+"px" , "top" : yPoint+"px" }, speed);
	$("#fElementTarget").animate({ "left" : xPoint+"px" , "top" : yPoint+"px" }, speed);
	
	//객체 크기 setting
	setWHLT(selectTarget);
}

//選択されたレイヤー数字リターン
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

	//基準
	var wWidth = $("#editTable").width() * 0.75 - 50;
	
	// fairyTale view resize set!!
	$(".fairyTale").css(
		{
			  "width" : wWidth 
			, "height": wWidth / 1.77778
		}
	);
	var size = $(".fairyTale").width() + "px " + $(".fairyTale").height() + "px"
	$(".fairyTale").css( "background-size", size);
	
	$(".layer").css(
		{
			  "width" : wWidth 
			, "height": wWidth / 1.77778
			, "position" : "absolute"
		}
	);
	
	//画面を再設定
	changeScreen();
};

//Div（レイヤー）にzindexを設定します。
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

//imageをServerに登録します。
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

//imageを登録します。
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
			//scene情報がなければ新たに登録
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
		//objectのリスト再設定
		objViewList();
		//객체 크기 json setting
		setWHLT(selectTarget);
	};
};

//object push objList ObjectをobjListに登録します。
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

//scene push screen 
//screenにsceneを追加
function playAnimateSet(target,screenNum,objId,layerNum,animate,time,latency){
	var sceneNum = screenNum + "_" + objId + "_" + sceneMaxNum(screenNum,objId);
	var scene = {
					//sceneNumber スクリーン番号 _ オブジェクトID _ スクリーンに載せられた固有番号
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
	return sceneNum;
};

//objList objId Max Number オブジェクトの最大値
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

//screen Max Number 同じスクリーンに同じオブジェクトの最大値
function sceneMaxNum(screenNum,objId){
	var maxNum = 0;
	if($(chapter.screen).get(screenNum).scene.length != 0){
		$($(chapter.screen).get(screenNum).scene).each(function(index,scene){
			var sceneArry = scene.sceneNum.split("_");
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

//objectのリスト再設定
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
		//ポップアップ·クリック·イベント
		$('.btn-popup').click(function(){
			var $href = $(this).attr('href');
			layer_popup($href,$(this));
			return false;
		});
	}
};

//テキストと問題を有効性検査と同録と修整します。
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
		//修整
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
	
	//sceneのリスト再設定
	sceneViewList();
	//objectのリスト再設定
	objViewList();
	//画面を再設定
	changeScreen();
	//팝업 닫기
	closePop();
	return true;
};

// add text object　テキストと問題を同録します。
function addTxtObject(value,question,scene,objId){
	var span = document.createElement("span");
	if(scene == null){ // 기본 scene 정보가 없다면
		$(span).html(value).css("position", "absolute");
		$(span).css("font-size", "25px");
		$(span).css("white-space","normal");
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
				$(span).css("white-space","normal");
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
		$(span).css("white-space","normal");
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
	
	//Elementを選択します。
	selectTarget = span;
	//green box
	greenBox(span);
	//scene view
	sceneViewList();
	//objectのリスト再設定
	objViewList();
	//객체 크기 json setting
	setWHLT(span);
	
	return objId;
}

//scene 情報表示
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

//scene指定
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

//選択されたオブジェクトに scene 情報適用
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


//選択画面番号
function screenSelector(){
	var screenNum = $("#screensView").val();
	return screenNum;
}

//scene追加
function screenSet(scene){
	chapter.screen.push({
						  "scene"		: scene==null ? [] : scene
					});
};

//Deep copy
function deepCopy(obj){
	//Deep copy *
	var clone = JSON.parse(JSON.stringify(obj));
	return clone;
	//* Deep copy
}

//Screen 複写
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
	
	//画面を再設定
	changeScreen();
	
	return false;
}

//option 追加
function addTagScreen(newNum){
	var option = document.createElement("option");
	$(option).val(newNum-1);
	$(option).append("Screen "+newNum);
	$(option).prop("selected","selected");
	$("#screensView").append(option);
}

//screen 削除
function delScreen(){
	var length =  $(chapter.screen).length;
	
	if(!(length > 1)){alert("최소 하나의 스크린은 존재하여야 합니다.");return false;};
	var tf = confirm("마지막 스크린을 삭제 합니다.\n관련된 모든 객체는 삭제됩니다.");
	if(!tf){return false;};
	chapter.screen.splice(length-1,1);
	$("#screensView").children("option").last().remove();
	$("#screensView").children("option").last().prop("selected","selected");
	
	//画面を再設定
	changeScreen();
	
	return false;
}

//sceneを次のscreenにコピーします。
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

//scene 選択
function changeScene(element){
	console.log("sceneNum");
	//objId img と radio 区分
	//selectTarget 選択	
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
	
	//scene 選択
	$("input[name='scene']").each(function(index,sRadio){
		if($(sRadio).data("sceneNum") == $(selectTarget).data("sceneNum")){
			$(sRadio).prop('checked',true);
			return false;
		}
	});
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

//element サイズ情報
function setWHLT(target){
	
	//데이터 넣기
	$($(chapter.screen).get(screenSelector()).scene).each(function(index,scene){
		if(scene.sceneNum == $(target).data("sceneNum")){
			scene.width		= ($(target).width() / $(".fairyTale").width() * 100).toFixed(1);
			scene.height	= ($(target).height() / $(".fairyTale").height() * 100).toFixed(1);
			scene.left		= ($(target).position().left / $(".fairyTale").width() * 100).toFixed(1);
			scene.top		= ($(target).position().top / $(".fairyTale").height() * 100).toFixed(1);
			
			//scene 정보 표시
			sceneInfoSet(scene);
			return false;
		};
	});
}

//該当番号のsceneを持ってくる
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

//童話をセーブします。
function saveFairy(){
	$("#saveChapter").val(JSON.stringify(chapter));
	$("#saveObjList").val(JSON.stringify(objList));
	$("#saveExample").val(JSON.stringify(exampleBox));
	$("#saveAnwser").val(JSON.stringify(anwserBox));		
	return true;
}

// scene削除
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
	//sceneのリスト再設定
	sceneViewList();
	//objectのリスト再設定
	objViewList();
	//children green box;
	greenBox();
}


//昔の童話をロードします。
function setJson(chapterJson,objListJson,exampleJson,anwserJson){
	//오브젝트
	if(objListJson.length > 0){
		
		objList = objListJson;
		//objectのリスト再設定
		objViewList();
	}
	//보기
	if(exampleJson.length > 0){
		exampleBox = exampleJson;
	}
	//답변
	if(anwserJson.length > 0){
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
		//sceneのリスト再設定
		sceneViewList();
		//画面を再設定
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

//童話をセーブします。
function saveChapterBtn(){
	$("#saveFairy").submit();
}

//ポップアップ設定
function layer_popup(el,$element){
	// #layer수행번호
	if(el.substr(6) == 1){
		//登録
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
		//修整
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
		
		//全体削除
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
		
		//全体削除
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
		
		if(exampleCheck){
			$("#exampleBase").append("<input class='example' type='text'>");
		}
	}
	
	var $el = $(el.substr(0,6));				//레이어의 id를 $el 변수에 저장
	var isDim = $el.prev().hasClass('dimBg');	//dimmed 레이어를 감지하기 위한 boolean 변수
	
	isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();
	
	var  $elWidth  = $el.outerWidth()
	  	,$elHeight = $el.outerHeight()
	  	,docWidth  = $(document).width()
	  	,docHeight = $(document).height();
	
	// 画面の中央にレイヤーを示す
	if ($elHeight < docHeight || $elWidth < docWidth) {
	    $el.css({
	    	  marginTop : (-$elHeight/2)-55
	    	, marginLeft: -$elWidth/2
	    })
	} else {
		$el.css({top: 0, left: 0});
	}
	
	
};

//ポップアップ閉めます。
function closePop(){
	var isDim = $("#layer").prev().hasClass('dimBg');	//dimmed 레이어를 감지하기 위한 boolean 변수
	isDim ? $('.dim-layer').fadeOut() : $("#layer").fadeOut();
}
