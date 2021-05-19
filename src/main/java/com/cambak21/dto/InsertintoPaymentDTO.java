package com.cambak21.dto;

public class InsertintoPaymentDTO {
	private int payment_no;
	private String member_id;
	private int payInfo_no;
	private int destination_no;
	private int buyProduct_no;
	private String payment_deliveryMsg;
	
	public int getPayment_no() {
		return payment_no;
	}
	public void setPayment_no(int payment_no) {
		this.payment_no = payment_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getPayInfo_no() {
		return payInfo_no;
	}
	public void setPayInfo_no(int payInfo_no) {
		this.payInfo_no = payInfo_no;
	}
	public int getDestination_no() {
		return destination_no;
	}
	public void setDestination_no(int destination_no) {
		this.destination_no = destination_no;
	}
	public int getBuyProduct_no() {
		return buyProduct_no;
	}
	public void setBuyProduct_no(int buyProduct_no) {
		this.buyProduct_no = buyProduct_no;
	}
	public String getPayment_deliveryMsg() {
		return payment_deliveryMsg;
	}
	public void setPayment_deliveryMsg(String payment_deliveryMsg) {
		this.payment_deliveryMsg = payment_deliveryMsg;
	}
	
	@Override
	public String toString() {
		return "InsertintoPaymentDTO [payment_no=" + payment_no + ", member_id=" + member_id + ", payInfo_no="
				+ payInfo_no + ", destination_no=" + destination_no + ", buyProduct_no=" + buyProduct_no
				+ ", payment_deliveryMsg=" + payment_deliveryMsg + "]";
	}
	
}
