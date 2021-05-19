package com.cambak21.domain;

import java.util.Date;

public class MyPointVO {
	private int point_no;
	private String member_id;
	private String point_reason;
	private int point_usedPoint;
	private int point_futurePoint;
	private Date point_savingDate;
	private Date  payment_date;
	private String product_name;
	
	public int getPoint_no() {
		return point_no;
	}
	public void setPoint_no(int point_no) {
		this.point_no = point_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getPoint_reason() {
		return point_reason;
	}
	public void setPoint_reason(String point_reason) {
		this.point_reason = point_reason;
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
	public Date getPoint_savingDate() {
		return point_savingDate;
	}
	public void setPoint_savingDate(Date point_savingDate) {
		this.point_savingDate = point_savingDate;
	}
	public Date getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	
	@Override
	public String toString() {
		return "MyPointVO [point_no=" + point_no + ", member_id=" + member_id + ", point_reason=" + point_reason
				+ ", point_usedPoint=" + point_usedPoint + ", point_futurePoint=" + point_futurePoint
				+ ", point_savingDate=" + point_savingDate + ", payment_date=" + payment_date + ", product_name="
				+ product_name + ", getPoint_no()=" + getPoint_no() + ", getMember_id()=" + getMember_id()
				+ ", getPoint_reason()=" + getPoint_reason() + ", getPoint_usedPoint()=" + getPoint_usedPoint()
				+ ", getPoint_futurePoint()=" + getPoint_futurePoint() + ", getPoint_savingDate()="
				+ getPoint_savingDate() + ", getPayment_date()=" + getPayment_date() + ", getProduct_name()="
				+ getProduct_name() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	
	
	
}
