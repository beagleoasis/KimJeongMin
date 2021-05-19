package com.cambak21.dto;

public class ProdReviewInsertDTO {

	private int product_id;
	private String member_id;
	private String prodReview_title;
	private String prodReview_content;
	private int prodReview_grade;
	private String prodReview_img;
	private int buyProduct_no;
	
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
	public String getProdReview_img() {
		return prodReview_img;
	}
	public void setProdReview_img(String prodReview_img) {
		this.prodReview_img = prodReview_img;
	}
	public int getBuyProduct_no() {
		return buyProduct_no;
	}
	public void setBuyProduct_no(int buyProduct_no) {
		this.buyProduct_no = buyProduct_no;
	}
	
	@Override
	public String toString() {
		return "ProdReviewInsertDTO [product_id=" + product_id + ", member_id=" + member_id + ", prodReview_title="
				+ prodReview_title + ", prodReview_content=" + prodReview_content + ", prodReview_grade="
				+ prodReview_grade + ", prodReview_img=" + prodReview_img + ", buyProduct_no=" + buyProduct_no + "]";
	}
	
	
}
