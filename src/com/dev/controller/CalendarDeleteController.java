package com.dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.dao.TodoDAO;

public class CalendarDeleteController implements Controller{
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		int todoID = Integer.parseInt(request.getParameter("todoID"));
		TodoDAO todoDAO = TodoDAO.getInstance();
		todoDAO.TodoDelete(todoID);
		response.sendRedirect("/Reminder/calendarList.do");
	}
}
