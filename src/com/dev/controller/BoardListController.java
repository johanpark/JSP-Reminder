package com.dev.controller;

import java.io.*;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.http.*;
import com.dev.service.BoardService;
import com.dev.vo.BoardVO;
import com.dev.dao.BoardDAO;

public class BoardListController implements Controller {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardService service = BoardService.getInstance();

		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		/* this.dao.nextPage(pageNumber); */
		ArrayList<BoardVO> list = service.BoardList(pageNumber);

		request.getSession().setAttribute("list", list);
		request.getSession().setAttribute("pageNumber", pageNumber);
		/*
		 * HttpUtil.forward(request, response, "/views/board/board.jsp");
		 */
		response.sendRedirect("/Reminder/views/board/board.jsp");
	}
}
