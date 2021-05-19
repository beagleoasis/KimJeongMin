package com.cambak21.dto;

public class UpdateBucketBuyQtyDTO {
	private String member_id;
	private int bucket_no;
	private int bucket_totBuyPrice;
	
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
	public int getBucket_totBuyPrice() {
		return bucket_totBuyPrice;
	}
	public void setBucket_totBuyPrice(int bucket_totBuyPrice) {
		this.bucket_totBuyPrice = bucket_totBuyPrice;
	}
	
	@Override
	public String toString() {
		return "UpdateBucketBuyQtyDTO [member_id=" + member_id + ", bucket_no=" + bucket_no + ", bucket_totBuyPrice="
				+ bucket_totBuyPrice + "]";
	}
	
}
