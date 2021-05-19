package com.cambak21.domain;

import java.util.Date;

public class RevenueWeeklyVO {
	private int buyProduct_totPrice;
	private String payment_week;
	public int getBuyProduct_totPrice() {
		return buyProduct_totPrice;
	}
	public void setBuyProduct_totPrice(int buyProduct_totPrice) {
		this.buyProduct_totPrice = buyProduct_totPrice;
	}
	public String getPayment_week() {
		return payment_week;
	}
	public void setPayment_week(String payment_week) {
		this.payment_week = payment_week;
	}
	@Override
	public String toString() {
		return "RevenueWeeklyVO [buyProduct_totPrice=" + buyProduct_totPrice + ", payment_week=" + payment_week + "]";
	}
	
	
}
