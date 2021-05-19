package com.cambak21.dto;

public class ProdReviewsLikeDTO {

	private String member_id;
	private int prodReview_no;
	
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
	
	@Override
	public String toString() {
		return "ProdReviewsLikeDTO [member_id=" + member_id + ", prodReview_no=" + prodReview_no + "]";
	}
	
	
}
