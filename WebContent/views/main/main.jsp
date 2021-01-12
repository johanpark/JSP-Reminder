<%@page import="com.dev.vo.BoardVO"%>
<%@page import="com.dev.vo.TodoVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:200"
	rel="stylesheet">
<link rel="stylesheet" href="/Reminder/resources/css/bootstrap.css">

<style>
@
keyframes fadeIn {from { opacity:0;
	
}

to {
	opacity: 1;
}

}
body {
	background-image:
		url('https://source.unsplash.com/category/nature/1920x1080');
	background-size: cover;
	min-height: 100vh;
	margin: 0;
	align-items: center;
	animation: fadeIn.5s linear;
	
}

ul {
	list-style: none;
}
</style>
<title>Reminder</title>
</head>
<body>
	<!-- navbar 출력 -->
	<%@include file="../header/nav.jsp"%>

	<!-- session 아이디값 가져오기 -->
	<%
		String userName = (String) session.getAttribute("userName");
	%>
	<!-- 현재 날씨 출력 -->
	
	<span class="js-weather  display-4 text-white"></span>

	<div class="js-clock">
		<!-- 현재시간 출력 -->
		<h1 class="clock display-1 text-center text-white ">00:00</h1>
	</div>

	<!-- session 아이디 존재 유무에 따른 다른 인사말 출력 -->
	<%
		if (session.getAttribute("userName") == null) {
	%>
	<h1 class="text-white text-center">Please Login!</h1>

	<%
		} else {
	%>

	<%@include file="../main/greeting.jsp"%>
	<h1 class="text-center text-white"><%=greeting + " " + userName%></h1>

	<form action="https://www.google.com/search" method="GET" target="_blank">
		<!-- Google 검색창 -->
		<div
			class="mx-auto mt-5 search-bar input-group mb-3 text-center form-group-lg"
			style="width: 500px;">
			<input name="q" type="text"
				class="form-control rounded-pill input-sm"
				placeholder="Google Search"/>
		</div>
	</form>


	<form class="js-TodoForm text-center mx-auto" style="width: 400px;"
		action="/Reminder/create" method="post">
		<!-- TodoList 입력 -->
		<input type="text" placeholder=" Write here!"
			class="form-input text form-control rounded-pill input-sm"
			name="todoinput" />
	</form>

	<%
		ArrayList<TodoVO> todolist = (ArrayList<TodoVO>) request.getSession().getAttribute("todos");
	for (int i = 0; i < todolist.size(); i++) {
		TodoVO todoVO = todolist.get(i);
	%>
	<ul class="text-center text-light">
		<li class="h3"><%=todoVO.getTodoContent()%><a
			href="/Reminder/delete?TodoID=<%=todoVO.getTodoID()%>"
			class="text-danger"><i class="fas fa-trash-alt fa-lg"></i></a></li>
	</ul>
	<%
		}
	}
	%>

	<script src="/Reminder/resources/js/Clock.js"></script>
	<script src="/Reminder/resources/js/Weather.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous">
	</script>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script src="/Reminder/resources/js/bootstrap.js"></script>
</body>
</html>