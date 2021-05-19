package com.cambak21.dto;

public class MemberTotUpdateDTO {
	private int member_totPoint;
	private int member_payment;
	
	public int getMember_totPoint() {
		return member_totPoint;
	}
	public void setMember_totPoint(int member_totPoint) {
		this.member_totPoint = member_totPoint;
	}
	public int getMember_payment() {
		return member_payment;
	}
	public void setMember_payment(int member_payment) {
		this.member_payment = member_payment;
	}
	@Override
	public String toString() {
		return "MemberTotUpdate [member_totPoint=" + member_totPoint + ", member_payment=" + member_payment + "]";
	}
	
}
