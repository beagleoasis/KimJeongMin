package com.cambak21.domain;

public class OrderManagementBuyerInfoVO {
	private String member_id;
	private String grade_name;
	private String member_name;
	private String member_birth;
	private String member_email;
	private String member_mobile;
	
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
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_mobile() {
		return member_mobile;
	}
	public void setMember_mobile(String member_mobile) {
		this.member_mobile = member_mobile;
	}
	
	@Override
	public String toString() {
		return "orderManagementBuyerInfoVO [member_id=" + member_id + ", grade_name=" + grade_name + ", member_name="
				+ member_name + ", member_birth=" + member_birth + ", member_email=" + member_email + ", member_mobile="
				+ member_mobile + "]";
	}
	
}
