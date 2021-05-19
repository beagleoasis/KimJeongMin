package com.cambak21.domain;

import java.util.Date;

public class ProdReviewsLikeVO {

	private String member_id;
	private int prodReview_no;
	private Date prodReviewsLike_date;
	
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
	public Date getProdReviewsLike_date() {
		return prodReviewsLike_date;
	}
	public void setProdReviewsLike_date(Date prodReviewsLike_date) {
		this.prodReviewsLike_date = prodReviewsLike_date;
	}
	
	@Override
	public String toString() {
		return "ProdReviewsLike [member_id=" + member_id + ", prodReview_no=" + prodReview_no
				+ ", prodReviewsLike_date=" + prodReviewsLike_date + "]";
	}
	
	
}
