<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dev.vo.BoardVO"%>
<%@ page import="com.dev.dao.BoardDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:200"
	rel="stylesheet">
<link rel="stylesheet" href="/Reminder/resources/css/bootstrap.css">

<style>
body {
	background-image: url('https://source.unsplash.com/1920x1080/?post');
	background-size: cover;
	min-height: 100vh;
	margin: 0;
	align-items: center;
	animation: fadeIn.5s linear;
}

.login_container {
	width: 380px;
	height: 400px;
	margin: auto;
	border-radius: 30px;
	background-color: white;
	box-shadow: 0 4px 6px rgba(50, 50, 93, 0.11), 0 1px 3px
		rgba(0, 0, 0, 0.08);
}
</style>
<title>Edit</title>
</head>
<body class="text-center">
	${error}
	<%
		BoardVO board = (BoardVO) request.getSession().getAttribute("board");
	%>
	<div>
		<div style="padding: 20px;"></div>
		<div class="login_container">

			<div class="form_container"
				style="margin-left: 20px; margin-right: 20px">
				<form id="editor-form" action="/Reminder/boardUpdate.do"
					method="post">
					<div class="form_title_div">
						<div style="height: 10px; margin-lefr: 20px; margin-right: 20px"></div>
						<p class="form_title_p h3 mb-3 font-weight-normal">Edit</p>
					</div>
					<div>
						<div>
							<a>Title</a>
						</div>
						<div>
							<input type="text" placeholder="Title"
								class="form_input form-control" id="editor-title-input"
								name="bbsTitle" maxlength="50"
								value="<%=board.getBoardTitle()%>" />
						</div>
						<div class="form_text_alert_padding">
							<div class="form_text_alert"></div>
						</div>
					</div>
					<div>
						<div>
							<label for="exampleFormControlTextarea1">Content</label>
							<textarea style="resize: none;" class="form_input form-control"
								id="editor-content-input" rows="6" placeholder="Enter content"
								name="bbsContent" maxlength="2048"><%=board.getBoardContent()%></textarea>
						</div>
						<div class="form_text_alert_padding">
							<div class="form_text_alert"></div>
						</div>
					</div>
					<div style="height: 10px;"></div>
					<input type="hidden" name="boardID"
						value="<%=board.getBoardID()%>" />
					<button class="form_submit_button btn btn-lg btn-danger btn-block"
						type="submit">Edit</button>

				</form>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script src="/Reminder/resources/js/bootstrap.js"></script>
</body>
</html>