package com.dev.dao;

import java.sql.*;
import com.dev.vo.BoardVO;
import java.util.ArrayList;

public class BoardDAO {
	private static BoardDAO dao = new BoardDAO();

	public BoardDAO() {
	}

	public static BoardDAO getInstance() {
		return dao;
	}

	public Connection connect() {
		Connection conn = null;
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(
					"jdbc:mariadb://gsitm-intern2020.c5tdqadv8vmd.ap-northeast-2.rds.amazonaws.com/it1454", "it1454",
					"it1454");
		} catch (Exception ex) {
			System.out.println("���� �߻� : " + ex);
		}
		return conn;
	}

	public void close(Connection conn, PreparedStatement ps, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception ex) {
				System.out.println("���� �߻� : " + ex);
			}
		}
		close(conn, ps);
	} // close

	public void close(Connection conn, PreparedStatement ps) {
		if (ps != null) {
			try {
				ps.close();
			} catch (Exception ex) {
				System.out.println("���� �߻� : " + ex);
			}
		}

		if (conn != null) {
			try {
				conn.close();
			} catch (Exception ex) {
				System.out.println("���� �߻� : " + ex);
			}
		}
	} // close

	public String getDate() {
		Connection conn = null;
		ResultSet rs = null;
		String SQL = "SELECT NOW()";
		try {
			conn = connect();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // �����ͺ��̽� ����
	}

	// bbsID �Խñ� ��ȣ �������� �Լ�
	public int getNext() {
		Connection conn = null;
		ResultSet rs = null;
		String SQL = "SELECT boardID FROM BBS ORDER BY boardID DESC";
		try {
			conn = connect();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			} else {
				return 1;// ù ��° �Խù��� ���
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}

	// ������ ���� �ۼ��ϴ� �Լ�
	public void BoardInsert(BoardVO board) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = connect();
			pstmt = conn.prepareStatement("INSERT INTO BBS VALUES(?, ?, ?, ?, ?, ?)");
			pstmt.setInt(1, getNext());
			pstmt.setString(2, board.getBoardTitle());
			pstmt.setString(3, board.getUserID());
			pstmt.setString(4, getDate());
			pstmt.setString(5, board.getBoardContent());
			pstmt.setInt(6, 1);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt);
		}

	}

	// �Խ��� �� ���
	public ArrayList<BoardVO> BoardList(int pageNumber) {
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardVO board = null;
		try {
			conn = connect();
			pstmt = conn.prepareStatement(
					"SELECT * FROM BBS WHERE boardID < ? AND boardAvailable = 1 ORDER BY boardID DESC LIMIT 10");
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				board = new BoardVO();
				board.setBoardID(rs.getInt(1));
				board.setBoardTitle(rs.getString(2));
				board.setUserID(rs.getString(3));
				board.setBoardDate(rs.getString(4));
				board.setBoardContent(rs.getString(5));
				board.setBoardAvailable(rs.getInt(6));
				list.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return list;
	}

	public boolean nextPage(int pageNumber) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		try {
			conn = connect();
			pstmt = conn.prepareStatement(
					"SELECT * FROM BBS WHERE boardID < ? AND boardAvailable = 1 ORDER BY boardID DESC LIMIT 10");
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public BoardVO BoardView(int boardID) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardVO board = new BoardVO();
		try {
			conn = connect();
			pstmt = conn.prepareStatement("SELECT * FROM BBS WHERE boardID =?");
			pstmt.setInt(1, boardID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				board.setBoardID(rs.getInt(1));
				board.setBoardTitle(rs.getString(2));
				board.setUserID(rs.getString(3));
				board.setBoardDate(rs.getString(4));
				board.setBoardContent(rs.getString(5));
				board.setBoardAvailable(rs.getInt(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return board;
	}

	// �� ����
	public int BoardUpdate(BoardVO board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = connect();
			pstmt = conn.prepareStatement("UPDATE BBS SET boardTitle=?, boardContent=? WHERE boardID =?");
			pstmt.setString(1, board.getBoardTitle());
			pstmt.setString(2, board.getBoardContent());
			pstmt.setInt(3, board.getBoardID());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int BoardDelete(int boardID) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = connect();
			pstmt = conn.prepareStatement("UPDATE BBS SET boardAvailable = 0 WHERE boardID =?");
			pstmt.setInt(1, boardID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

}
