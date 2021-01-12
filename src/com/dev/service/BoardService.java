package com.dev.service;

import java.util.ArrayList;
import com.dev.dao.BoardDAO;
import com.dev.vo.BoardVO;

public class BoardService {

	private static BoardService service = new BoardService();
	public BoardDAO dao = BoardDAO.getInstance();

	private BoardService() {
	}

	public static BoardService getInstance() {
		return service;
	}

	public void BoardInsert(BoardVO board) {
		dao.BoardInsert(board);
	}

	public ArrayList<BoardVO> BoardList(int pageNumber) {
		ArrayList<BoardVO> list = dao.BoardList(pageNumber);
		return list;
	}

}
