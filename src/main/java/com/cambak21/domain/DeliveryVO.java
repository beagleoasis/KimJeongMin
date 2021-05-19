package com.cambak21.domain;

public class DeliveryVO {
	private int delivery_no;
	private String delivery_status;
	private int payment_no;
	
	public int getDelivery_no() {
		return delivery_no;
	}
	public void setDelivery_no(int delivery_no) {
		this.delivery_no = delivery_no;
	}
	public String getDelivery_status() {
		return delivery_status;
	}
	public void setDelivery_status(String delivery_status) {
		this.delivery_status = delivery_status;
	}
	public int getPayment_no() {
		return payment_no;
	}
	public void setPayment_no(int payment_no) {
		this.payment_no = payment_no;
	}
	
	@Override
	public String toString() {
		return "DeliveryVO [delivery_no=" + delivery_no + ", delivery_status=" + delivery_status + ", payment_no="
				+ payment_no + "]";
	}
	
	
}