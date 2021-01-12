package com.dev.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dev.dao.BoardDAO;

import com.dev.vo.BoardVO;

public class BoardViewController implements Controller {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int boardID = 0;
		if (request.getParameter("boardID") != null) {
			boardID = Integer.parseInt(request.getParameter("boardID"));
		}
		BoardDAO boardDAO = BoardDAO.getInstance();
		BoardVO board = boardDAO.BoardView(boardID);
		System.out.println("boardVO :" + board.getBoardTitle());

		request.getSession().setAttribute("board", board);
		HttpUtil.forward(request, response, "/views/board/view.jsp");
		/* response.sendRedirect("/Reminder/views/board/view.jsp"); */

	}
}