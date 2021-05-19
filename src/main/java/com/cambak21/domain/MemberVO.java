package com.cambak21.domain;

import java.util.Date;

public class MemberVO {
	private String member_id;
	private String member_password;
	private String grade_name;
	private String member_name;
	private String member_gender;
	private Date member_birth;
	private String member_postCode;
	private String member_addr;
	private String member_addrDetail;
	private String member_email;
	private String member_mobile;
	private String member_img;
	private int member_payment;
	private String member_isAdmin;
	private int member_totPoint;
	private String member_isDelete;
	private String member_cookie;
	private Date member_cookieAge;
	private Date member_registerDate;
	private Date member_kakaoInterlockDate;
	private String member_kakaoId;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_password() {
		return member_password;
	}
	public void setMember_password(String member_password) {
		this.member_password = member_password;
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
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	public Date getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(Date member_birth) {
		this.member_birth = member_birth;
	}
	public String getMember_postCode() {
		return member_postCode;
	}
	public void setMember_postCode(String member_postCode) {
		this.member_postCode = member_postCode;
	}
	public String getMember_addr() {
		return member_addr;
	}
	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}
	public String getMember_addrDetail() {
		return member_addrDetail;
	}
	public void setMember_addrDetail(String member_addrDetail) {
		this.member_addrDetail = member_addrDetail;
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
	public String getMember_img() {
		return member_img;
	}
	public void setMember_img(String member_img) {
		this.member_img = member_img;
	}
	public int getMember_payment() {
		return member_payment;
	}
	public void setMember_payment(int member_payment) {
		this.member_payment = member_payment;
	}
	public String getMember_isAdmin() {
		return member_isAdmin;
	}
	public void setMember_isAdmin(String member_isAdmin) {
		this.member_isAdmin = member_isAdmin;
	}
	public int getMember_totPoint() {
		return member_totPoint;
	}
	public void setMember_totPoint(int member_totPoint) {
		this.member_totPoint = member_totPoint;
	}
	public String getMember_isDelete() {
		return member_isDelete;
	}
	public void setMember_isDelete(String member_isDelete) {
		this.member_isDelete = member_isDelete;
	}
	public String getMember_cookie() {
		return member_cookie;
	}
	public void setMember_cookie(String member_cookie) {
		this.member_cookie = member_cookie;
	}
	public Date getMember_cookieAge() {
		return member_cookieAge;
	}
	public void setMember_cookieAge(Date member_cookieAge) {
		this.member_cookieAge = member_cookieAge;
	}
	public Date getMember_registerDate() {
		return member_registerDate;
	}
	public void setMember_registerDate(Date member_registerDate) {
		this.member_registerDate = member_registerDate;
	}
	public Date getMember_kakaoInterlockDate() {
		return member_kakaoInterlockDate;
	}
	public void setMember_kakaoInterlockDate(Date member_kakaoInterlockDate) {
		this.member_kakaoInterlockDate = member_kakaoInterlockDate;
	}
	public String getMember_kakaoId() {
		return member_kakaoId;
	}
	public void setMember_kakaoId(String member_kakaoId) {
		this.member_kakaoId = member_kakaoId;
	}
	
	@Override
	public String toString() {
		return "MemberVO [member_id=" + member_id + ", member_password=" + member_password + ", grade_name="
				+ grade_name + ", member_name=" + member_name + ", member_gender=" + member_gender + ", member_birth="
				+ member_birth + ", member_postCode=" + member_postCode + ", member_addr=" + member_addr
				+ ", member_addrDetail=" + member_addrDetail + ", member_email=" + member_email + ", member_mobile="
				+ member_mobile + ", member_img=" + member_img + ", member_payment=" + member_payment
				+ ", member_isAdmin=" + member_isAdmin + ", member_totPoint=" + member_totPoint + ", member_isDelete="
				+ member_isDelete + ", member_cookie=" + member_cookie + ", member_cookieAge=" + member_cookieAge
				+ ", member_registerDate=" + member_registerDate + ", member_kakaoInterlockDate="
				+ member_kakaoInterlockDate + ", member_kakaoId=" + member_kakaoId + "]";
	}
	
}
