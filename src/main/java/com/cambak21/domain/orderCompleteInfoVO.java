package com.cambak21.domain;

import java.util.Date;

public class orderCompleteInfoVO {
	private String destination_toUser;
	private String destination_mobile;
	private String destination_zipCode;
	private String destination_address;
	private String destination_addressDetail;
	private String payInfo_way;
	private Date payInfo_date;
	private int totPrice;
	private int payment_no;
	
	public String getDestination_toUser() {
		return destination_toUser;
	}
	public void setDestination_toUser(String destination_toUser) {
		this.destination_toUser = destination_toUser;
	}
	public String getDestination_mobile() {
		return destination_mobile;
	}
	public void setDestination_mobile(String destination_mobile) {
		this.destination_mobile = destination_mobile;
	}
	public String getDestination_zipCode() {
		return destination_zipCode;
	}
	public void setDestination_zipCode(String destination_zipCode) {
		this.destination_zipCode = destination_zipCode;
	}
	public String getDestination_address() {
		return destination_address;
	}
	public void setDestination_address(String destination_address) {
		this.destination_address = destination_address;
	}
	public String getDestination_addressDetail() {
		return destination_addressDetail;
	}
	public void setDestination_addressDetail(String destination_addressDetail) {
		this.destination_addressDetail = destination_addressDetail;
	}
	public String getPayInfo_way() {
		return payInfo_way;
	}
	public void setPayInfo_way(String payInfo_way) {
		this.payInfo_way = payInfo_way;
	}
	public Date getPayInfo_date() {
		return payInfo_date;
	}
	public void setPayInfo_date(Date payInfo_date) {
		this.payInfo_date = payInfo_date;
	}
	public int getTotPrice() {
		return totPrice;
	}
	public void setTotPrice(int totPrice) {
		this.totPrice = totPrice;
	}
	public int getPayment_no() {
		return payment_no;
	}
	public void setPayment_no(int payment_no) {
		this.payment_no = payment_no;
	}
	
	@Override
	public String toString() {
		return "orderCompleteInfoVO [destination_toUser=" + destination_toUser + ", destination_mobile="
				+ destination_mobile + ", destination_zipCode=" + destination_zipCode + ", destination_address="
				+ destination_address + ", destination_addressDetail=" + destination_addressDetail + ", payInfo_way="
				+ payInfo_way + ", payInfo_date=" + payInfo_date + ", totPrice=" + totPrice + ", payment_no="
				+ payment_no + "]";
	}
	
}
