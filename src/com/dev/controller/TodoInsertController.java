package com.dev.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.dao.TodoDAO;
import com.dev.vo.TodoVO;

public class TodoInsertController extends HttpServlet implements Controller {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}
//	@Override
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
	/* super.doPost(request, response); */
	/*
	 * request.setCharacterEncoding("UTF-8");
	 * 
	 * // 3. 여기에 1.에서 만든 data 가 들어오는지 확인
	 * System.out.println(request.getParameter("a")); request.getSession(); String
	 * input = request.getParameter("todoinput"); String id =
	 * (String)session.getAttribute("ID");
	 * 
	 * 
	 * String[] values = request.getParameterValues("todoinput"); for(int i =0; i<
	 * values.length; i++) { System.out.println(values[i]); }
	 * 
	 * TodoVO todos = new TodoVO(); todos.setTodoContent(input);
	 * todos.setUserID(id);
	 * 
	 * TodoDAO todoDAO = TodoDAO.getInstance(); todoDAO.todoInsert(todos);
	 * response.sendRedirect("/Reminder/views/main/main.jsp"); } }
	 */
	/*
	 * public void (HttpServletRequest request, HttpServletResponse response) throws
	 * ServletException, IOException {
	 * 
	 * 
	 */

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*
		 * for (int i = 0; i < obj.length(); i++) {
		 * System.out.println(request.getParameter("obj")); }
		 */
		 System.out.println("HI");
		String reqStr = null;
		StringBuilder stringBuilder = new StringBuilder();
		BufferedReader bufferedReader = null;

		try {
		InputStream inputStream = request.getInputStream();
		if (inputStream != null) {
		bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
		char[] charBuffer = new char[128];
		int bytesRead = -1;
		while ((bytesRead = bufferedReader.read(charBuffer)) > 0) {
		stringBuilder.append(charBuffer, 0, bytesRead);
		}
		} else {
		stringBuilder.append("");
		}
		} catch (IOException ex) {
		throw ex;
		} finally {
		if (bufferedReader != null) {
		try {
		bufferedReader.close();
		} catch (IOException ex) {
		throw ex;
		}
		}
		}

		reqStr = stringBuilder.toString();
		
		System.out.println(reqStr);
	}

}