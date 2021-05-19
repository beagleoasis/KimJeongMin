package com.cambak21.domain;

import java.util.Date;

public class MyPageReplyVO {
	private String member_id;
	private int board_no;
	private String board_category;
	private String board_title;
	private Date board_writeDate;
	private String replyBoard_content;
	private Date replyBoard_writeDate;
	private String replyBoard_isdelete;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getBoard_category() {
		return board_category;
	}
	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public Date getBoard_writeDate() {
		return board_writeDate;
	}
	public void setBoard_writeDate(Date board_writeDate) {
		this.board_writeDate = board_writeDate;
	}
	public String getReplyBoard_content() {
		return replyBoard_content;
	}
	public void setReplyBoard_content(String replyBoard_content) {
		this.replyBoard_content = replyBoard_content;
	}
	public Date getReplyBoard_writeDate() {
		return replyBoard_writeDate;
	}
	public void setReplyBoard_writeDate(Date replyBoard_writeDate) {
		this.replyBoard_writeDate = replyBoard_writeDate;
	}
	public String getReplyBoard_isdelete() {
		return replyBoard_isdelete;
	}
	public void setReplyBoard_isdelete(String replyBoard_isdelete) {
		this.replyBoard_isdelete = replyBoard_isdelete;
	}
	
	@Override
	public String toString() {
		return "MyPageReplyVO [member_id=" + member_id + ", board_no=" + board_no + ", board_category=" + board_category
				+ ", board_title=" + board_title + ", board_writeDate=" + board_writeDate + ", replyBoard_content="
				+ replyBoard_content + ", replyBoard_writeDate=" + replyBoard_writeDate + ", replyBoard_isdelete="
				+ replyBoard_isdelete + "]";
	}
	
}
