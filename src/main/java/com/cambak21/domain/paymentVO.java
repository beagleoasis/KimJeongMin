package com.cambak21.domain;

import java.util.Date;

public class paymentVO {
	
	private int payment_no; // 상품을 묶어주는 번호
	private int payment_serialNo;//진짜 PK
	private String member_id;
	private int payInfo_no;
	private int destination_no;
	private int buyProduct_no;
	private Date payment_date;
	private String payment_deliveryMsg;
	private Date payment_comitDate;
	private String payment_isChecked;
	
	
	public int getPayment_no() {
		return payment_no;
	}
	public void setPayment_no(int payment_no) {
		this.payment_no = payment_no;
	}
	public int getPayment_serialNo() {
		return payment_serialNo;
	}
	public void setPayment_serialNo(int payment_serialNo) {
		this.payment_serialNo = payment_serialNo;
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
	public Date getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}
	public String getPayment_deliveryMsg() {
		return payment_deliveryMsg;
	}
	public void setPayment_deliveryMsg(String payment_deliveryMsg) {
		this.payment_deliveryMsg = payment_deliveryMsg;
	}
	
	public Date getPayment_comitDate() {
		return payment_comitDate;
	}
	public void setPayment_comitDate(Date payment_comitDate) {
		this.payment_comitDate = payment_comitDate;
	}
	
	
	public String getPayment_isChecked() {
		return payment_isChecked;
	}
	public void setPayment_isChecked(String payment_isChecked) {
		this.payment_isChecked = payment_isChecked;
	}
	@Override
	public String toString() {
		return "paymentVO [payment_no=" + payment_no + ", payment_serialNo=" + payment_serialNo + ", member_id="
				+ member_id + ", payInfo_no=" + payInfo_no + ", destination_no=" + destination_no + ", buyProduct_no="
				+ buyProduct_no + ", payment_date=" + payment_date + ", payment_deliveryMsg=" + payment_deliveryMsg
				+ ", payment_comitDate=" + payment_comitDate + ", payment_isChecked=" + payment_isChecked + "]";
	}
	
	
	
	
}
