<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.dev.vo.TodoVO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<title>Calendar-todo</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
	integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link rel="stylesheet" href="/Reminder/resources/css/calender.css" />
<meta charset="UTF-8" />
<style>
@keyframes fadeIn {from { opacity:0;
	
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
	padding: 0;
	margin: 0;
	align-items: center;
	z-index: -2;
	animation: fadeIn.5s linear;
}
</style>
</head>
<body>
	<%@include file="../header/nav.jsp"%>
	
	<div class="world">
		<div class="conatiner">
			<div class="container_left">
				<div>
					<div id="pointDay"></div>
					<div id="pointDate"></div>
				</div>
				
				<form action="/list" method="post">
					<input type="hidden" id="todayprint" value="" />
				</form>

				<div class="container_left_bot">
					<div class="todo-title">To do list :</div>
					<form class="js-toDoForm">
						<input type="text" placeholder="Write a to do!"
							class="add-event-day" /> <i id="deleteAll" class="fas fa-trash"></i>
					</form>
					
					<ul class="js-toDoList">
					</ul>
					
				</div>
			</div>

			<div class="container_right">
				<table id="calendar" align="center">
					<thead>
						<tr>
							<td><label onclick="prevCalendar()"><</label></td>
							<td align="center" id="monthAndYear" colspan="5"></td>
							<td><label onclick="nextCalendar()">></label></td>
						</tr>
						<tr>
							<td align="center" class="sun">Sun</td>
							<td align="center">Mon</td>
							<td align="center">Tue</td>
							<td align="center">Wed</td>
							<td align="center">Thu</td>
							<td align="center">Fri</td>
							<td align="center" class="sat">Sat</td>
						</tr>
					</thead>
					<tbody id="calendar-body"></tbody>
				</table>
			</div>
		</div>
	</div>
	<script src="/Reminder/resources/js/calender.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
		crossorigin="anonymous"></script>

</body>
</html>