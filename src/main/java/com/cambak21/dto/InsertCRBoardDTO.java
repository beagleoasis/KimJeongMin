package com.cambak21.dto;

public class InsertCRBoardDTO {
	private String member_id;
	private String board_title;
	private String board_category;
	private String board_content;

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_category() {
		return board_category;
	}

	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	@Override
	public String toString() {
		return "InsertCSBoardDTO [member_id=" + member_id + ", board_title=" + board_title + ", board_category="
				+ board_category + ", board_content=" + board_content + "]";
	}

}
