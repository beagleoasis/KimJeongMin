package com.cambak21.dto;

import java.util.Date;

public class InsertintoPointDTO {
	private int payment_no;
	private String member_id;
	private String grade_name;
	private int buyProduct_totPrice;
	private String point_reason;
	private int point_usedPoint;
	private int point_futurePoint;
	private Date payment_date;
	
	public int getPayment_no() {
		return payment_no;
	}
	public void setPayment_no(int payment_no) {
		this.payment_no = payment_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getGrade_name() {
		return grade_name;
	}
	public void setGrade_name(String grade_name) {
		this.grade_name = grade_name;
	}
	public int getBuyProduct_totPrice() {
		return buyProduct_totPrice;
	}
	public void setBuyProduct_totPrice(int buyProduct_totPrice) {
		this.buyProduct_totPrice = buyProduct_totPrice;
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
	public Date getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}
	
	@Override
	public String toString() {
		return "InsertintoPaymentDTO [payment_no=" + payment_no + ", member_id=" + member_id + ", grade_name="
				+ grade_name + ", buyProduct_totPrice=" + buyProduct_totPrice + ", point_reason=" + point_reason
				+ ", point_usedPoint=" + point_usedPoint + ", point_futurePoint=" + point_futurePoint
				+ ", payment_date=" + payment_date + "]";
	}
	
}
