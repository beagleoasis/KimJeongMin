package com.cambak21.domain;

import java.util.Date;

public class ResellLikeBoardVO {
	private String member_id;
	private int resellBoard_no;
	private Date resellLikeBoards_date;
	
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
	public Date getResellLikeBoards_date() {
		return resellLikeBoards_date;
	}
	public void setResellLikeBoards_date(Date resellLikeBoards_date) {
		this.resellLikeBoards_date = resellLikeBoards_date;
	}
	
	@Override
	public String toString() {
		return "ResellLikeBoardVO [member_id=" + member_id + ", resellBoard_no=" + resellBoard_no
				+ ", resellLikeBoards_date=" + resellLikeBoards_date + "]";
	}
	
}
