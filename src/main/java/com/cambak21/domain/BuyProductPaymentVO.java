package com.cambak21.domain;

import java.util.Date;

public class BuyProductPaymentVO {
	private int buyProduct_no;
	private String member_id;
	private int bucket_no;
	private String product_name;
	private int buyProduct_qty;
	private int product_sellPrice;
	private int buyProduct_deliveriPay;
	private int buyProduct_totPrice;
	private String buyProduct_isFinished;
	private int product_id;
	private int payment_no;
	private int payment_serialNo;
	private int payInfo_no;
	private int destination_no;
	private String payment_date;
	private String payment_deliverryMsg;
	private String payment_isComit;
	private Date payment_comitDate;
	private String payment_isChecked;
	private String product_img1;
	public String getProduct_img1() {
		return product_img1;
	}
	public void setProduct_img1(String product_img1) {
		this.product_img1 = product_img1;
	}
	public int getBuyProduct_no() {
		return buyProduct_no;
	}
	public void setBuyProduct_no(int buyProduct_no) {
		this.buyProduct_no = buyProduct_no;
	}
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
	public int getBuyProduct_qty() {
		return buyProduct_qty;
	}
	public void setBuyProduct_qty(int buyProduct_qty) {
		this.buyProduct_qty = buyProduct_qty;
	}
	public int getProduct_sellPrice() {
		return product_sellPrice;
	}
	public void setProduct_sellPrice(int product_sellPrice) {
		this.product_sellPrice = product_sellPrice;
	}
	public int getBuyProduct_deliveriPay() {
		return buyProduct_deliveriPay;
	}
	public void setBuyProduct_deliveriPay(int buyProduct_deliveriPay) {
		this.buyProduct_deliveriPay = buyProduct_deliveriPay;
	}
	public int getBuyProduct_totPrice() {
		return buyProduct_totPrice;
	}
	public void setBuyProduct_totPrice(int buyProduct_totPrice) {
		this.buyProduct_totPrice = buyProduct_totPrice;
	}
	public String getBuyProduct_isFinished() {
		return buyProduct_isFinished;
	}
	public void setBuyProduct_isFinished(String buyProduct_isFinished) {
		this.buyProduct_isFinished = buyProduct_isFinished;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
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
	public String getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}
	public String getPayment_deliverryMsg() {
		return payment_deliverryMsg;
	}
	public void setPayment_deliverryMsg(String payment_deliverryMsg) {
		this.payment_deliverryMsg = payment_deliverryMsg;
	}
	public String getPayment_isComit() {
		return payment_isComit;
	}
	public void setPayment_isComit(String payment_isComit) {
		this.payment_isComit = payment_isComit;
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
		return "BuyProductPaymentVO [buyProduct_no=" + buyProduct_no + ", member_id=" + member_id + ", bucket_no="
				+ bucket_no + ", product_name=" + product_name + ", buyProduct_qty=" + buyProduct_qty
				+ ", product_sellPrice=" + product_sellPrice + ", buyProduct_deliveriPay=" + buyProduct_deliveriPay
				+ ", buyProduct_totPrice=" + buyProduct_totPrice + ", buyProduct_isFinished=" + buyProduct_isFinished
				+ ", product_id=" + product_id + ", payment_no=" + payment_no + ", payment_serialNo=" + payment_serialNo
				+ ", payInfo_no=" + payInfo_no + ", destination_no=" + destination_no + ", payment_date=" + payment_date
				+ ", payment_deliverryMsg=" + payment_deliverryMsg + ", payment_isComit=" + payment_isComit
				+ ", payment_comitDate=" + payment_comitDate + ", payment_isChecked=" + payment_isChecked
				+ ", product_img1=" + product_img1 + "]";
	}
	
	
	
}
