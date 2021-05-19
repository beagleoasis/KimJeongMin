package com.cambak21.dto;

public class InsertReplyCRBoardDTO {
	private int board_no;
	private String member_id;
	private String replyBoard_content;
	private int replyBoard_no;

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getReplyBoard_content() {
		return replyBoard_content;
	}

	public void setReplyBoard_content(String replyBoard_content) {
		this.replyBoard_content = replyBoard_content;
	}

	public int getReplyBoard_no() {
		return replyBoard_no;
	}

	public void setReplyBoard_no(int replyBoard_no) {
		this.replyBoard_no = replyBoard_no;
	}

	@Override
	public String toString() {
		return "InsertReplyCSBoardDTO [board_no=" + board_no + ", member_id=" + member_id + ", replyBoard_content="
				+ replyBoard_content + ", replyBoard_no=" + replyBoard_no + "]";
	}

}
