package com.cambak21.domain;

import java.util.Date;

public class BoardCsVO {
	private int board_no;
	private String member_id;
	private String board_title;
	private String board_content;
	private Date board_writeDate;
	private Date board_updateDate;
	private int board_likeCnt;
	private int board_viewCnt;
	private int replyCnt;
	private String board_isDelete;

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
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

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public Date getBoard_writeDate() {
		return board_writeDate;
	}

	public void setBoard_writeDate(Date board_writeDate) {
		this.board_writeDate = board_writeDate;
	}

	public Date getBoard_updateDate() {
		return board_updateDate;
	}

	public void setBoard_updateDate(Date board_updateDate) {
		this.board_updateDate = board_updateDate;
	}

	public int getBoard_likeCnt() {
		return board_likeCnt;
	}

	public void setBoard_likeCnt(int board_likeCnt) {
		this.board_likeCnt = board_likeCnt;
	}

	public int getBoard_viewCnt() {
		return board_viewCnt;
	}

	public void setBoard_viewCnt(int board_viewCnt) {
		this.board_viewCnt = board_viewCnt;
	}

	public int getReplyCnt() {
		return replyCnt;
	}

	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}

	public String getBoard_isDelete() {
		return board_isDelete;
	}

	public void setBoard_isDelete(String board_isDelete) {
		this.board_isDelete = board_isDelete;
	}

	@Override
	public String toString() {
		return "BoardCsVO [board_no=" + board_no + ", member_id=" + member_id + ", board_title=" + board_title
				+ ", board_content=" + board_content + ", board_writeDate=" + board_writeDate + ", board_updateDate="
				+ board_updateDate + ", board_likeCnt=" + board_likeCnt + ", board_viewCnt=" + board_viewCnt
				+ ", replyCnt=" + replyCnt + ", board_isDelete=" + board_isDelete + "]";
	}

}
