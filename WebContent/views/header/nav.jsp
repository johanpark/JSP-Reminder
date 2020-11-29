<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
      integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
      crossorigin="anonymous"
    />
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:200" rel="stylesheet">
<link rel ="stylesheet" href="/Reminder/resources/css/bootstrap.css">
<title>Nav</title>
</head>
<body class="pt-5">
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
  <a class="navbar-brand" href="../main/main.jsp"><i class="far fa-calendar-alt">Reminder</i></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="../main/main.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="../board/board.jsp">Board</a>
      </li>
     
      <!-- 로그인 유무로 login 또는 logout버튼 생성 -->
     <%  if(session.isNew() || session.getAttribute("userName") == null){ %>
     
       <li class="nav-item">
        <a class="nav-link" href="../login/login.jsp">Login</a>
      </li>
     <%  }else{ %>
      <li class="nav-item">
        <a class="nav-link" href="../calendar/calendar.jsp">Calendar</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="../login/logout.jsp">Logout</a>
      </li>
      <%} %>
      
    </ul>
  </div>
</nav>


	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
	<script src ="/Reminder/resources/js/bootstrap.js"></script>
	<script src ="/Reminder/resources/js/bootstrap.js.map"></script>
</body>
</html>