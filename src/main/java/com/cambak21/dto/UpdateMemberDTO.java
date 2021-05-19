package com.cambak21.dto;

public class UpdateMemberDTO {
	private String member_name;
	private String member_password;
	private String member_birth;
	private String member_addr;
	private String member_email;
	private String member_mobile;
	private String member_id;
	
	
	
	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_password() {
		return member_password;
	}

	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}

	public String getMember_birth() {
		return member_birth;
	}

	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}

	public String getMember_addr() {
		return member_addr;
	}

	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
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
		return "UpdateMemberDTO [member_name=" + member_name + ", member_password=" + member_password
				+ ", member_birth=" + member_birth + ", member_addr=" + member_addr + ", member_email=" + member_email
				+ ", member_mobile=" + member_mobile + ", member_id=" + member_id + "]";
	}

	
	
	
}
