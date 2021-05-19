package com.cambak21.domain;

import java.util.Date;

public class OrderManagementPayInfoVO {
	private int payment_no;
	private int buyProduct_totPrice;
	private int buyProduct_deliveriPay;
	private int point_usedPoint;
	private int point_futurePoint;
	private String payInfo_way;
	private String payment_isComit;
	private Date payment_date;
	
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
	public int getBuyProduct_deliveriPay() {
		return buyProduct_deliveriPay;
	}
	public void setBuyProduct_deliveriPay(int buyProduct_deliveriPay) {
		this.buyProduct_deliveriPay = buyProduct_deliveriPay;
	}
	public int getPoint_usedPoint() {
		return point_usedPoint;
	}
	public void setPoint_usedPoint(int point_usedPoint) {
		this.point_usedPoint = point_usedPoint;
	}
	public int getPoint_futurePoint() {
		return point_futurePoint;
	}
	public void setPoint_futurePoint(int point_futurePoint) {
		this.point_futurePoint = point_futurePoint;
	}
	public String getPayInfo_way() {
		return payInfo_way;
	}
	public void setPayInfo_way(String payInfo_way) {
		this.payInfo_way = payInfo_way;
	}
	public String getPayment_isComit() {
		return payment_isComit;
	}
	public void setPayment_isComit(String payment_isComit) {
		this.payment_isComit = payment_isComit;
	}
	public Date getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}
	
	@Override
	public String toString() {
		return "OrderManagementPayInfoVO [payment_no=" + payment_no + ", buyProduct_totPrice=" + buyProduct_totPrice
				+ ", buyProduct_deliveriPay=" + buyProduct_deliveriPay + ", point_usedPoint=" + point_usedPoint
				+ ", point_futurePoint=" + point_futurePoint + ", payInfo_way=" + payInfo_way + ", payment_isComit="
				+ payment_isComit + ", payment_date=" + payment_date + "]";
	}
	
}
