package com.dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.dao.BoardDAO;

public class BoardDeleteController implements Controller {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardID = Integer.parseInt(request.getParameter("boardID"));

		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.BoardDelete(boardID);

		response.sendRedirect("/Reminder/boardList.do");
	}
}
