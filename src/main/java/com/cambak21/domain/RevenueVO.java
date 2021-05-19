package com.cambak21.domain;

import java.util.Date;

public class RevenueVO {
	private int buyProduct_totPrice;
	private Date payment_date;
	public int getBuyProduct_totPrice() {
		return buyProduct_totPrice;
	}
	public void setBuyProduct_totPrice(int buyProduct_totPrice) {
		this.buyProduct_totPrice = buyProduct_totPrice;
	}
	public Date getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}
	@Override
	public String toString() {
		return "RevenueVO [buyProduct_totPrice=" + buyProduct_totPrice + ", payment_date=" + payment_date + "]";
	}
	
	
}
