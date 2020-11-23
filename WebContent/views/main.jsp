<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:200" rel="stylesheet">
<link rel ="stylesheet" href="/Reminder/resources/css/bootstrap.css">
<meta http-equiv="refresh" content="30">
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
    
</style>
<title>Reminder</title>
</head>
<body>
	<%@include file="./header/nav.jsp"%>
	   <span class="js-weather"></span>

    <div class="js-clock">
        <h1 class="clock">00:00</h1>
    </div>
    
 <form action="https://www.google.com/search" method="GET">
 	<div class="mx-auto mt-5 search-bar input-group mb-3">
 		<input name="q" type="text" class="form-control rounded-pill" placeholder="GOOGLE SEARCH" />
 	</div>
 </form>

    <form class="js-TodoForm">
        <input type="text" placeholder=" Write here!"  class="form-input"/>
    </form>




    <ul class="js-TodoList"></ul>
    
     
    <script src="/Reminder/resources/js/Clock.js"></script>
    <script src="/Reminder/resources/js/Todo.js"></script>
    <script src="/Reminder/resources/js/Weather.js"></script>

    
    
  	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" 
  			integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" 
  			crossorigin="anonymous"></script>
	<script src ="/Reminder/resources/css/bootstrap.css"></script>
</body>
</html>