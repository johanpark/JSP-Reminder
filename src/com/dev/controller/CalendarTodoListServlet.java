package com.dev.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.dao.TodoDAO;
import com.dev.vo.TodoVO;

public class CalendarTodoListServlet implements Controller{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println((String)request.getParameter("dateform")+"¿Ã∞≈ ∂ﬂ∏È ø‰«—¿Ã ≈±Ÿ");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("ID");
		String date =(String)request.getParameter("dateform");
		TodoDAO todoDAO = TodoDAO.getInstance();
		TodoVO todoVO = new TodoVO();
		todoVO.setUserID(id);
		
		System.out.println("haha");
		/* ArrayList<TodoVO> calendartodos = todoDAO.TodoCalendarList(todoVO); */
		
		
		/* request.getSession().setAttribute("calendartodos", calendartodos); */
		String address = "/Reminder/views/calendar/calendar.jsp";
		response.sendRedirect(address);
	}
	
}
