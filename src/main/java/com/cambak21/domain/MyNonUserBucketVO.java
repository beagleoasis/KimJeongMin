package com.cambak21.domain;

public class MyNonUserBucketVO {
	private int product_id;
	private String product_name;
	private String product_img1;
	private int nonUserBucket_sellPrice;
	private int nonUserBucket_buyQty;
	private int nonUserBucket_totBuyPrice;
	private String nonUserBucket_isChecked;
	private int star;
	
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
	public String getProduct_img1() {
		return product_img1;
	}
	public void setProduct_img1(String product_img1) {
		this.product_img1 = product_img1;
	}
	public int getNonUserBucket_sellPrice() {
		return nonUserBucket_sellPrice;
	}
	public void setNonUserBucket_sellPrice(int nonUserBucket_sellPrice) {
		this.nonUserBucket_sellPrice = nonUserBucket_sellPrice;
	}
	public int getNonUserBucket_buyQty() {
		return nonUserBucket_buyQty;
	}
	public void setNonUserBucket_buyQty(int nonUserBucket_buyQty) {
		this.nonUserBucket_buyQty = nonUserBucket_buyQty;
	}
	public int getNonUserBucket_totBuyPrice() {
		return nonUserBucket_totBuyPrice;
	}
	public void setNonUserBucket_totBuyPrice(int nonUserBucket_totBuyPrice) {
		this.nonUserBucket_totBuyPrice = nonUserBucket_totBuyPrice;
	}
	public String getNonUserBucket_isChecked() {
		return nonUserBucket_isChecked;
	}
	public void setNonUserBucket_isChecked(String nonUserBucket_isChecked) {
		this.nonUserBucket_isChecked = nonUserBucket_isChecked;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	@Override
	public String toString() {
		return "MyNonUserBucketVO [product_id=" + product_id + ", product_name=" + product_name + ", product_img1="
				+ product_img1 + ", nonUserBucket_sellPrice=" + nonUserBucket_sellPrice + ", nonUserBucket_buyQty="
				+ nonUserBucket_buyQty + ", nonUserBucket_totBuyPrice=" + nonUserBucket_totBuyPrice
				+ ", nonUserBucket_isChecked=" + nonUserBucket_isChecked + ", star=" + star + "]";
	}
	
}
