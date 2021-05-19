package com.cambak21.domain;

public class SelectProdReviewCntnGradeVO {
	private int product_id;
	private int prodReview_no;
	private int prodReview_grade;
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getProdReview_no() {
		return prodReview_no;
	}
	public void setProdReview_no(int prodReview_no) {
		this.prodReview_no = prodReview_no;
	}
	public int getProdReview_grade() {
		return prodReview_grade;
	}
	public void setProdReview_grade(int prodReview_grade) {
		this.prodReview_grade = prodReview_grade;
	}
	
	@Override
	public String toString() {
		return "SelectProdReviewCntnGrade [product_id=" + product_id + ", prodReview_no=" + prodReview_no
				+ ", prodReview_grade=" + prodReview_grade + "]";
	}
	
}
