package com.cambak21.domain;

public class GetReplyInfo {
	private String member_id;
	private int replyBoard_ref;
	private int replyBoard_refOrder;
	private int replyBoard_step;
	private int board_no;

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getReplyBoard_ref() {
		return replyBoard_ref;
	}

	public void setReplyBoard_ref(int replyBoard_ref) {
		this.replyBoard_ref = replyBoard_ref;
	}

	public int getReplyBoard_refOrder() {
		return replyBoard_refOrder;
	}

	public void setReplyBoard_refOrder(int replyBoard_refOrder) {
		this.replyBoard_refOrder = replyBoard_refOrder;
	}

	public int getReplyBoard_step() {
		return replyBoard_step;
	}

	public void setReplyBoard_step(int replyBoard_step) {
		this.replyBoard_step = replyBoard_step;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	@Override
	public String toString() {
		return "GetReplyInfo [member_id=" + member_id + ", replyBoard_ref=" + replyBoard_ref + ", replyBoard_refOrder="
				+ replyBoard_refOrder + ", replyBoard_step=" + replyBoard_step + ", board_no=" + board_no + "]";
	}

}
