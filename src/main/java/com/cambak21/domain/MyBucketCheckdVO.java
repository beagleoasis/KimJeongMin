package com.cambak21.domain;

public class MyBucketCheckdVO {
	private String member_id;
	private int bucket_no;
	private String product_name;
	private int bucket_buyQty;
	private int bucket_sellPrice;
	private int bucket_totBuyPrice;
	private int product_id;
	private String bucket_isChecked;

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getBucket_no() {
		return bucket_no;
	}

	public void setBucket_no(int bucket_no) {
		this.bucket_no = bucket_no;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getBucket_buyQty() {
		return bucket_buyQty;
	}

	public void setBucket_buyQty(int bucket_buyQty) {
		this.bucket_buyQty = bucket_buyQty;
	}

	public int getBucket_sellPrice() {
		return bucket_sellPrice;
	}

	public void setBucket_sellPrice(int bucket_sellPrice) {
		this.bucket_sellPrice = bucket_sellPrice;
	}

	public int getBucket_totBuyPrice() {
		return bucket_totBuyPrice;
	}

	public void setBucket_totBuyPrice(int bucket_totBuyPrice) {
		this.bucket_totBuyPrice = bucket_totBuyPrice;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getBucket_isChecked() {
		return bucket_isChecked;
	}

	public void setBucket_isChecked(String bucket_isChecked) {
		this.bucket_isChecked = bucket_isChecked;
	}

	@Override
	public String toString() {
		return "MyBucketCheckdY [member_id=" + member_id + ", bucket_no=" + bucket_no + ", product_name=" + product_name
				+ ", bucket_buyQty=" + bucket_buyQty + ", bucket_sellPrice=" + bucket_sellPrice
				+ ", bucket_totBuyPrice=" + bucket_totBuyPrice + ", product_id=" + product_id + ", bucket_isChecked="
				+ bucket_isChecked + "]";
	}

}
