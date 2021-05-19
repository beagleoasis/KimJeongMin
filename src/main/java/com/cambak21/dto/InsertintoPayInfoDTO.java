package com.cambak21.dto;

public class InsertintoPayInfoDTO {
	private String member_id;
	private String payInfo_way;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getPayInfo_way() {
		return payInfo_way;
	}
	public void setPayInfo_way(String payInfo_way) {
		this.payInfo_way = payInfo_way;
	}
	
	@Override
	public String toString() {
		return "InsertintoPayInfoDTO [member_id=" + member_id + ", payInfo_way=" + payInfo_way + "]";
	}
	
}
