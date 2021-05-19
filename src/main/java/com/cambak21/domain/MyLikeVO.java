package com.cambak21.domain;

import java.util.Date;

public class MyLikeVO {
	private int board_no;
	private String board_category;
	private String member_id;
	private String board_title;
	private Date likeBoard_date;
	
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getBoard_category() {
		return board_category;
	}
	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public Date getLikeBoard_date() {
		return likeBoard_date;
	}
	public void setLikeBoard_date(Date likeBoard_date) {
		this.likeBoard_date = likeBoard_date;
	}
	
	@Override
	public String toString() {
		return "MyLikeDTO [board_no=" + board_no + ", board_category=" + board_category + ", member_id=" + member_id
				+ ", board_title=" + board_title + ", likeBoard_date=" + likeBoard_date + "]";
	}
	
}
