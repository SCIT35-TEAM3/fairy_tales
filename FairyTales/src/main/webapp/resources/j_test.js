/**
 * Test
 */
function shuffle(a, b, d , e) {
	var j, x, i;
	var c, w, z;
	var l, m, n;
	var q, t, k;
	for (i = a.length; i; i -= 1) {
		j = Math.floor(Math.random() * i);
		x = a[i - 1];
		w = b[i - 1];
		m = d[i - 1];
		t = e[i - 1];
		a[i - 1] = a[j];
		b[i - 1] = b[j];
		d[i - 1] = d[j];
		e[i - 1] = e[j];
		a[j] = x;
		b[j] = w;
		d[j] = m;
		e[j] = t;
	}
}
// ////////////////// 문 제 /////////////////////////
var jone = "今日は<u>暇だから</u>、私が食事を作ります。";
var jtwo = "彼女がその事実を知っていたというのは<u>明らか</u>です。";
var jthree = "息子はまだ保育園__________通っています。";
var jfour = "「鈴木」という方は__________ですか。";
var jfive = "今度の旅行、__________でしたか。面白かったですか。";
var jsix = "ご飯を__________ながら新聞を読むのはよくないです。";
var jseven = "いいかばんを持っていますね。誰に__________んですか。";
var jeight = "彼はコミュニケーション<u>能力に欠けている</u>よね。";
var jnine = "<u>いまだに</u>これといっ打開策はいないようだ。";
var jten = "ボールペン<u>で</u>書いてください。";
var jeleven = "いいことでもあるのか、彼は__________嬉しそうな顔をしている。";
var jtwelve = "今回の入社試験には__________人数が集まった。";
var jthirteen = "お茶が冷めてちょっと<u>温い</u>。";
var jfourteen = "銀行はすぐ近くにありますよ。目と__________ の先です。";
var jfifteen = "景気が悪くなって失業者は増える__________。";
var jsixteen = "彼の話は 辻褄が合わず、いくら 無罪だと 主張しても、彼を__________。";
var jseventeen = "客を大事にしないこんな店には、もう二度と__________。";
var jeighteen = "勝利は我がチームが__________と思いきや、一瞬のうち逆転された。";
var jninteen = "彼は表彰状を得意__________みんなに見せていた。";
var jtwenty = "この病気では、これ以上処置ができないと言われ、転院を__________。";

//////////////////// 선지 /////////////////////////
var selector1 = ["(a) 　時間がある　","(b)　時間がない　 ","(c)　泊まれている　","(d)　急かされている"]
var selector2 = ["(a) 　ほがらか　","(b)　なだらか　","(c)　あきらか　","(d)　なめらか"]
var selector3 = ["(a) 　に　","(b)　で　 ","(c)　を　","(d)　が"]
var selector4 = ["(a) 　なに　","(b)　どなた　 ","(c)　どれ　","(d)　いくら"]
var selector5 = ["(a) 　だれ　","(b)　いくつ　 ","(c)　どう　","(d)　なに"]
var selector6 = ["(a) 　食べ　","(b)　食べる　 ","(c)　食べた　","(d)　食べて"]
var selector7 = ["(a) 　あげた　","(b)　もらった　 ","(c)　くれた　","(d)　やった"]
var selector8 = ["(a) 　能力に生かしている　","(b)　能力に優れている　 ","(c)　能力が足りない　","(d)　能力が高い"]
var selector9 = ["(a) 　既だに　","(b)　替だに　 ","(c)　然だに　","(d)　未だに"]
var selector10 = ["(a) 　レストラン<u>で</u>食事をします　","(b)　風邪<u>で</u>会社を休みました　 ","(c)　このノートは、3冊<u>で</u>500円です　","(d)　ナイフ<u>で</u>肉を切ります"]
var selector11 = ["(a) 　さも　","(b)　ひたすら　 ","(c)　そのうち　","(d)　たちまち"]
var selector12 = ["(a) 　おびただしい　","(b)　だらしない　 ","(c)　いたわしい　","(d)　おわただしい"]
var selector13 = ["(a) 　めるい　","(b)　めるい　 ","(c)　あさい　","(d)　あたたかい"]
var selector14 = ["(a) 　鼻　","(b)　口　 ","(c)　耳　","(d)　顔"]
var selector15 = ["(a) 　最後だ　","(b)　にはおよばない　 ","(c)　いっぽうだ　","(d)　とはかぎらない"]
var selector16 = ["(a) 　疑わないばかりだった　","(b)　疑わなけれではなかった　 ","(c)　うわけにはいかなかった　","(d)　疑わずにはいられなかった"]
var selector17 = ["(a) 　行くまい　","(b)　行きかねない　 ","(c)　行きやすい　","(d)　行くに決まっている"]
var selector18 = ["(a) 　ものである　","(b)　ものにした　 ","(c)　ものになる　","(d)　ものがある"]
var selector19 = ["(a) 　げに　","(b)　がちに　 ","(c)　っぽく　","(d)　らしく"]
var selector20 = ["(a) 　するまでのことだ　","(b)　することどまった　 ","(c)　禁じ得なかった　","(d)　余儀なくされた"]

//선다형 보기
var selector = [ selector1 , selector2 , selector3, selector4, selector5, selector6, selector7, selector8, selector9
	, selector10, selector11, selector12,selector13, selector14, selector15, selector16, selector17, selector18, selector19,selector20]
// 문제
var question = [ jone, jtwo, jthree, jfour, jfive, jsix, jseven, jeight, jnine,
		jten, jeleven, jtwelve, jthirteen, jfourteen, jfifteen, jsixteen,
		jseventeen, jeighteen, jninteen, jtwenty ];
// 정답
var answer = [ 1, 3, 1, 2, 3, 1, 2, 3, 4, 4,
		2, 1, 1, 1 ,3, 4, 1, 2, 1, 2 ];

$(function() {
	
	
	

	$("#success").on("click", total)
	shuffle(question, answer, selector, answer);


	
	
	for (var i = 0; i < question.length; i++) {
		$("#" + (i + 1) + "").html((i+1)+"。"+question[i]);
		//$("#" + (i + 101) + "").html(choose[i]);
	} 
	for (var i = 0; i < selector.length; i++) {
			
		var result =""
			result += '<div>';
			result += '<input type="radio" name="j'+i+'" id="j'+i+'" value="1">';
			result += '<label for="j'+i+'">'+selector[i][0]+'</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>';
			result += '<input type="radio" name="j'+i+'" id="j'+i+'" value="2">';
			result += '<label for="j'+i+'">'+selector[i][1]+'</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>';
			result += '<input type="radio" name="j'+i+'" id="j'+i+'" value="3">';
			result += '<label for="j'+i+'">'+selector[i][2]+'</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>';
			result += '<input type="radio" name="j'+i+'" id="j'+i+'" value="4">';
			result += '<label for="j'+i+'">'+selector[i][3]+'</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
			result += '</div>';
			$("#" + (i + 101) + "").html(result);
	}
	
	

})
function total() {

	var one = $('input[name="j0"]:checked').val();
	var two = $('input[name="j1"]:checked').val();
	var three = $('input[name="j2"]:checked').val();
	var four = $('input[name="j3"]:checked').val();
	var five = $('input[name="j4"]:checked').val();
	var six = $('input[name="j5"]:checked').val();
	var seven = $('input[name="j6"]:checked').val();
	var eight = $('input[name="j7"]:checked').val();
	var nine = $('input[name="j8"]:checked').val();
	var ten = $('input[name="j9"]:checked').val();
	var eleven = $('input[name="j10"]:checked').val();
	var twelve = $('input[name="j11"]:checked').val();
	var thirteen = $('input[name="j12"]:checked').val();
	var fourteen = $('input[name="j13"]:checked').val();
	var fifteen = $('input[name="j14"]:checked').val();
	var sixteen = $('input[name="j15"]:checked').val();
	var seventeen = $('input[name="j16"]:checked').val();
	var eighteen = $('input[name="j17"]:checked').val();
	var nineteen = $('input[name="j18"]:checked').val();
	var twenty = $('input[name="j19"]:checked').val();

	var arr = [ one, two, three, four, five, six, seven, eight, nine, ten,
			eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen,
			eighteen, nineteen, twenty ]
	var un = "";
	for (var i = 0; i < arr.length; i++) {
		if (arr[i] === undefined) {
			un += "[ " + (i + 1) + " ]";
		}
	}

	if (un != "") {
		un += "번째 항목을 체그하지 않았습니다.";
		alert(un);
		return false;
	}

	var total = 0;
	for (var i = 0; i < arr.length; i++) {
		if (arr[i] == answer[i]) {
			total += 5;
		} else {
			total += 0;
		}
	}

	// 점수별 레벨 확인
	alert("총점 :: " + parseInt(total));

	if (40 > parseInt(total)) {
		alert("초급");
	} else if (40 < parseInt(total) & 70 > parseInt(total)) {
		alert("중급");
	} else {
		alert("고급");
	}

	// 이동할 페이지
	location.href = "board_1to1";

	/*
	 * if (one === undefined || one === undefined || one === undefined) // 선택을
	 * 하지 않았을 경우 { } else { alert(two + "를 선택하셨습니다."); }
	 */

}
// 문제 배열, 답 배열

