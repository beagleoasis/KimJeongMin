package com.cambak21.dto;

import java.util.Date;

public class AdminProdReviewDTO {

	private int prodReview_no;
	private int product_id;
	private String member_id;
	private String prodReview_title;
	private String prodReview_content;
	private int prodReview_grade;
	private Date prodReview_postDate;
	private String prodReview_isDelete;
	private Date prodReview_updateDate;
	private int prodReview_likeCnt;
	private int prodReview_replyCnt;
	
	
	public int getProdReview_no() {
		return prodReview_no;
	}
	public void setProdReview_no(int prodReview_no) {
		this.prodReview_no = prodReview_no;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getProdReview_title() {
		return prodReview_title;
	}
	public void setProdReview_title(String prodReview_title) {
		this.prodReview_title = prodReview_title;
	}
	public String getProdReview_content() {
		return prodReview_content;
	}
	public void setProdReview_content(String prodReview_content) {
		this.prodReview_content = prodReview_content;
	}
	public int getProdReview_grade() {
		return prodReview_grade;
	}
	public void setProdReview_grade(int prodReview_grade) {
		this.prodReview_grade = prodReview_grade;
	}
	public Date getProdReview_postDate() {
		return prodReview_postDate;
	}
	public void setProdReview_postDate(Date prodReview_postDate) {
		this.prodReview_postDate = prodReview_postDate;
	}
	public String getProdReview_isDelete() {
		return prodReview_isDelete;
	}
	public void setProdReview_isDelete(String prodReview_isDelete) {
		this.prodReview_isDelete = prodReview_isDelete;
	}
	public Date getProdReview_updateDate() {
		return prodReview_updateDate;
	}
	public void setProdReview_updateDate(Date prodReview_updateDate) {
		this.prodReview_updateDate = prodReview_updateDate;
	}
	public int getProdReview_likeCnt() {
		return prodReview_likeCnt;
	}
	public void setProdReview_likeCnt(int prodReview_likeCnt) {
		this.prodReview_likeCnt = prodReview_likeCnt;
	}
	public int getProdReview_replyCnt() {
		return prodReview_replyCnt;
	}
	public void setProdReview_replyCnt(int prodReview_replyCnt) {
		this.prodReview_replyCnt = prodReview_replyCnt;
	}
	@Override
	public String toString() {
		return "AdminProdReviewDTO [prodReview_no=" + prodReview_no + ", product_id=" + product_id + ", member_id="
				+ member_id + ", prodReview_title=" + prodReview_title + ", prodReview_content=" + prodReview_content
				+ ", prodReview_grade=" + prodReview_grade + ", prodReview_postDate=" + prodReview_postDate
				+ ", prodReview_isDelete=" + prodReview_isDelete + ", prodReview_updateDate=" + prodReview_updateDate
				+ ", prodReview_likeCnt=" + prodReview_likeCnt + ", prodReview_replyCnt=" + prodReview_replyCnt + "]";
	}
	
	
	
}
