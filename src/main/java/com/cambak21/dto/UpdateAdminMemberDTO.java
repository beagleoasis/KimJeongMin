package com.cambak21.dto;

public class UpdateAdminMemberDTO {
	private String member_id;
	private String member_name;
	private int member_totPoint;
	
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
	public int getMember_totPoint() {
		return member_totPoint;
	}
	public void setMember_totPoint(int member_totPoint) {
		this.member_totPoint = member_totPoint;
	}
	
	@Override
	public String toString() {
		return "UpdateAdminMemberDTO [member_id=" + member_id + ", member_name=" + member_name + ", member_totPoint="
				+ member_totPoint + "]";
	}
	
}
