<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:200" rel="stylesheet">
<link rel="stylesheet" href="/Reminder/resources/css/style.css">
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
	   <span class="js-weather"></span>

    <div class="js-clock">
        <h1 class="clock">00:00</h1>
    </div>
    
 

    <form class="js-TodoForm">
        <input type="text" placeholder=" Write here!"  class="form-input"/>
    </form>


<div class="input-group mb-3">
  <input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="basic-addon2">
  <div class="input-group-append">
    <button class="btn btn-outline-secondary" type="button">Button</button>
  </div>
</div>


    <ul class="js-TodoList"></ul>
    
<div style="text-align: center;">
   <!--  <button type="button"  onClick="location.href='Board.html'" id="btn">Board</button>
    <button type="button"  onClick="location.href='calender.html'" id="btn">Scheduler</button>
    <button type="button"  onClick="location.href='login.jsp'" id="btn">Log-Out</button>
    <button type="button" class="js-clear" id="btn">BOOM</button> -->
    <button type="button" class="btn btn-link">Link</button>
    <button type="button" class="btn btn-link">Link</button>
    <button type="button" class="btn btn-link">Link</button>
 </div>       
    <script src="/Reminder/resources/js/Clock.js"></script>
    <script src="/Reminder/resources/js/Todo.js"></script>
    <script src="/Reminder/resources/js/Weather.js"></script>
   <!--  <script src="/Reminder/resources/js/Backimg.js"></script> -->
    
    
  
</body>
</html>