package com.dev.dao;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.dev.vo.TodoVO;

public class TodoDAO {
	private static TodoDAO dao = new TodoDAO();

	private TodoDAO() {
	}

	public static TodoDAO getInstance() {
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
			System.out.println("오류 발생 : " + ex);
		}
		return conn;
	}

	public void close(Connection conn, PreparedStatement ps, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception ex) {
				System.out.println("오류 발생 : " + ex);
			}
		}
		close(conn, ps);
	} // close

	public void close(Connection conn, PreparedStatement ps) {
		if (ps != null) {
			try {
				ps.close();
			} catch (Exception ex) {
				System.out.println("오류 발생 : " + ex);
			}
		}

		if (conn != null) {
			try {
				conn.close();
			} catch (Exception ex) {
				System.out.println("오류 발생 : " + ex);
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
		return ""; // 데이터베이스 오류
	}

//bbsID 게시글 번호 가져오는 함수
	public int getNext() {
		Connection conn = null;
		ResultSet rs = null;
		String SQL = "SELECT TodoID FROM Todo ORDER BY TodoID DESC";
		try {
			conn = connect();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			} else {
				return 1;// 첫 번째 게시물인 경우
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	public void todoInsert(TodoVO todos) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = connect();
			pstmt = conn.prepareStatement("INSERT INTO Todo VALUES(?, ?, ?, ?, ?)");
			pstmt.setInt(1, getNext());
			pstmt.setString(2, todos.getTodoStartDate());
			pstmt.setString(3, todos.getTodoEndDate());
			pstmt.setString(4, todos.getTodoContent());
			pstmt.setString(5, todos.getUserID());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt);
		}
	}

	public ArrayList<TodoVO> TodoList(TodoVO todos) {
		ArrayList<TodoVO> list = new ArrayList<TodoVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println(getDate().split(" ")[0]);
		try {
			conn = connect();
			pstmt = conn
					.prepareStatement("SELECT * FROM Todo WHERE userID = ? and date_format(TodoDate, '%Y-%m-%d') = ?");
			pstmt.setString(1, todos.getUserID());
			pstmt.setString(2, getDate().split(" ")[0]);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				TodoVO todolist = new TodoVO();
				todolist.setTodoID(rs.getInt(1));
				todolist.setTodoStartDate(rs.getString(2));
				todolist.setTodoContent(rs.getString(3));
				todolist.setUserID(rs.getString(4));
				list.add(todolist);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return list;
	}

	public ArrayList<TodoVO> CalendarList(TodoVO todos) {
		ArrayList<TodoVO> list = new ArrayList<TodoVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = connect();
			pstmt = conn.prepareStatement("SELECT * FROM Todo WHERE userID = ?");
			pstmt.setString(1, todos.getUserID());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				TodoVO todolist = new TodoVO();
				todolist.setTodoID(rs.getInt(1));
				todolist.setTodoStartDate(new SimpleDateFormat("yyyy-MM-dd").format(rs.getDate(2)));
				todolist.setTodoEndDate(new SimpleDateFormat("yyyy-MM-dd").format(rs.getDate(3)));
				todolist.setTodoContent(rs.getString(4));
				todolist.setUserID(rs.getString(5));
				list.add(todolist);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return list;
	}

	public void TodoDelete(int TodoID) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = connect();
			pstmt = conn.prepareStatement("DELETE FROM Todo WHERE TodoID = ?");
			pstmt.setInt(1, TodoID);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt);
		}
	}

	public void TodoUpdate(TodoVO todos) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = connect();
			pstmt = conn.prepareStatement("UPDATE Todo SET TodoContent=?, TodoStartDate=?, TodoEndDate=? WHERE TodoID=?");
			pstmt.setString(1, todos.getTodoContent());
			pstmt.setString(2, todos.getTodoStartDate());
			pstmt.setString(3, todos.getTodoEndDate());
			pstmt.setInt(4, todos.getTodoID());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt);
		}
	}
}