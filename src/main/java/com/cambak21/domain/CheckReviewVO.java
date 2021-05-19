package com.cambak21.domain;

public class CheckReviewVO {
	private String payment_isComit;
	private String payment_isChecked;
	private String member_id;
	private String buyProduct_no;
	public String getPayment_isComit() {
		return payment_isComit;
	}
	public void setPayment_isComit(String payment_isComit) {
		this.payment_isComit = payment_isComit;
	}
	public String getPayment_isChecked() {
		return payment_isChecked;
	}
	public void setPayment_isChecked(String payment_isChecked) {
		this.payment_isChecked = payment_isChecked;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getBuyProduct_no() {
		return buyProduct_no;
	}
	public void setBuyProduct_no(String buyProduct_no) {
		this.buyProduct_no = buyProduct_no;
	}
	@Override
	public String toString() {
		return "CheckReviewVO [payment_isComit=" + payment_isComit + ", payment_isChecked=" + payment_isChecked
				+ ", member_id=" + member_id + ", buyProduct_no=" + buyProduct_no + "]";
	}
	
	
}
