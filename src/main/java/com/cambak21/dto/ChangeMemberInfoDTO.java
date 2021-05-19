package com.cambak21.dto;

public class ChangeMemberInfoDTO {
	private String member_id;
	private String member_password;
	private String member_gender;
	private String member_postCode;
	private String member_addr;
	private String member_addrDetail;
	private String member_mobile;
	private String member_img;
	
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
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
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
	
	@Override
	public String toString() {
		return "ChangeMemberInfoDTO [member_id=" + member_id + ", member_password=" + member_password
				+ ", member_gender=" + member_gender + ", member_postCode=" + member_postCode + ", member_addr="
				+ member_addr + ", member_addrDetail=" + member_addrDetail + ", member_mobile=" + member_mobile
				+ ", member_img=" + member_img + "]";
	}
	
}
