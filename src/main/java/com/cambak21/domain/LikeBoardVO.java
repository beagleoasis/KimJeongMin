package com.cambak21.domain;

import java.util.Date;

public class LikeBoardVO {

	private String member_id;
	private int board_no;
	private Date likeBoard_date;
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public Date getLikeBoard_date() {
		return likeBoard_date;
	}
	public void setLikeBoard_date(Date likeBoard_date) {
		this.likeBoard_date = likeBoard_date;
	}
	@Override
	public String toString() {
		return "LikeBoardVO [member_id=" + member_id + ", board_no=" + board_no + ", likeBoard_date=" + likeBoard_date
				+ "]";
	}
	
	
}
