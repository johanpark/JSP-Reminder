package com.dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.dao.BoardDAO;
import com.dev.vo.BoardVO;

public class BoardUpdateController implements Controller {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String title = request.getParameter("bbsTitle");
		String content = request.getParameter("bbsContent");
		int boardID = Integer.parseInt(request.getParameter("boardID"));

		if (title.isEmpty() || content.isEmpty()) {
			request.setAttribute("error", "모든 항목을 빠짐없이 입력해주시기 바랍니다!");
			HttpUtil.forward(request, response, "../board/update.jsp");
			return;
		}
		BoardVO board = new BoardVO();
		board.setBoardTitle(title);
		board.setBoardContent(content);
		board.setBoardID(boardID);

		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.BoardUpdate(board);

		/* request.setAttribute("board", board); */
		response.sendRedirect("/Reminder/boardList.do");
	}
}