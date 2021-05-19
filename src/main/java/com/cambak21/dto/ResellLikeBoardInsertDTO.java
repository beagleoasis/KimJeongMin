package com.cambak21.dto;

public class ResellLikeBoardInsertDTO {
	private String member_id;
	private int resellBoard_no;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getResellBoard_no() {
		return resellBoard_no;
	}
	public void setResellBoard_no(int resellBoard_no) {
		this.resellBoard_no = resellBoard_no;
	}
	
	@Override
	public String toString() {
		return "ResellLikeBoardInsert [member_id=" + member_id + ", resellBoard_no=" + resellBoard_no + "]";
	}
	
	
}
