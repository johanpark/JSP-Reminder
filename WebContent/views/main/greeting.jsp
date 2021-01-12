<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Date,java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Calendar cal = Calendar.getInstance();
	int h = cal.get(Calendar.HOUR_OF_DAY);
	String greeting;
	if (h < 12) {
		greeting = "Good Morning";
	} else if (h < 18) {
		greeting = "Good Afternoon";
	} else {
		greeting = "Good night";
	}
	%>
	<!-- 시간별 인사말 -->
</body>
</html>