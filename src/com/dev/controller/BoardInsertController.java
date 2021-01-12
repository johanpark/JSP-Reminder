package com.dev.controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dev.service.BoardService;
import com.dev.vo.BoardVO;

public class BoardInsertController implements Controller {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("ID");
		String title = request.getParameter("bbsTitle");
		String content = request.getParameter("bbsContent");

		if (title.isEmpty() || content.isEmpty()) {
			request.setAttribute("error", "모든 항목을 빠짐없이 입력해주시기 바랍니다!");
			HttpUtil.forward(request, response, "../board/posting.jsp");
			return;
		}
		BoardVO board = new BoardVO();
		board.setBoardTitle(title);
		board.setBoardContent(content.replace("\r\n", "<br>"));
		board.setUserID(id);

		BoardService service = BoardService.getInstance();
		service.BoardInsert(board);
		response.sendRedirect("/Reminder/boardList.do");
		/* HttpUtil.forward(request, response, "/views/board/board.jsp"); */
	}
}
