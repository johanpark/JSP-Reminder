package com.dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.dao.TodoDAO;

@WebServlet("/delete")
public class TodoDeleteServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int todoID = Integer.parseInt(request.getParameter("TodoID"));

		TodoDAO todoDAO = TodoDAO.getInstance();
		todoDAO.TodoDelete(todoID);

		response.sendRedirect("/Reminder/list");
	}
}