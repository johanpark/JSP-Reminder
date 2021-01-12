package com.dev.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import javax.servlet.http.HttpServlet;

public class FrontController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	String charset = null;
	HashMap<String, Controller> list = null;

	@Override
	public void init(ServletConfig sc) throws ServletException {

		charset = sc.getInitParameter("charset");

		list = new HashMap<String, Controller>();
		list.put("/memberInsert.do", new MemberInsertController());
		list.put("/memberLogin.do", new MemberLoginController());
		list.put("/memberSearch.do", new MemberSearchController());
		list.put("/memberUpdate.do", new MemberUpdateController());

		/* ------------------------------------------------------------ */

		list.put("/boardInsert.do", new BoardInsertController());
		list.put("/boardList.do", new BoardListController());
		list.put("/boardView.do", new BoardViewController());
		list.put("/boardUpdate.do", new BoardUpdateController());
		list.put("/boardDelete.do", new BoardDeleteController());
		
		/* ------------------------------------------------------------ */
		
		list.put("/calendarList.do", new CalendarListController());
		list.put("/calendarInput.do", new CalendarInputController());
		list.put("/calendarDelete.do", new CalendarDeleteController());
		list.put("/calendarUpdate.do", new CalendarUpdateController());

	}

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding(charset);

		String url = request.getRequestURI();
		String contextPath = request.getContextPath();
		String path = url.substring(contextPath.length());
		Controller subController = list.get(path);
		subController.execute(request, response);
	}
}
