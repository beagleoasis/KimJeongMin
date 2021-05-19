package com.cambak21.dto;

public class CampReviewInsertDTO {
	private String member_id;
	private String board_title;
	private String board_category;
	private String board_content;
	private String camping_contentId;
	private String board_img1;
	private String board_img2;
	private String board_img3;
	private String board_img4;
	
	public String getMember_id() {
		return member_id;
	}
	public String getBoard_title() {
		return board_title;
	}
	public String getBoard_category() {
		return board_category;
	}
	public String getBoard_content() {
		return board_content;
	}
	
	public String getCamping_contentId() {
		return camping_contentId;
	}
	
	public String getBoard_img1() {
		return board_img1;
	}
	public String getBoard_img2() {
		return board_img2;
	}
	public String getBoard_img3() {
		return board_img3;
	}
	public String getBoard_img4() {
		return board_img4;
	}
	@Override
	public String toString() {
		return "CampReviewInsertDTO [member_id=" + member_id + ", board_title=" + board_title + ", board_category="
				+ board_category + ", board_content=" + board_content + ", camping_contentId=" + camping_contentId
				+ ", board_img1=" + board_img1 + ", board_img2=" + board_img2 + ", board_img3=" + board_img3
				+ ", board_img4=" + board_img4 + "]";
	}
	
	
	
}
