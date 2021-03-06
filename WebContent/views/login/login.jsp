<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width" initial-scale="1">
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:200"
	rel="stylesheet">
<link rel="stylesheet" href="/Reminder/resources/css/bootstrap.css">
<link href="/Reminder/resources/css/signin.css" rel="stylesheet">
<style>
body {
	background-image:
		url('https://source.unsplash.com/category/nature/1920x1080');
	background-size: cover;
	min-height: 100vh;
	margin: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	animation: fadeIn.3s linear;
}

.login_container {
	width: 380px;
	height: 400px;
	margin: auto;
	border-radius: 30px;
	background-color: white;
	opacity: 0.9;
	box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11), 0 1px 3px
		rgba(0, 0, 0, 0.08);
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
<title>Login</title>
</head>
<body class="text-center">
	<div class="login_container">
		<form class="form-signin" action="/Reminder/memberLogin.do"
			method="post">
			${error}
			<h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
			<label for="inputEmail" class="sr-only">ID</label> <input type="text"
				id="inputEmail" class="form-control" name="ID" placeholder="Your ID"
				required autofocus>
			<!-- 잠깐만 text로 -->
			<label for="inputPassword" class="sr-only">Password</label> <input
				type="password" id="inputPassword" class="form-control"
				name="Password" placeholder="Password" required>
			<div class="checkbox mb-3">
				<label> <input type="checkbox" value="remember-me">
					Remember me
				</label>
			</div>
			<input class="btn btn-lg btn-primary btn-block" type="submit"
				value="sign" />
			<p>
				<strong>Join Us <a href="../login/account.jsp">Click
						Here</a></strong>
			<p class="mt-5 mb-3 text-muted">&copy; 2020 John</p>
		</form>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script src="/Reminder/resources/css/bootstrap.css"></script>
</body>
</html>