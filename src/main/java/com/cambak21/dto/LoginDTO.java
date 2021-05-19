package com.cambak21.dto;

import java.util.Date;

public class LoginDTO {

	private String member_id;
	private String member_password;
	private boolean member_cookie;
	
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
	public boolean isMember_cookie() {
		return member_cookie;
	}
	public void setMember_cookie(boolean member_cookie) {
		this.member_cookie = member_cookie;
	}
	
	@Override
	public String toString() {
		return "LoginDTO [member_id=" + member_id + ", member_password=" + member_password + ", member_cookie="
				+ member_cookie + "]";
	}
	
}