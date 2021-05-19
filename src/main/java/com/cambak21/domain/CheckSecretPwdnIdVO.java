package com.cambak21.domain;

public class CheckSecretPwdnIdVO {
	private String prodQA_secretPassword;
	private String member_id;
	
	public String getProdQA_secretPassword() {
		return prodQA_secretPassword;
	}
	public void setProdQA_secretPassword(String prodQA_secretPassword) {
		this.prodQA_secretPassword = prodQA_secretPassword;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	@Override
	public String toString() {
		return "CheckSecretPwdnIdVO [prodQA_secretPassword=" + prodQA_secretPassword + ", member_id=" + member_id + "]";
	}
	
}
