package com.cambak21.domain;

import java.util.Date;

public class ReplyResellVO {
	private int replyResell_no;
	private int resellBoard_no;
	private String member_id;
	private String replyResell_content;
	private Date replyResell_writeDate;
	private Date replyResell_updateDate;
	private int replyResell_ref;
	private int replyResell_step;
	private int replyResell_refOrder;
	
	public int getReplyResell_no() {
		return replyResell_no;
	}
	public void setReplyResell_no(int replyResell_no) {
		this.replyResell_no = replyResell_no;
	}
	public int getResellBoard_no() {
		return resellBoard_no;
	}
	public void setResellBoard_no(int resellBoard_no) {
		this.resellBoard_no = resellBoard_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getReplyResell_content() {
		return replyResell_content;
	}
	public void setReplyResell_content(String replyResell_content) {
		this.replyResell_content = replyResell_content;
	}
	public Date getReplyResell_writeDate() {
		return replyResell_writeDate;
	}
	public void setReplyResell_writeDate(Date replyResell_writeDate) {
		this.replyResell_writeDate = replyResell_writeDate;
	}
	public Date getReplyResell_updateDate() {
		return replyResell_updateDate;
	}
	public void setReplyResell_updateDate(Date replyResell_updateDate) {
		this.replyResell_updateDate = replyResell_updateDate;
	}
	public int getReplyResell_ref() {
		return replyResell_ref;
	}
	public void setReplyResell_ref(int replyResell_ref) {
		this.replyResell_ref = replyResell_ref;
	}
	public int getReplyResell_step() {
		return replyResell_step;
	}
	public void setReplyResell_step(int replyResell_step) {
		this.replyResell_step = replyResell_step;
	}
	public int getReplyResell_refOrder() {
		return replyResell_refOrder;
	}
	public void setReplyResell_refOrder(int replyResell_refOrder) {
		this.replyResell_refOrder = replyResell_refOrder;
	}
	
	@Override
	public String toString() {
		return "ReplyResellVO [replyResell_no=" + replyResell_no + ", resellBoard_no=" + resellBoard_no + ", member_id="
				+ member_id + ", replyResell_content=" + replyResell_content + ", replyResell_writeDate="
				+ replyResell_writeDate + ", replyResell_updateDate=" + replyResell_updateDate + ", replyResell_ref="
				+ replyResell_ref + ", replyResell_step=" + replyResell_step + ", replyResell_refOrder="
				+ replyResell_refOrder + "]";
	}
	
	
	
}
