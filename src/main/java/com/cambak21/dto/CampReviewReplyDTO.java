package com.cambak21.dto;

public class CampReviewReplyDTO {
	private int board_no;
	private String member_id;
	private String replyBoard_content;
	private int replyBoard_ref;
	
	public int getBoard_no() {
		return board_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public String getReplyBoard_content() {
		return replyBoard_content;
	}
	public int getReplyBoard_ref() {
		return replyBoard_ref;
	}
	
	@Override
	public String toString() {
		return "CamBoardTipReplyDTO [board_no=" + board_no + ", member_id=" + member_id + ", replyBoard_content="
				+ replyBoard_content + ", replyBoard_ref=" + replyBoard_ref + "]";
	}
}
