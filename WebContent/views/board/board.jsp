<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.dev.vo.BoardVO"%>
<%@ page import="com.dev.dao.BoardDAO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/Reminder/resources/css/bootstrap.css">

</head>
<body>
	<%@include file="../header/nav.jsp"%>
	<%
		ArrayList<BoardVO> list = (ArrayList<BoardVO>) request.getSession().getAttribute("list");
	int pageNumber = (int) session.getAttribute("pageNumber");
	BoardDAO boardDAO = new BoardDAO();
	%>
	<div class="container">
		<div>
			<p class="display-4 text-center text-danger">Schedule Sharing</p>
		</div>
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: left;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
						if (!list.isEmpty()) {
					%>
					<%
						for (int i = 0; i < list.size(); i++) {
						BoardVO board = list.get(i);
					%>
					<tr>
						<td><%=board.getBoardID()%></td>
						<td class="text-left"><a
							href="/Reminder/boardView.do?boardID=<%=board.getBoardID()%>">
								<%=board.getBoardTitle()%>
						</a></td>
						<td><%=board.getUserID()%></td>
						<td><%=board.getBoardDate()%></td>
					</tr>

					<%
						}
					} else {
					out.print("<h3>등록된 게시물이 없습니다.</h3>");
					}
					%>

				</tbody>
			</table>
			<%
				if (pageNumber != 1) {
			%>
			<a href="/Reminder/boardList.do?pageNumber=<%=pageNumber - 1%>"
				class="btn btn-success btn-arrow-left">이전</a>
			<div style="width: 10px;"></div>
			<%
				}
			if (boardDAO.nextPage(pageNumber)) {
			%>
			<a href="/Reminder/boardList.do?pageNumber=<%=pageNumber + 1%>"
				class="btn btn-success btn-arrow-left">다음</a>
			<%
				}
			%>

			<%
				if (session.isNew() || session.getAttribute("userName") != null) {
			%>
			<div style="width: 10px;"></div>
			<a class="btn btn-outline-primary" href="../board/posting.jsp"
				role="button">Posting</a>
	<% 	}%>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script src="/Reminder/resources/js/bootstrap.js"></script>
</body>
</html>