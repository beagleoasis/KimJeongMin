package com.cambak21.domain;

public class OrderStatusInfo {
	private String delivery_status;
	private String payment_isComit;
	private String payment_isChecked;
	
	public String getDelivery_status() {
		return delivery_status;
	}
	public void setDelivery_status(String delivery_status) {
		this.delivery_status = delivery_status;
	}
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
	
	@Override
	public String toString() {
		return "OrderStatusInfo [delivery_status=" + delivery_status + ", payment_isComit=" + payment_isComit
				+ ", payment_isChecked=" + payment_isChecked + "]";
	}
	
}
