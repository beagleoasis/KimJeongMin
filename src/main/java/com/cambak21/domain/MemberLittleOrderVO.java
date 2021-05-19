package com.cambak21.domain;

import java.util.Date;

public class MemberLittleOrderVO {
	private Date payment_date;
	private String product_name;
	private String product_factory;
	private int payment_no;
	private int buyProduct_totPrice;
	private String delivery_status;
	private int payment_serialNo;
	
	public int getPayment_serialNo() {
		return payment_serialNo;
	}
	public void setPayment_serialNo(int payment_serialNo) {
		this.payment_serialNo = payment_serialNo;
	}
	public Date getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_factory() {
		return product_factory;
	}
	public void setProduct_factory(String product_factory) {
		this.product_factory = product_factory;
	}
	public int getPayment_no() {
		return payment_no;
	}
	public void setPayment_no(int payment_no) {
		this.payment_no = payment_no;
	}
	public int getBuyProduct_totPrice() {
		return buyProduct_totPrice;
	}
	public void setBuyProduct_totPrice(int buyProduct_totPrice) {
		this.buyProduct_totPrice = buyProduct_totPrice;
	}
	
	public String getDelivery_status() {
		return delivery_status;
	}
	public void setDelivery_status(String delivery_status) {
		this.delivery_status = delivery_status;
	}
	@Override
	public String toString() {
		return "MemberLittleOrderVO [payment_date=" + payment_date + ", product_name=" + product_name
				+ ", product_factory=" + product_factory + ", payment_no=" + payment_no + ", buyProduct_totPrice="
				+ buyProduct_totPrice + ", delivery_status=" + delivery_status + ", payment_serialNo="
				+ payment_serialNo + "]";
	}
	

	
	
}
