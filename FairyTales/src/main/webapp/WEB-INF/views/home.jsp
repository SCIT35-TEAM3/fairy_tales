<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
	<script src="${contextPath}/js/jquery-3.3.1.js"></script>
	<script>
		$(document).ready(function(){
			alert("hello https://api.jquery.com/");
			var word = "Ajax";
			$.ajax({
				 method			: 'POST'
			 	,url			: ''
				//,url			: '${contextPath}/'
				,data			: word
				,dataType		: 'text'
				,contentType	: 'application/json; charset=UTF-8'
				,success: function(response){
					alert(response);
					$("#ajaxView").append(response);
				}
			});
		})
	</script>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<p>el에서 기본 제공하는 contextPath : ${pageContext.request.contextPath}</p>

<!-- HomeController에서 Model에 속성 contextPath로 설정해서 넘김 -->
<p>JAVA에서 부터 끌고온 contextPath : ${contextPath}</p>

<h1>팀 멤버 : ${sessionScope.Team3}</h1>

<c:choose>
	<c:when test="${!empty sessionScope.Team3}">
		<h1>가능!</h1>
	</c:when>
	<c:otherwise>
		<h1>残念...................</h1>
	</c:otherwise>
</c:choose>
<div id="ajaxView"></div>

</body>
</html>
