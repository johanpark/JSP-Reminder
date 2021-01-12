package com.dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.dao.TodoDAO;
import com.dev.vo.TodoVO;

public class CalendarInputController implements Controller{
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String task = request.getParameter("todoinput");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("ID");
		String startDay =request.getParameter("startday");
		String endDay =request.getParameter("endday");
		TodoVO todo = new TodoVO();
		todo.setTodoContent(task);
		todo.setUserID(id);
		todo.setTodoStartDate(startDay);
		todo.setTodoEndDate(endDay);
		

		TodoDAO todoDAO = TodoDAO.getInstance();
		todoDAO.todoInsert(todo);
		
		String address = "/Reminder/calendarList.do";
		response.sendRedirect(address);
}
	}
