package com.cambak21.dto;

public class InsertAdminReviewReplyDTO {
	private int prodReview_no;
	private String member_id;
	private String replyProdReview_content;
	private int replyProdReview_refOrder;
	private int replyProdReview_ref;
	
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
	public int getReplyProdReview_refOrder() {
		return replyProdReview_refOrder;
	}
	public void setReplyProdReview_refOrder(int replyProdReview_refOrder) {
		this.replyProdReview_refOrder = replyProdReview_refOrder;
	}
	public int getReplyProdReview_ref() {
		return replyProdReview_ref;
	}
	public void setReplyProdReview_ref(int replyProdReview_ref) {
		this.replyProdReview_ref = replyProdReview_ref;
	}
	
	@Override
	public String toString() {
		return "InsertAdminReply [prodReview_no=" + prodReview_no + ", member_id=" + member_id
				+ ", replyProdReview_content=" + replyProdReview_content + ", replyProdReview_refOrder="
				+ replyProdReview_refOrder + ", replyProdReview_ref=" + replyProdReview_ref + "]";
	}
	
	
}
