package com.cambak21.domain;

import java.util.Date;

public class AdminRefundnExchangeVO {
	private String member_id;
	private  String refundnExchange_reason;
	private Date refundnExchange_date;
	private String refundnExchange_status;
	private String product_name;
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getRefundnExchange_reason() {
		return refundnExchange_reason;
	}
	public void setRefundnExchange_reason(String refundnExchange_reason) {
		this.refundnExchange_reason = refundnExchange_reason;
	}
	public Date getRefundnExchange_date() {
		return refundnExchange_date;
	}
	public void setRefundnExchange_date(Date refundnExchange_date) {
		this.refundnExchange_date = refundnExchange_date;
	}
	public String getRefundnExchange_status() {
		return refundnExchange_status;
	}
	public void setRefundnExchange_status(String refundnExchange_status) {
		this.refundnExchange_status = refundnExchange_status;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	@Override
	public String toString() {
		return "AdminRefundnExchangeDTO [member_id=" + member_id + ", refundnExchange_reason=" + refundnExchange_reason
				+ ", refundnExchange_date=" + refundnExchange_date + ", refundnExchange_status="
				+ refundnExchange_status + ", product_name=" + product_name + "]";
	}
}
