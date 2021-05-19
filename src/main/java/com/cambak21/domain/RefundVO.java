package com.cambak21.domain;

import java.util.Date;

public class RefundVO {
	private int payment_serialNo;
	private Date payment_date;
	private Date refundnExchange_date;
	private String refundnExchange_reason;
	private String refundnExchange_status;
	private String refundnExchange_isChecked;
	private String product_name;
	private int buyProduct_totPrice;
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
	public Date getRefundnExchange_date() {
		return refundnExchange_date;
	}
	public void setRefundnExchange_date(Date refundnExchange_date) {
		this.refundnExchange_date = refundnExchange_date;
	}
	public String getRefundnExchange_reason() {
		return refundnExchange_reason;
	}
	public void setRefundnExchange_reason(String refundnExchange_reason) {
		this.refundnExchange_reason = refundnExchange_reason;
	}
	public String getRefundnExchange_status() {
		return refundnExchange_status;
	}
	public void setRefundnExchange_status(String refundnExchange_status) {
		this.refundnExchange_status = refundnExchange_status;
	}
	public String getRefundnExchange_isChecked() {
		return refundnExchange_isChecked;
	}
	public void setRefundnExchange_isChecked(String refundnExchange_isChecked) {
		this.refundnExchange_isChecked = refundnExchange_isChecked;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getBuyProduct_totPrice() {
		return buyProduct_totPrice;
	}
	public void setBuyProduct_totPrice(int buyProduct_totPrice) {
		this.buyProduct_totPrice = buyProduct_totPrice;
	}
	@Override
	public String toString() {
		return "RefundVO [payment_serialNo=" + payment_serialNo + ", payment_date=" + payment_date
				+ ", refundnExchange_date=" + refundnExchange_date + ", refundnExchange_reason="
				+ refundnExchange_reason + ", refundnExchange_status=" + refundnExchange_status
				+ ", refundnExchange_isChecked=" + refundnExchange_isChecked + ", product_name=" + product_name
				+ ", buyProduct_totPrice=" + buyProduct_totPrice + "]";
	}
	
	
}