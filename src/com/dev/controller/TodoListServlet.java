package com.dev.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.dao.TodoDAO;
import com.dev.vo.TodoVO;

@WebServlet("/list")
public class TodoListServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("ID");
		TodoDAO todoDAO = TodoDAO.getInstance();
		TodoVO todoVO = new TodoVO();
		todoVO.setUserID(id);

		ArrayList<TodoVO> todos = todoDAO.TodoList(todoVO);

		request.getSession().setAttribute("todos", todos);
		
		String address = "/Reminder/views/main/main.jsp";
		response.sendRedirect(address);
		
	}
}
