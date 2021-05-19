package com.cambak21.domain;

import java.util.Date;

public class RefundnExchangeVO {
	private int refundnExchange_no;
	private String refundnExchange_reason;
	private String refundnExchange_status;
	private Date refundnExchange_date;
	private String member_id;
	private int payment_serialNo;
	private String refundnExchange_isChecked;
	private Date refundnExchange_checkedDate;
	
	public int getRefundnExchange_no() {
		return refundnExchange_no;
	}
	public void setRefundnExchange_no(int refundnExchange_no) {
		this.refundnExchange_no = refundnExchange_no;
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
	public Date getRefundnExchange_date() {
		return refundnExchange_date;
	}
	public void setRefundnExchange_date(Date refundnExchange_date) {
		this.refundnExchange_date = refundnExchange_date;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getPayment_serialNo() {
		return payment_serialNo;
	}
	public void setPayment_serialNo(int payment_serialNo) {
		this.payment_serialNo = payment_serialNo;
	}
	public String getRefundnExchange_isChecked() {
		return refundnExchange_isChecked;
	}
	public void setRefundnExchange_isChecked(String refundnExchange_isChecked) {
		this.refundnExchange_isChecked = refundnExchange_isChecked;
	}
	public Date getRefundnExchange_checkedDate() {
		return refundnExchange_checkedDate;
	}
	public void setRefundnExchange_checkedDate(Date refundnExchange_checkedDate) {
		this.refundnExchange_checkedDate = refundnExchange_checkedDate;
	}
	
	@Override
	public String toString() {
		return "RefundnExchangeVO [refundnExchange_no=" + refundnExchange_no + ", refundnExchange_reason="
				+ refundnExchange_reason + ", refundnExchange_status=" + refundnExchange_status
				+ ", refundnExchange_date=" + refundnExchange_date + ", member_id=" + member_id + ", payment_serialNo="
				+ payment_serialNo + ", refundnExchange_isChecked=" + refundnExchange_isChecked
				+ ", refundnExchange_checkedDate=" + refundnExchange_checkedDate + "]";
	}
	
}
