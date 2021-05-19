package com.cambak21.domain;

public class MyBucketListVO {
	private int product_id;
	private String product_name;
	private String product_img1;
	private int bucket_sellPrice;
	private int bucket_buyQty;
	private int bucket_totBuyPrice;
	private String bucket_isChecked;
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

	public int getBucket_sellPrice() {
		return bucket_sellPrice;
	}

	public void setBucket_sellPrice(int bucket_sellPrice) {
		this.bucket_sellPrice = bucket_sellPrice;
	}

	public int getBucket_buyQty() {
		return bucket_buyQty;
	}

	public void setBucket_buyQty(int bucket_buyQty) {
		this.bucket_buyQty = bucket_buyQty;
	}

	public int getBucket_totBuyPrice() {
		return bucket_totBuyPrice;
	}

	public void setBucket_totBuyPrice(int bucket_totBuyPrice) {
		this.bucket_totBuyPrice = bucket_totBuyPrice;
	}

	public String getBucket_isChecked() {
		return bucket_isChecked;
	}

	public void setBucket_isChecked(String bucket_isChecked) {
		this.bucket_isChecked = bucket_isChecked;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	@Override
	public String toString() {
		return "MyBucketListVO [product_id=" + product_id + ", product_name=" + product_name + ", product_img1="
				+ product_img1 + ", bucket_sellPrice=" + bucket_sellPrice + ", bucket_buyQty=" + bucket_buyQty
				+ ", bucket_totBuyPrice=" + bucket_totBuyPrice + ", bucket_isChecked=" + bucket_isChecked + ", star="
				+ star + "]";
	}

}
