package com.cambak21.domain;

import java.util.Date;

public class ResellBoardVO {
	private int resellBoard_no;
	private String member_id;
	private String resellBoard_title;
	private String resellBoard_content;
	private int resellBoard_price;
	private Date resellBoard_postDate;
	private Date resellBoard_updateDate;
	private String resellBoard_addr;
	private String resellBoard_img1;
	private String resellBoard_img2;
	private String resellBoard_img3;
	private String resellBoard_img4;
	private int resellBoard_viewCnt;
	private int resellBoard_likeCnt;
	private int resellBoard_replyCnt;
	private String resellBoard_isDelete;
	private Date resellBoard_deleteDate;
	
	public int getResellBoard_no() {
		return resellBoard_no;
	}
	public void setResellBoard_no(int resellBoard_no) {
		this.resellBoard_no = resellBoard_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getResellBoard_title() {
		return resellBoard_title;
	}
	public void setResellBoard_title(String resellBoard_title) {
		this.resellBoard_title = resellBoard_title;
	}
	public String getResellBoard_content() {
		return resellBoard_content;
	}
	public void setResellBoard_content(String resellBoard_content) {
		this.resellBoard_content = resellBoard_content;
	}
	public int getResellBoard_price() {
		return resellBoard_price;
	}
	public void setResellBoard_price(int resellBoard_price) {
		this.resellBoard_price = resellBoard_price;
	}
	public Date getResellBoard_postDate() {
		return resellBoard_postDate;
	}
	public void setResellBoard_postDate(Date resellBoard_postDate) {
		this.resellBoard_postDate = resellBoard_postDate;
	}
	public Date getResellBoard_updateDate() {
		return resellBoard_updateDate;
	}
	public void setResellBoard_updateDate(Date resellBoard_updateDate) {
		this.resellBoard_updateDate = resellBoard_updateDate;
	}
	public String getResellBoard_addr() {
		return resellBoard_addr;
	}
	public void setResellBoard_addr(String resellBoard_addr) {
		this.resellBoard_addr = resellBoard_addr;
	}
	public String getResellBoard_img1() {
		return resellBoard_img1;
	}
	public void setResellBoard_img1(String resellBoard_img1) {
		this.resellBoard_img1 = resellBoard_img1;
	}
	public String getResellBoard_img2() {
		return resellBoard_img2;
	}
	public void setResellBoard_img2(String resellBoard_img2) {
		this.resellBoard_img2 = resellBoard_img2;
	}
	public String getResellBoard_img3() {
		return resellBoard_img3;
	}
	public void setResellBoard_img3(String resellBoard_img3) {
		this.resellBoard_img3 = resellBoard_img3;
	}
	public String getResellBoard_img4() {
		return resellBoard_img4;
	}
	public void setResellBoard_img4(String resellBoard_img4) {
		this.resellBoard_img4 = resellBoard_img4;
	}
	public int getResellBoard_viewCnt() {
		return resellBoard_viewCnt;
	}
	public void setResellBoard_viewCnt(int resellBoard_viewCnt) {
		this.resellBoard_viewCnt = resellBoard_viewCnt;
	}
	public int getResellBoard_likeCnt() {
		return resellBoard_likeCnt;
	}
	public void setResellBoard_likeCnt(int resellBoard_likeCnt) {
		this.resellBoard_likeCnt = resellBoard_likeCnt;
	}
	public int getResellBoard_replyCnt() {
		return resellBoard_replyCnt;
	}
	public void setResellBoard_replyCnt(int resellBoard_replyCnt) {
		this.resellBoard_replyCnt = resellBoard_replyCnt;
	}
	public String getResellBoard_isDelete() {
		return resellBoard_isDelete;
	}
	public void setResellBoard_isDelete(String resellBoard_isDelete) {
		this.resellBoard_isDelete = resellBoard_isDelete;
	}
	public Date getResellBoard_deleteDate() {
		return resellBoard_deleteDate;
	}
	public void setResellBoard_deleteDate(Date resellBoard_deleteDate) {
		this.resellBoard_deleteDate = resellBoard_deleteDate;
	}
	@Override
	public String toString() {
		return "ResellBoardVO [resellBoard_no=" + resellBoard_no + ", member_id=" + member_id + ", resellBoard_title="
				+ resellBoard_title + ", resellBoard_content=" + resellBoard_content + ", resellBoard_price="
				+ resellBoard_price + ", resellBoard_postDate=" + resellBoard_postDate + ", resellBoard_updateDate="
				+ resellBoard_updateDate + ", resellBoard_addr=" + resellBoard_addr + ", resellBoard_img1="
				+ resellBoard_img1 + ", resellBoard_img2=" + resellBoard_img2 + ", resellBoard_img3=" + resellBoard_img3
				+ ", resellBoard_img4=" + resellBoard_img4 + ", resellBoard_viewCnt=" + resellBoard_viewCnt
				+ ", resellBoard_likeCnt=" + resellBoard_likeCnt + ", resellBoard_replyCnt=" + resellBoard_replyCnt
				+ ", resellBoard_isDelete=" + resellBoard_isDelete + ", resellBoard_deleteDate="
				+ resellBoard_deleteDate + "]";
	}
	
}
