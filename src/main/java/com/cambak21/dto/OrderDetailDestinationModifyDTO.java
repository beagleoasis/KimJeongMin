package com.cambak21.dto;

public class OrderDetailDestinationModifyDTO {
	private int destination_no;
	private String destination_nickname;
	private String destination_mobile;
	private String destination_zipCode;
	private String destination_address;
	private String destination_addressDetail;
	private String destination_toUser;
	private String payment_deliveryMsg;
	
	public int getDestination_no() {
		return destination_no;
	}
	public void setDestination_no(int destination_no) {
		this.destination_no = destination_no;
	}
	public String getDestination_nickname() {
		return destination_nickname;
	}
	public void setDestination_nickname(String destination_nickname) {
		this.destination_nickname = destination_nickname;
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
	public String getDestination_toUser() {
		return destination_toUser;
	}
	public void setDestination_toUser(String destination_toUser) {
		this.destination_toUser = destination_toUser;
	}
	public String getPayment_deliveryMsg() {
		return payment_deliveryMsg;
	}
	public void setPayment_deliveryMsg(String payment_deliveryMsg) {
		this.payment_deliveryMsg = payment_deliveryMsg;
	}
	
	@Override
	public String toString() {
		return "OrderDetailDestinationModifyDTO [destination_no=" + destination_no + ", destination_nickname="
				+ destination_nickname + ", destination_mobile=" + destination_mobile + ", destination_zipCode="
				+ destination_zipCode + ", destination_address=" + destination_address + ", destination_addressDetail="
				+ destination_addressDetail + ", destination_toUser=" + destination_toUser + ", payment_deliveryMsg="
				+ payment_deliveryMsg + "]";
	}
	
}
