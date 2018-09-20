/**
 * Test
 */
// 랜덤 로직
function shuffle(a, b, d, e) {
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
var jone = "프로그래밍 언어를 기계어로 변환 시켜주는 프로그램은?";
var jtwo = "다음중 주석이 아닌 것은 ?";
var jthree = "자바에서 지원하는 기초 자료형으로 틀린 것은?";
var jfour = "다음 중 자바 인터페이스에 대한 설명 중 틀린 것은?";
var jfive = "다음 코드의 실행 결과 중 옳은 것은?<br>";
jfive += '<br>';
jfive += '<pre style="white-space: pre-wrap;">public class Test {<br>';
jfive += '<br>';
jfive += 'public static void main(String[] args) {<br>';
jfive += '    int[] a = { 1, 2, 3, 4, 5, 6 };<br>';
jfive += '<br>';
jfive += '    int i = a.length - 1;<br>';
jfive += '<br>';
jfive += '    while (i >= 0) {<br>';
jfive += '    System.out.println(i);<br>';
jfive += '    i--;<br>';
jfive += '  }<br>';
jfive += ' }<br>';
jfive += '}</pre>';
var jsix = "다음 클래스을 컴파일 한 후 실행 결과는?<br>";
jsix += '<br>';
jsix += '<pre style="white-space: pre-wrap;">public class Person{<br>';
jsix += '  String name = "홍길동";<br>';
jsix += '  Person(String name){<br>';
jsix += '   this.name=name;<br>';
jsix += '<br>';
jsix += ' }<br>';
jsix += '}<br>';
jsix += '<br>';
jsix += 'public class Test {<br>';
jsix += 'public static void main(String[] args) {<br>';
jsix += '    Person p1 = new Person("임꺽정");<br>';
jsix += '    Person p2 = new Person("손오공");<br>';
jsix += '<br>';
jsix += '    p1=p2;<br>';
jsix += '    System.out.println(p1.name);<br>';
jsix += ' }<br>';
jsix += '}</pre>';
var jseven = "자바에서 제공하는 package중에서 import하지 않아도 사용가능한 package는?<br>";
var jeight = "다음 예제 실행 결과는?<br>";
jeight += '<br>';
jeight += '<pre style="white-space: pre-wrap;">public class Test {<br>';
jeight += '	private static int total;<br>';
jeight += '	public static int getTotalValue(Iterator<Integer> it) {<br>';
jeight += '		while (it.hasNext()) {<br>';
jeight += '			total+=(Integer)it.next();<br>';
jeight += '		}<br>';
jeight += '		return total;<br>';
jeight += '	}<br>';
jeight += '<br>';
jeight += '	public static void main(String[] args) {<br>';
jeight += '		Set<Integer> set = new HashSet<Integer>();<br>';
jeight += '		set.add(3); set.add(2); set.add(2);<br>';
jeight += '		List<Integer> list = new ArrayList<Integer>();<br>';
jeight += '		list.add(1); list.add(2); list.add(1);<br>';
jeight += '		HashMap<String, Integer> map = new HashMap<String, Integer>();<br>';
jeight += '		map.put("n", 4);<br>';
jeight += '		map.put("c", 3);<br>';
jeight += '		map.put("s", 2);<br>';
jeight += '		map.put("n", 1);<br>';
jeight += '		getTotalValue(set.iterator());<br>';
jeight += '		getTotalValue(list.iterator());<br>';
jeight += '		getTotalValue(map.values().iterator());<br>';
jeight += '	}<br>';
jeight += '}</pre>';
var jnine = "다음이 설명하는 특징을 가진 인터페이스는?<br>";
jnine += '<br>';
jnine += '<pre style="white-space: pre-wrap;">';
jnine += "ㄱ. Key와 Value의 매핑으로 관리된다.<br>";
jnine += "ㄴ. Key는 중복 될 수 없다.<br>";
jnine += "ㄷ. Collection 인터페이스를 상속하지는 않는다.<br>";
jnine += "</pre>";
var jten = "다음은 객체 직렬화에 대한 설명이다. (ㄱ)과 (ㄴ)에 해당되는 적절한 것은?<br>";
jten += "<br>";
jten += '<pre style="white-space: pre-wrap;">';
jten += ' 객체 직렬화가 적용되기 위한 클래스는 반드시(ㄱ)인터페이스를 implements해야 한다.<br> ';
jten += '특정 변수에 저장된 데이터를 객체 직렬화 대상에서 제외되고자 할 때는 (ㄴ)키워드를 해당 변수<br> ';
jten += '앞에 명시해야 한다.';
jten += "</pre>";
var jeleven = "접근 제어자(Access Modifier)는 클래스의 변수 또는 메소들에서"
		+ "대한 접근 정도를 지정할 때 사용한다. 같은 패키지 내에서나 상복받는 경우에만 접근 할 수 있는 접근 제어자는?";
var jtwelve = "다음은  예외 처리를 위한 keyword를 설명한 것이다. 적절하지 않은 것은?";
var jthirteen = '다음은 스레드를 실행 시키기 위한 코드이다. (ㄱ)와 (ㄴ) 알맞은 것은?<br>';
jthirteen += '<br>';
jthirteen += '<pre style="white-space: pre-wrap;">public class Hello implements (ㄱ){<br>';
jthirteen += '<br>';
jthirteen += '	public void run() {<br>';
jthirteen += '		System.out.println("running");<br>';
jthirteen += '	}<br>';
jthirteen += '}<br>';
jthirteen += '<br>';
jthirteen += 'public class TestThread {<br>';
jthirteen += '<br>';
jthirteen += '	public static void main(String[] args) {<br>';
jthirteen += '		Hello h= new Hello();<br>';
jthirteen += '		Thread t = new Thread(h);<br>';
jthirteen += '		t.(ㄴ);<br>';
jthirteen += '	}<br>';
jthirteen += '}<br>';
jthirteen += "</pre>";
var jfourteen = "다음 Identifier(식별자)를 만드는 규칙으로 틀린 것은?";
var jfifteen = "다음은 특정 자바 키워드에 대한 설명이다. (ㄱ)에 해당하는 것은?<br>";
jfifteen += '<br>';
jfifteen += '<pre style="white-space: pre-wrap;">';
jfifteen += '두 개 이상의 스레드가 공유 자원에 접근하는 경우, 데이터의 일관성을 위해 (ㄱ)키워드를 이용하여<br>';
jfifteen += '특정영역에서만 단일 스레드 환경으로 실행하도록 처리할 수 있다. ';
jfifteen += '</pre>';

var jsixteen = "아래의 보기를 읽고 Compile시에 Error를 발생시키는 Statement는?<br>";
jsixteen += '<br>';
jsixteen += '<pre style="white-space: pre-wrap;">';
jsixteen += 'interface Machine{}<br>';
jsixteen += 'class Product{}<br>';
jsixteen += 'class Computer extends Product implements Machine{}<br>';
jsixteen += 'class Audio extends Product implements Machine{}<br>';
jsixteen += '</pre>';
var jseventeen = "자바에서 다음 클래스를 컴파일 한 후 실행 결과는?<br>";
jseventeen += '<br>';
jseventeen += '<pre style="white-space: pre-wrap;">';
jseventeen += 'public class Test1 {<br>';
jseventeen += '<br>';
jseventeen += '	public static void main(String[] args) {<br>';
jseventeen += '		String city = "서울";<br>';
jseventeen += '		String country = "";<br>';
jseventeen += '		switch (city) {<br>';
jseventeen += '		case "서울":<br>';
jseventeen += '		case "부산": country = "한국";<br>';
jseventeen += '		case "북경": country = "중국";<br>';
jseventeen += '		case "동경": country = "일본";<br>';
jseventeen += '			break;<br>';
jseventeen += '		default: country = "대상없음";<br>';
jseventeen += '		}<br>';
jseventeen += '		System.out.println(country);<br>';
jseventeen += '	}<br>';
jseventeen += '}';
jseventeen += '</pre>';

var jeighteen = "다음은 TCP/IP 기반 서버를 구축하기 위한 코드 일부이다. (ㄱ)과 (ㄴ) 부분에 들어갈 것을 보기에서 고르시오<br>";
jeighteen+='<br>';
jeighteen+='<pre style="white-space: pre-wrap;">';
jeighteen+=' ServerSocket serverSocket = new ServerSocket(5555);<br>';
jeighteen+=' Socket socket = serverSocket.(ㄱ);<br>';
jeighteen+=' InputStream ir = socket.getInputStream();<br>';
jeighteen+=' BufferedReader br= new BufferedReader(new (ㄴ)(ir));<br>';
jeighteen+='';
jeighteen+='</pre>';

var jninteen = "자바 언어에서 객체를 만들기 위한 틀로서 역할을 하는 것은?";
var jtwenty = "다음 중 (ㄱ) 부분에 들어갈 코드로써 틀린 것은?<br>";
jtwenty +='<br>';
jtwenty +='<pre style="white-space: pre-wrap;">';
jtwenty +='class Animal {}<br>';
jtwenty +='class Dog extends Animal {}<br>';
jtwenty +='class Poodle extends Dog {}<br>';
jtwenty +='class House {<br>';
jtwenty +='	public void register(Dog dog) {	}<br>';
jtwenty +='	public void register(double money) {}<br>';
jtwenty +='}<br>';
jtwenty +='public class Test {<br>';
jtwenty +='	public static void main(String[] args) {<br>';
jtwenty +='		House house = new House();<br>';
jtwenty +='		// (ㄱ)<br>';
jtwenty +='';
jtwenty +='</pre>';

// ////////////////// 선지 /////////////////////////
var selector1 = [ "(a) 　번역기 　", "(b)　JVM  ", "(c)　컴파일러 　", "(d)　리눅스 " ]
var selector2 = [ "(a) 　/**주석*/　", "(b)　/*주석*/　", "(c)　/*주석　", "(d)　//주석" ]
var selector3 = [ "(a) 　정수형 　", "(b)　실수형　 ", "(c)　문자형　", "(d)　참조형" ]
var selector4 = [ "(a) 인터페이스는 다중상속의 장점인 다양한 계층구조 형성을 지원한다.",
		"(b)　인터페이스는 추상 메소드와 구현부가 있는 메소드를 가질 수 있다.",
		"(c) 하나의 클래스느느 여러 개의 인터페이스를 구현 할 수 있다.",
		"(d) 인터페이스는 다른 인터페이스를 상속할 수 있다." ]
var selector5 = [ "(a) 　123456　", "(b)　65432　", "(c)　654321", "(d)　실행시 예외 발생" ]
var selector6 = [ "(a) 　홍길동 　", "(b)　임꺽정　 ", "(c)　손오공　", "(d) null" ]
var selector7 = [ "(a) 　java.lang　", "(b)　java.util　 ", "(c)　java.io　",
		"(d)　java.sql" ]
var selector8 = [ "(a) 　15　", "(b)　21　 ", "(c)　14　",
		"(d)　Map의 Key가 중복되므로 Exception이 발생한다." ]
var selector9 = [ "(a) 　Set　", "(b)　Map　 ", "(c)　List　", "(d)　Iterator" ]
var selector10 = [ "(a) 　Runnable, final　", "(b)　Runnable, transient　 ",
		"Serializable, private　", "(d)　Serializable, transient" ]
var selector11 = [ "(a) 　public　", "(b)　protected ", "(c)　private　",
		"(d)　default" ]
var selector12 = [ "(a) 　try: 예외 발생 가능성 있는 소스코드 부분이 들어가는 Keyword이다　",
		"(b)　catch : 예외처리 코드가 들어가는 Keyword이다.　 ",
		"(c)　throws: 메소드가 호출된 곳으로 예외를 던질 때 사용하는 keyword이다　",
		"(d)　finally : 예외가 발생하지 않으면 실행 되지 않는다." ]
var selector13 = [ "(a) 　Teread, run()　", "(b)　Runnanle, run()　 ",
		"(c)　Thread, start()　", "(d)　Runnanle, start()" ]
var selector14 = [ "(a) 　첫글자로 올 수 있는 것은 $ , _ , 알파벳이다　",
		"(b)　영문자를 제외하고 모두 사용 할 수 없다.　 ", "(c)　숫자는 두 번째 문자부터 가능하다.　",
		"(d)　#, %, & 와 같은 특수 문자는 사용할 수 없다" ]
var selector15 = [ "(a) 　wait　", "(b)　synchronized　 ", "(c)　transient　",
		"(d)　lock" ]
var selector16 = [ "(a) 　Product p = new Product();　",
		"(b)　Machine m = new Computer();　 ",
		"(c)　Product p1 = new Computer();　", "(d)　Computer c = new Audio();" ]
var selector17 = [ "(a) 　컴파일 에러　", "(b)　한국　 ", "(c)　일본　", "(d)　대상없음" ]
var selector18 = [ "(a) 　run(), OuputStreamWriter　", "(b)　start(), InputStreamReader　 ", "(c)　accept(), InputStreamReader　", "(d)　execute(), InpuStreamWriter" ]
var selector19 = [ "(a) 　Class　", "(b)　Instanse　 ", "(c)　Memory　", "(d)　Method" ]
var selector20 = [ "(a) 　house.register(new Poodle());　", "(b)　house.register(new Animal);　 ", "(c)　house.register(3.14);　",
		"(d)　house.register(100);" ];

// 선다형 보기
var selector = [ selector1, selector2, selector3, selector4, selector5,
		selector6, selector7, selector8, selector9, selector10, selector11,
		selector12, selector13, selector14, selector15, selector16, selector17,
		selector18, selector19, selector20 ]
// 문제
var question = [ jone, jtwo, jthree, jfour, jfive, jsix, jseven, jeight, jnine,
		jten, jeleven, jtwelve, jthirteen, jfourteen, jfifteen, jsixteen,
		jseventeen, jeighteen, jninteen, jtwenty ];
// 정답
var answer = [ 3, 3, 4, 2, 3, 3, 3, 1, 2, 4, 2, 4, 4, 2, 2, 4, 3, 3, 1, 2 ];

$(function() {

	$("#success").on("click", total)
	shuffle(question, answer, selector, answer);

	for (var i = 0; i < question.length; i++) {
		$("#" + (i + 1) + "").html((i + 1) + "。" + question[i]);
		// $("#" + (i + 101) + "").html(choose[i]);
	}
	for (var i = 0; i < selector.length; i++) {

		var result = ""
		result += '<div>';
		result += '<input type="radio" name="j' + i + '" id="j' + i
				+ '" value="1">';
		result += '<label for="j' + i + '">' + selector[i][0]
				+ '</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>';
		result += '<input type="radio" name="j' + i + '" id="j' + i
				+ '" value="2">';
		result += '<label for="j' + i + '">' + selector[i][1]
				+ '</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>';
		result += '<input type="radio" name="j' + i + '" id="j' + i
				+ '" value="3">';
		result += '<label for="j' + i + '">' + selector[i][2]
				+ '</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>';
		result += '<input type="radio" name="j' + i + '" id="j' + i
				+ '" value="4">';
		result += '<label for="j' + i + '">' + selector[i][3]
				+ '</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
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
	} else if (40 < parseInt(total) && 70 > parseInt(total)) {
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

