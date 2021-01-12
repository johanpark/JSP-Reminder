package com.dev.vo;

public class TodoVO {
	private int TodoID;
	private String TodoStartDate;
	private String TodoEndDate;
	private String TodoContent;
	private String userID;

	public int getTodoID() {
		return TodoID;
	}

	public void setTodoID(int todoID) {
		TodoID = todoID;
	}

	public String getTodoContent() {
		return TodoContent;
	}

	public void setTodoContent(String todoContent) {
		TodoContent = todoContent;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getTodoStartDate() {
		return TodoStartDate;
	}

	public void setTodoStartDate(String todoStartDate) {
		TodoStartDate = todoStartDate;
	}

	public String getTodoEndDate() {
		return TodoEndDate;
	}

	public void setTodoEndDate(String todoEndDate) {
		TodoEndDate = todoEndDate;
	}

}
