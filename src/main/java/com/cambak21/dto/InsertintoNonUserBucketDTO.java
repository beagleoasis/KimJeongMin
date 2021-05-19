package com.cambak21.dto;

public class InsertintoNonUserBucketDTO {
	private String nonUserBucket_ssid;
	private int product_id;
	private int nonUserBucket_no;
	private int nonUserBucket_buyQty;
	private int nonUserBucket_sellPrice;
	private int nonUserBucket_totBuyPrice;
	
	public String getNonUserBucket_ssid() {
		return nonUserBucket_ssid;
	}
	public void setNonUserBucket_ssid(String nonUserBucket_ssid) {
		this.nonUserBucket_ssid = nonUserBucket_ssid;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getNonUserBucket_no() {
		return nonUserBucket_no;
	}
	public void setNonUserBucket_no(int nonUserBucket_no) {
		this.nonUserBucket_no = nonUserBucket_no;
	}
	public int getNonUserBucket_buyQty() {
		return nonUserBucket_buyQty;
	}
	public void setNonUserBucket_buyQty(int nonUserBucket_buyQty) {
		this.nonUserBucket_buyQty = nonUserBucket_buyQty;
	}
	public int getNonUserBucket_sellPrice() {
		return nonUserBucket_sellPrice;
	}
	public void setNonUserBucket_sellPrice(int nonUserBucket_sellPrice) {
		this.nonUserBucket_sellPrice = nonUserBucket_sellPrice;
	}
	public int getNonUserBucket_totBuyPrice() {
		return nonUserBucket_totBuyPrice;
	}
	public void setNonUserBucket_totBuyPrice(int nonUserBucket_totBuyPrice) {
		this.nonUserBucket_totBuyPrice = nonUserBucket_totBuyPrice;
	}
	
	@Override
	public String toString() {
		return "InsertintoNonUserBucketDTO [nonUserBucket_ssid=" + nonUserBucket_ssid + ", product_id=" + product_id
				+ ", nonUserBucket_no=" + nonUserBucket_no + ", nonUserBucket_buyQty=" + nonUserBucket_buyQty
				+ ", nonUserBucket_sellPrice=" + nonUserBucket_sellPrice + ", nonUserBucket_totBuyPrice="
				+ nonUserBucket_totBuyPrice + "]";
	}
	
}
