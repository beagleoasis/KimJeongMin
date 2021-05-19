package com.cambak21.domain;

public class BucketVO {
	private int bucket_no;
	private String member_id;
	private int pruduct_id;
	private int bucket_buyQty;
	private int bucket_sellPrice;
	private int totBuyPrice;
	private String bucket_isChecked;
	private String bucket_isDelete;
	
	public int getBucket_no() {
		return bucket_no;
	}
	public void setBucket_no(int bucket_no) {
		this.bucket_no = bucket_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getPruduct_id() {
		return pruduct_id;
	}
	public void setPruduct_id(int pruduct_id) {
		this.pruduct_id = pruduct_id;
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
	public int getTotBuyPrice() {
		return totBuyPrice;
	}
	public void setTotBuyPrice(int totBuyPrice) {
		this.totBuyPrice = totBuyPrice;
	}
	public String getBucket_isChecked() {
		return bucket_isChecked;
	}
	public void setBucket_isChecked(String bucket_isChecked) {
		this.bucket_isChecked = bucket_isChecked;
	}
	public String getBucket_isDelete() {
		return bucket_isDelete;
	}
	public void setBucket_isDelete(String bucket_isDelete) {
		this.bucket_isDelete = bucket_isDelete;
	}
	
	@Override
	public String toString() {
		return "BucketVO [bucket_no=" + bucket_no + ", member_id=" + member_id + ", pruduct_id=" + pruduct_id
				+ ", bucket_buyQty=" + bucket_buyQty + ", bucket_sellPrice=" + bucket_sellPrice + ", totBuyPrice="
				+ totBuyPrice + ", bucket_isChecked=" + bucket_isChecked + ", bucket_isDelete=" + bucket_isDelete + "]";
	}
	
	
}
