package com.dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.dao.TodoDAO;
import com.dev.vo.TodoVO;

@WebServlet("/create")
public class TodoCreateServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String task = request.getParameter("todoinput");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("ID");

		TodoVO todo = new TodoVO();
		todo.setTodoContent(task);
		todo.setUserID(id);

		TodoDAO todoDAO = TodoDAO.getInstance();
		todoDAO.todoInsert(todo);

		response.sendRedirect("/Reminder/list");
	}
}
