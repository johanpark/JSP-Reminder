package com.dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.dao.TodoDAO;
import com.dev.vo.TodoVO;

public class CalendarUpdateController implements Controller{
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		int todoID = Integer.parseInt(request.getParameter("todoID"));
		String todoContent = request.getParameter("todotitle");
		String todoStartDay = request.getParameter("todoStartDay");
		String todoEndDay = request.getParameter("todoEndDay");
		TodoVO todos = new TodoVO();
		todos.setTodoID(todoID);
		todos.setTodoStartDate(todoStartDay);
		todos.setTodoEndDate(todoEndDay);
		todos.setTodoContent(todoContent);
		
		TodoDAO todoDAO = TodoDAO.getInstance();
		todoDAO.TodoUpdate(todos);
		
		response.sendRedirect("/Reminder/calendarList.do");
	}

}
