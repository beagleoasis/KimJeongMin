package com.cambak21.domain;

import java.util.Date;

public class ProdQAsLikeVO {
	private String member_id;
	private int prodQA_no;
	private Date prodQAsLike_date;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getProdQA_no() {
		return prodQA_no;
	}
	public void setProdQA_no(int prodQA_no) {
		this.prodQA_no = prodQA_no;
	}
	public Date getProdQAsLike_date() {
		return prodQAsLike_date;
	}
	public void setProdQAsLike_date(Date prodQAsLike_date) {
		this.prodQAsLike_date = prodQAsLike_date;
	}
	
	@Override
	public String toString() {
		return "ProdQALikeVO [member_id=" + member_id + ", prodQA_no=" + prodQA_no + ", prodQAsLike_date="
				+ prodQAsLike_date + "]";
	}
	
}
