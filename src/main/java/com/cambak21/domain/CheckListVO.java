package com.cambak21.domain;

public class CheckListVO {
	private int checkList_no;
	private String member_id;
	private String checkList_checked;
	private String checkList_content;
	
	
	public int getCheckList_no() {
		return checkList_no;
	}
	public void setCheckList_no(int checkList_no) {
		this.checkList_no = checkList_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getCheckList_checked() {
		return checkList_checked;
	}
	public void setCheckList_checked(String checkList_checked) {
		this.checkList_checked = checkList_checked;
	}
	public String getCheckList_content() {
		return checkList_content;
	}
	public void setCheckList_content(String checkList_content) {
		this.checkList_content = checkList_content;
	}
	@Override
	public String toString() {
		return "CheckListVO [checkList_no=" + checkList_no + ", member_id=" + member_id + ", checkList_checked="
				+ checkList_checked + ", checkList_content=" + checkList_content + "]";
	}
	
		
}
