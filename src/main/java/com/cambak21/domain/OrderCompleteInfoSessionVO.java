package com.cambak21.domain;

public class OrderCompleteInfoSessionVO {
	private int payment_no;
	private int totPrice;
	
	public int getPayment_no() {
		return payment_no;
	}
	public void setPayment_no(int payment_no) {
		this.payment_no = payment_no;
	}
	public int getTotPrice() {
		return totPrice;
	}
	public void setTotPrice(int totPrice) {
		this.totPrice = totPrice;
	}
	
	@Override
	public String toString() {
		return "OrderCompleteInfoSessionVO [payment_no=" + payment_no + ", totPrice=" + totPrice + "]";
	}
	
}
