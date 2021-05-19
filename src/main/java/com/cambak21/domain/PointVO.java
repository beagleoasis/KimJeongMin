package com.cambak21.domain;

import java.util.Date;

public class PointVO {
	private int point_no;
	private int buyProduct_no;
	private String member_id;
	private String grade_name;
	private int buyProduct_totPrice;
	private String point_reason;
	private int point_usedPoint;
	private int point_futurePoint;
	private Date point_savingDate;
	private Date  payment_date;
	
	public int getPoint_no() {
		return point_no;
	}
	public void setPoint_no(int point_no) {
		this.point_no = point_no;
	}
	public int getBuyProduct_no() {
		return buyProduct_no;
	}
	public void setBuyProduct_no(int buyProduct_no) {
		this.buyProduct_no = buyProduct_no;
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
	public String getReason() {
		return point_reason;
	}
	public void setReason(String reason) {
		this.point_reason = reason;
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
	@Override
	public String toString() {
		return "PointVO [point_no=" + point_no + ", buyProduct_no=" + buyProduct_no + ", member_id=" + member_id
				+ ", grade_name=" + grade_name + ", buyProduct_totPrice=" + buyProduct_totPrice + ", point_reason=" + point_reason
				+ ", point_usedPoint=" + point_usedPoint + ", point_futurePoint=" + point_futurePoint
				+ ", point_savingDate=" + point_savingDate + ", payment_date=" + payment_date + "]";
	}
	
	
	
}
