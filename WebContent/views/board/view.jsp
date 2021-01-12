<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dev.vo.BoardVO"%>
<%@ page import="com.dev.dao.BoardDAO"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/Reminder/resources/css/bootstrap.css">
<title>View</title>
</head>
<body>
	<!-- navbar 출력 -->
	<%@include file="../header/nav.jsp"%>

	<%
	String ID = (String) session.getAttribute("ID");
	BoardVO board = (BoardVO) request.getSession().getAttribute("board");
	String boardNum = board.getUserID();
	request.getSession().setAttribute("updIdx", boardNum);
	%>
	<div style="height: 30px;"></div>
	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3"
							style="background-color: #eeeeee; text-align: center;">View</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">Title</td>
						<td colspan="2"><%=board.getBoardTitle()%></td>
					</tr>
					<tr>
						<td>Writer</td>
						<td colspan="2"><%=board.getUserID()%></td>
					</tr>
					<tr>
						<td>Date</td>
						<td colspan="2"><%=board.getBoardDate()%></td>
					</tr>
					<tr>
						<td>Content</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><%=board.getBoardContent()%></td>
					</tr>
				</tbody>
			</table>
			<a href="/Reminder/boardList.do" class="btn btn-primary">List</a>
			<div style="width: 10px;"></div>
			<%
				//글작성자 본인일시 수정 삭제 가능 
			if (ID != null && ID.equals(board.getUserID())) {
			%>
			<a
				href="/Reminder/views/board/update.jsp?boardID=<%=board.getBoardID()%>"
				class="btn btn-primary">Edit</a> 
			<div style="width: 10px;"></div>
			<a
				onclick="return confirm('Are you sure delete this?')"
				href="/Reminder/boardDelete.do?boardID=<%=board.getBoardID()%>"
				class="btn btn-danger">Delete</a>
			<%
				}
			%>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous">
		
	</script>
	<script src="/Reminder/resources/js/bootstrap.js"></script>
</body>
</html>