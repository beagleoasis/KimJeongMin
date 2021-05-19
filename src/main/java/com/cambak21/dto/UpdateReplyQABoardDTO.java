package com.cambak21.dto;

public class UpdateReplyQABoardDTO {
	private String replyBoard_content;
	private int replyBoard_no;
	
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
		return "UpdateReplyQABoardDTO [replyBoard_content=" + replyBoard_content + ", replyBoard_no=" + replyBoard_no
				+ "]";
	}
	
	
}