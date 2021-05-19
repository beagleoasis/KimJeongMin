package com.cambak21.dto;

import java.util.Date;

public class AdminReplyBoardDTO {


	private int board_no;
	private String Bmember_id;
	private String board_title;
	private String board_category;
	private Date board_writeDate;
	private Date board_updateDate;
	private int board_likeCnt;
	private int board_viewCnt;
	private String board_isDelete;
	private int board_replyCnt;
	private int replyBoard_no;
	private String Rmember_id;
	private String replyBoard_content;
	private Date replyBoard_writeDate;
	private Date replyBoard_updateDate;
	private String replyBoard_isdelete;
	private String CategoryLink;
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getBmember_id() {
		return Bmember_id;
	}
	public void setBmember_id(String bmember_id) {
		Bmember_id = bmember_id;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_category() {
		return board_category;
	}
	public void setBoard_category(String board_category) {
		this.board_category = board_category;
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
	public String getBoard_isDelete() {
		return board_isDelete;
	}
	public void setBoard_isDelete(String board_isDelete) {
		this.board_isDelete = board_isDelete;
	}
	public int getBoard_replyCnt() {
		return board_replyCnt;
	}
	public void setBoard_replyCnt(int board_replyCnt) {
		this.board_replyCnt = board_replyCnt;
	}
	public int getReplyBoard_no() {
		return replyBoard_no;
	}
	public void setReplyBoard_no(int replyBoard_no) {
		this.replyBoard_no = replyBoard_no;
	}
	public String getRmember_id() {
		return Rmember_id;
	}
	public void setRmember_id(String rmember_id) {
		Rmember_id = rmember_id;
	}
	public String getReplyBoard_content() {
		return replyBoard_content;
	}
	public void setReplyBoard_content(String replyBoard_content) {
		this.replyBoard_content = replyBoard_content;
	}
	public Date getReplyBoard_writeDate() {
		return replyBoard_writeDate;
	}
	public void setReplyBoard_writeDate(Date replyBoard_writeDate) {
		this.replyBoard_writeDate = replyBoard_writeDate;
	}
	public Date getReplyBoard_updateDate() {
		return replyBoard_updateDate;
	}
	public void setReplyBoard_updateDate(Date replyBoard_updateDate) {
		this.replyBoard_updateDate = replyBoard_updateDate;
	}
	public String getReplyBoard_isdelete() {
		return replyBoard_isdelete;
	}
	public void setReplyBoard_isdelete(String replyBoard_isdelete) {
		this.replyBoard_isdelete = replyBoard_isdelete;
	}
	public String getCategoryLink() {
		return CategoryLink;
	}
	public void setCategoryLink(String categoryLink) {
		CategoryLink = categoryLink;
	}
	@Override
	public String toString() {
		return "AdminReplyBoardDTO [board_no=" + board_no + ", Bmember_id=" + Bmember_id + ", board_title="
				+ board_title + ", board_category=" + board_category + ", board_writeDate=" + board_writeDate
				+ ", board_updateDate=" + board_updateDate + ", board_likeCnt=" + board_likeCnt + ", board_viewCnt="
				+ board_viewCnt + ", board_isDelete=" + board_isDelete + ", board_replyCnt=" + board_replyCnt
				+ ", replyBoard_no=" + replyBoard_no + ", Rmember_id=" + Rmember_id + ", replyBoard_content="
				+ replyBoard_content + ", replyBoard_writeDate=" + replyBoard_writeDate + ", replyBoard_updateDate="
				+ replyBoard_updateDate + ", replyBoard_isdelete=" + replyBoard_isdelete + ", CategoryLink="
				+ CategoryLink + "]";
	}
	
	
	
}
