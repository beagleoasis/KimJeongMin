package com.cambak21.domain;

public class SearchProductVO {
	private int product_id;
	private String product_name;
	private int product_sellPrice;
	private int prodReview_grade;
	private int prodReview_no;
	private String product_img1;
	private String product_show;
	private int mainCategory_id;
	private String buyProduct_isFinished;
	private int buyProduct_qty;
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_sellPrice() {
		return product_sellPrice;
	}
	public void setProduct_sellPrice(int product_sellPrice) {
		this.product_sellPrice = product_sellPrice;
	}
	public int getProdReview_grade() {
		return prodReview_grade;
	}
	public void setProdReview_grade(int prodReview_grade) {
		this.prodReview_grade = prodReview_grade;
	}
	public int getProdReview_no() {
		return prodReview_no;
	}
	public void setProdReview_no(int prodReview_no) {
		this.prodReview_no = prodReview_no;
	}
	public String getProduct_img1() {
		return product_img1;
	}
	public void setProduct_img1(String product_img1) {
		this.product_img1 = product_img1;
	}
	public String getProduct_show() {
		return product_show;
	}
	public void setProduct_show(String product_show) {
		this.product_show = product_show;
	}
	public int getMainCategory_id() {
		return mainCategory_id;
	}
	public void setMainCategory_id(int mainCategory_id) {
		this.mainCategory_id = mainCategory_id;
	}
	public String getBuyProduct_isFinished() {
		return buyProduct_isFinished;
	}
	public void setBuyProduct_isFinished(String buyProduct_isFinished) {
		this.buyProduct_isFinished = buyProduct_isFinished;
	}
	public int getBuyProduct_qty() {
		return buyProduct_qty;
	}
	public void setBuyProduct_qty(int buyProduct_qty) {
		this.buyProduct_qty = buyProduct_qty;
	}
	
	@Override
	public String toString() {
		return "SearchProductVO [product_id=" + product_id + ", product_name=" + product_name + ", product_sellPrice="
				+ product_sellPrice + ", prodReview_grade=" + prodReview_grade + ", prodReview_no=" + prodReview_no
				+ ", product_img1=" + product_img1 + ", product_show=" + product_show + ", mainCategory_id="
				+ mainCategory_id + ", buyProduct_isFinished=" + buyProduct_isFinished + ", buyProduct_qty="
				+ buyProduct_qty + "]";
	}
	
	
	
	
}
