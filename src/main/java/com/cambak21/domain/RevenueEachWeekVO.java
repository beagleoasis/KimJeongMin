package com.cambak21.domain;

import java.util.Date;

public class RevenueEachWeekVO {
	private int buyProduct_no;
	private int buyProduct_qty;
	private int buyProduct_deliveriPay;
	private int buyProduct_totPrice;
	private int buyProduct_refundTotPrice;
	private String startDate;
	private String endDate;
	private String payment_week;
	public String getPayment_week() {
		return payment_week;
	}
	public void setPayment_week(String payment_week) {
		this.payment_week = payment_week;
	}
	public int getBuyProduct_no() {
		return buyProduct_no;
	}
	public void setBuyProduct_no(int buyProduct_no) {
		this.buyProduct_no = buyProduct_no;
	}
	public int getBuyProduct_qty() {
		return buyProduct_qty;
	}
	public void setBuyProduct_qty(int buyProduct_qty) {
		this.buyProduct_qty = buyProduct_qty;
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
	public int getBuyProduct_refundTotPrice() {
		return buyProduct_refundTotPrice;
	}
	public void setBuyProduct_refundTotPrice(int buyProduct_refundTotPrice) {
		this.buyProduct_refundTotPrice = buyProduct_refundTotPrice;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	@Override
	public String toString() {
		return "RevenueEachWeekVO [buyProduct_no=" + buyProduct_no + ", buyProduct_qty=" + buyProduct_qty
				+ ", buyProduct_deliveriPay=" + buyProduct_deliveriPay + ", buyProduct_totPrice=" + buyProduct_totPrice
				+ ", buyProduct_refundTotPrice=" + buyProduct_refundTotPrice + ", startDate=" + startDate + ", endDate="
				+ endDate + ", payment_week=" + payment_week + "]";
	}
	
	
	
}
