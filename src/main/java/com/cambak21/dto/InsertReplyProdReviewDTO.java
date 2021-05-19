package com.cambak21.dto;

public class InsertReplyProdReviewDTO {
	private int replyProdReview_no;
	private String replyProdReview_content;
	private String member_id;
	private int prodReview_no;
	private int replyProdReview_ref;
	private int replyProdReview_refOrder;
	private String replyProdReview_repMember_id;
	
	public int getReplyProdReview_no() {
		return replyProdReview_no;
	}
	public void setReplyProdReview_no(int replyProdReview_no) {
		this.replyProdReview_no = replyProdReview_no;
	}
	public String getReplyProdReview_content() {
		return replyProdReview_content;
	}
	public void setReplyProdReview_content(String replyProdReview_content) {
		this.replyProdReview_content = replyProdReview_content;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getProdReview_no() {
		return prodReview_no;
	}
	public void setProdReview_no(int prodReview_no) {
		this.prodReview_no = prodReview_no;
	}
	public int getReplyProdReview_ref() {
		return replyProdReview_ref;
	}
	public void setReplyProdReview_ref(int replyProdReview_ref) {
		this.replyProdReview_ref = replyProdReview_ref;
	}
	public int getReplyProdReview_refOrder() {
		return replyProdReview_refOrder;
	}
	public void setReplyProdReview_refOrder(int replyProdReview_refOrder) {
		this.replyProdReview_refOrder = replyProdReview_refOrder;
	}
	public String getReplyProdReview_repMember_id() {
		return replyProdReview_repMember_id;
	}
	public void setReplyProdReview_repMember_id(String replyProdReview_repMember_id) {
		this.replyProdReview_repMember_id = replyProdReview_repMember_id;
	}
	
	@Override
	public String toString() {
		return "InsertReplyProdReviewDTO [replyProdReview_no=" + replyProdReview_no + ", replyProdReview_content="
				+ replyProdReview_content + ", member_id=" + member_id + ", prodReview_no=" + prodReview_no
				+ ", replyProdReview_ref=" + replyProdReview_ref + ", replyProdReview_refOrder="
				+ replyProdReview_refOrder + ", replyProdReview_repMember_id=" + replyProdReview_repMember_id + "]";
	}
	
	
}
