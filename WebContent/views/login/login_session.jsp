<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dev.vo.MemberVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		MemberVO user = (MemberVO) request.getAttribute("MemberVO");

	session.setAttribute("ID", user.getUserID());
	session.setAttribute("userName", user.getUserName());

	response.sendRedirect("/Reminder/list");
	%>
</body>
</html>