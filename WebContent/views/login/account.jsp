<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width" initial-scale="1">
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:200" rel="stylesheet">
<link rel ="stylesheet" href="/Reminder/resources/css/bootstrap.css">
<link href="/Reminder/resources/css/signin.css" rel="stylesheet">
 <style>
  body{
      background-image: url('https://source.unsplash.com/category/nature/1920x1080');
      background-size: cover;
      min-height:100vh;
      margin:0;
      display: flex;
      justify-content: center;
      align-items: center;
      animation: fadeIn.3s linear; 
    }
    .login_container{
    width: 500px; 
    height: 550px; 
    margin: auto; 
    border-radius: 30px;
    background-color : white;
    opacity: 0.9;
    box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11), 0 1px 3px rgba(0, 0, 0, 0.08);
}
    
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
     
    </style>
<title>Account</title>
</head>
<body class="text-center">
<div class ="login_container">
  <form class="form-signin" action="/Reminder/memberInsert.do"  method="post">
  <h1 class="h3 mb-3 font-weight-normal">With Us</h1>
  ${error}
	<label for="inputtext" class="sr-only">ID</label>
  <input type="text" id="id" class="form-control" placeholder="id" name = "userID" required>
  <br>
  <label for="inputPassword" class="sr-only">Password</label>
  <input type="password" id="Password" class="form-control" placeholder="Password"  name="userPassword"required>
  <br>
  <label for="inputPassword_valid" class="sr-only">Password_valid</label>
  <input type="password" id="password_valid" class="form-control" placeholder="Password_valid" required>
  <br>
  <label for="inputtext" class="sr-only">Name</label>
  <input type="text" id="username" class="form-control" placeholder="name" name ="userName" required>
  <br>
   <label for="inputEmail" class="sr-only">Email address</label>
  <input type="email" id="account" class="form-control" placeholder="Email address" name="userMail" required autofocus>
  <br>
  <button class="btn btn-lg btn-danger btn-block" type="submit">Create Account</button>
  <p><strong>Already have an account?<a href="../login/login.jsp">Turn back</a></strong>
  <p class="mt-5 mb-3 text-muted">&copy; 2020 John</p>
</form>
</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src ="/Reminder/resources/css/bootstrap.css"></script>
	<script type="text/javascript"> /* 유효성 검사 */
	var id = document.getElementById("id").value;
    var password = document.getElementById("password").value;
    var password_valid = document.getElementById("password_valid").value;
    var username = document.getElementById("username").value;
    var identity = document.getElementById("identity").value;
    var phone = document.getElementById("phone").value;
    var account = document.getElementById("account").value;
    
    //정규표현식
    var idReg = /^[a-z][a-z0-9]{5,11}$/g;                     
    var num = password.search(/[0-9]/g);                  
    var eng = password.search(/[a-z]/ig);
    var spe = password.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
    var usernameReg = /^[가-힣]{2,4}$/g;                        
    var identityReg = /^[0-9]{6}$/g;   
    var phoneReg = /^01[016][0-9]{3,4}[0-9]{4}$/g;
    var accountReg = /^[0-9]{5,30}$/g;                           
    
    
    if(!idReg.test(id)){
       alert("유효하지 않은 아이디입니다.");
       return false;
    }
    

    if(password.length < 8 || password.length > 20){
        alert("8자리 ~ 20자리 이내로 입력해주세요.");
       return false;
    }else if(password.search(/\s/) != -1){
        alert("비밀번호는 공백 없이 입력해주세요.");
         return false;
    }else if(num < 0 || eng < 0 || spe < 0 ){
         alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
         return false;
    }
    
    if(password != password_valid){
       alert("비밀번호가 같은지 확인해주세요.");
       return false;
    }
    
    
    if(!usernameReg.test(username)){
       alert("이름을 확인해주세요.");
       return false;
    }
    
    if(!phoneReg.test(콜)){
       alert("핸드폰 번호를 확인해주세요.");
       return false;
    }
    
    
    if(!identityReg.test(identity)){
       alert("주민등록번호 앞자리 6자리를 적어주세요.");
       return false;
    }
	</script>
</body>
</html>