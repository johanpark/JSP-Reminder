<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
 <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
      integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="/Reminder/resources/css/calender.css" />
</head>
  <body>
    <div class="world">
      <div class="conatiner">
        <div class="container_left">
          <div>
            <div id="pointDay"></div>
            <div id="pointDate"></div>
          </div>
          <div class="container_left_bot">
            <div class="todo-title">To do list :</div>
            <form class="js-toDoForm">
              <input
                type="text"
                placeholder="Write a to do!"
                class="add-event-day"
              />
              <i id = "deleteAll" class="fas fa-trash"></i>
            </form>
            <ul class="js-toDoList"></ul>
          </div>
        </div>
        <div class="container_right">
          <table id="calendar" align="center">
            <thead>
              <tr>
                <td><label onclick="prevCalendar();"><</label></td>
                <td align="center" id="monthAndYear" colspan="5"></td>
                <td><label onclick="nextCalendar()">> </label></td>
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
          <button type="button"  onClick="location.href='main.jsp'" id="btn">Main</button>
        </div>  
      </div>
    </div>
  
    <script src="/Reminder/resources/js/calender.js"></script>
  </body>
</html>