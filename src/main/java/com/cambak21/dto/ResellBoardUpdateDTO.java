package com.cambak21.dto;

public class ResellBoardUpdateDTO {
	private int resellBoard_no;
	private String resellBoard_title;
	private String resellBoard_content;
	private int resellBoard_price;
	private String resellBoard_addr;
	private String resellBoard_img1;
	private String resellBoard_img2;
	private String resellBoard_img3;
	private String resellBoard_img4;
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
	
	public int getResellBoard_no() {
		return resellBoard_no;
	}
	public void setResellBoard_no(int resellBoard_no) {
		this.resellBoard_no = resellBoard_no;
	}
	@Override
	public String toString() {
		return "ResellBoardUpdateDTO [resellBoard_no=" + resellBoard_no + ", resellBoard_title=" + resellBoard_title
				+ ", resellBoard_content=" + resellBoard_content + ", resellBoard_price=" + resellBoard_price
				+ ", resellBoard_addr=" + resellBoard_addr + ", resellBoard_img1=" + resellBoard_img1
				+ ", resellBoard_img2=" + resellBoard_img2 + ", resellBoard_img3=" + resellBoard_img3
				+ ", resellBoard_img4=" + resellBoard_img4 + "]";
	}
	
	
	
}
