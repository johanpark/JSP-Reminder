<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:200" rel="stylesheet">
<link rel ="stylesheet" href="/Reminder/resources/css/bootstrap.css">

<style>
 @keyframes fadeIn{
    from{
        opacity: 0;
    }
    to{
        opacity: 1;
    }
} 

  body{
      background-image: url('https://source.unsplash.com/category/nature/1920x1080');
      background-size: cover;
      min-height:100vh;
      margin:0;
      align-items: center;
      animation: fadeIn.5s linear; 
    }
    ul{
   list-style:none;
   }
</style>
<title>Reminder</title>
</head>
<body>
<%@include file="../header/nav.jsp"%> <!-- navbar 출력 -->

<!-- session 아이디값 가져오기 -->
<%
String userName = (String)session.getAttribute("userName"); 
%>
		<!-- 현재 날씨 출력 -->
	   <span class="js-weather  display-4 text-white"></span>

    <div class="js-clock"><!-- 현재시간 출력 -->
        <h1 class="clock display-1 text-center text-white ">00:00</h1>
    </div>
    
    <!-- session 아이디 존재 유무에 따른 다른 인사말 출력 -->
     <%  if(session.isNew() || session.getAttribute("userName") == null){ %>
     <h1 class="text-white text-center">Please Login!</h1>
     <%  }else{ %>
     
		<%@include file="../main/greeting.jsp"%>    
		<h1 class="text-center text-white"><%=greeting +" " +userName %></h1>
		
 <form action="https://www.google.com/search" method="GET"> <!-- Google 검색창 -->
 	<div class="mx-auto mt-5 search-bar input-group mb-3 text-center form-group-lg" style="width:500px;">
 		<input  name="q" type="text" class="form-control rounded-pill input-sm" placeholder="Google Search" />
 	</div>
 </form>

    <form class="js-TodoForm text-center mx-auto" style="width:400px;"> <!-- TodoList 입력 -->
        <input type="text" placeholder=" Write here!"  class="form-input text form-control rounded-pill input-sm"/>
    </form>

	 <%} %>

	<div class="text-center text-white"> <!-- TodoList 출력 -->
    <ul class="js-TodoList"></ul>
    </div>
   
 
    <script src="/Reminder/resources/js/Clock.js"></script>
    <script src="/Reminder/resources/js/Todo.js"></script>
    <script src="/Reminder/resources/js/Weather.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" 
  			integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" 
  			crossorigin="anonymous"></script>
	<script src ="/Reminder/resources/js/bootstrap.js"></script>
</body>
</html>