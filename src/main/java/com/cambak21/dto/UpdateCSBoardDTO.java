package com.cambak21.dto;

public class UpdateCSBoardDTO {
	private String board_title;
	private String board_content;
	private int board_no;

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	@Override
	public String toString() {
		return "UpdateCSBoardDTO [board_title=" + board_title + ", board_content=" + board_content + ", board_no="
				+ board_no + "]";
	}

}
