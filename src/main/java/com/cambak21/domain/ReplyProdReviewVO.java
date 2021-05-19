package com.cambak21.domain;

import java.util.Date;

public class ReplyProdReviewVO {
	private int replyProdReview_no;
	private int prodReview_no;
	private String member_id;
	private String replyProdReview_content;
	private Date replyProdReview_date;
	private int replyProdReview_refOrder;
	private int replyProdReview_step;
	private int replyProdReview_ref;
	private String replyProdReview_isDelete;
	private String replyProdReview_repMember_id;
	
	public int getReplyProdReview_no() {
		return replyProdReview_no;
	}
	public void setReplyProdReview_no(int replyProdReview_no) {
		this.replyProdReview_no = replyProdReview_no;
	}
	public int getProdReview_no() {
		return prodReview_no;
	}
	public void setProdReview_no(int prodReview_no) {
		this.prodReview_no = prodReview_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getReplyProdReview_content() {
		return replyProdReview_content;
	}
	public void setReplyProdReview_content(String replyProdReview_content) {
		this.replyProdReview_content = replyProdReview_content;
	}
	public Date getReplyProdReview_date() {
		return replyProdReview_date;
	}
	public void setReplyProdReview_date(Date replyProdReview_date) {
		this.replyProdReview_date = replyProdReview_date;
	}
	public int getReplyProdReview_refOrder() {
		return replyProdReview_refOrder;
	}
	public void setReplyProdReview_refOrder(int replyProdReview_refOrder) {
		this.replyProdReview_refOrder = replyProdReview_refOrder;
	}
	public int getReplyProdReview_step() {
		return replyProdReview_step;
	}
	public void setReplyProdReview_step(int replyProdReview_step) {
		this.replyProdReview_step = replyProdReview_step;
	}
	public int getReplyProdReview_ref() {
		return replyProdReview_ref;
	}
	public void setReplyProdReview_ref(int replyProdReview_ref) {
		this.replyProdReview_ref = replyProdReview_ref;
	}
	public String getReplyProdReview_isDelete() {
		return replyProdReview_isDelete;
	}
	public void setReplyProdReview_isDelete(String replyProdReview_isDelete) {
		this.replyProdReview_isDelete = replyProdReview_isDelete;
	}
	public String getReplyProdReview_repMember_id() {
		return replyProdReview_repMember_id;
	}
	public void setReplyProdReview_repMember_id(String replyProdReview_repMember_id) {
		this.replyProdReview_repMember_id = replyProdReview_repMember_id;
	}
	
	@Override
	public String toString() {
		return "ReplyProdReviewVO [replyProdReview_no=" + replyProdReview_no + ", prodReview_no=" + prodReview_no
				+ ", member_id=" + member_id + ", replyProdReview_content=" + replyProdReview_content
				+ ", replyProdReview_date=" + replyProdReview_date + ", replyProdReview_refOrder="
				+ replyProdReview_refOrder + ", replyProdReview_step=" + replyProdReview_step + ", replyProdReview_ref="
				+ replyProdReview_ref + ", replyProdReview_isDelete=" + replyProdReview_isDelete
				+ ", replyProdReview_repMember_id=" + replyProdReview_repMember_id + "]";
	}
	
	
	
}
