package com.dev.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.dao.TodoDAO;
import com.dev.vo.TodoVO;

public class CalendarListController  implements Controller{
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("ID");
		TodoDAO todoDAO = TodoDAO.getInstance();
		TodoVO todoVO = new TodoVO();
		todoVO.setUserID(id);
		ArrayList<TodoVO> calendartodos = todoDAO.CalendarList(todoVO);
		request.setAttribute("calendartodos", calendartodos);
		HttpUtil.forward(request, response, "/views/calendar/fullcalendar.jsp");
	}
}
