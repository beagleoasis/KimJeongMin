package com.cambak21.domain;

import java.util.Date;

public class ReplyBoardVO {
	private int replyBoard_no;
	private int board_no;
	private String member_id;
	private String replyBoard_content;
	private Date replyBoard_writeDate;
	private Date replyBoard_updateDate;
	private int replyBoard_refOrder;
	private int replyBoard_step;
	private int replyBoard_ref;
	private String replyBoard_isdelete;
	
	public int getReplyBoard_no() {
		return replyBoard_no;
	}
	public void setReplyBoard_no(int replyBoard_no) {
		this.replyBoard_no = replyBoard_no;
	}
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
	public Date getReplyBoard_writeDate() {
		return replyBoard_writeDate;
	}
	public void setReplyBoard_writeDate(Date replyBoard_writeDate) {
		this.replyBoard_writeDate = replyBoard_writeDate;
	}
	public Date getReplyBoard_updateDate() {
		return replyBoard_updateDate;
	}
	public void setReplyBoard_updateDate(Date replyBoard_updateDate) {
		this.replyBoard_updateDate = replyBoard_updateDate;
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
	public int getReplyBoard_ref() {
		return replyBoard_ref;
	}
	public void setReplyBoard_ref(int replyBoard_ref) {
		this.replyBoard_ref = replyBoard_ref;
	}
	public String getReplyBoard_isdelete() {
		return replyBoard_isdelete;
	}
	public void setReplyBoard_isdelete(String replyBoard_isdelete) {
		this.replyBoard_isdelete = replyBoard_isdelete;
	}
	
	@Override
	public String toString() {
		return "ReplyBoardVO [replyBoard_no=" + replyBoard_no + ", board_no=" + board_no + ", member_id=" + member_id
				+ ", replyBoard_content=" + replyBoard_content + ", replyBoard_writeDate=" + replyBoard_writeDate
				+ ", replyBoard_updateDate=" + replyBoard_updateDate + ", replyBoard_refOrder=" + replyBoard_refOrder
				+ ", replyBoard_step=" + replyBoard_step + ", replyBoard_ref=" + replyBoard_ref
				+ ", replyBoard_isdelete=" + replyBoard_isdelete + "]";
	}
	
}
