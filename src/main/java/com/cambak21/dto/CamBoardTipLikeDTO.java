package com.cambak21.dto;

public class CamBoardTipLikeDTO {
	private int board_no;
	private String member_id;
	private String likeBtn_result;
	
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
	public String getLikeBtn_result() {
		return likeBtn_result;
	}
	public void setLikeBtn_result(String likeBtn_result) {
		this.likeBtn_result = likeBtn_result;
	}
	
	@Override
	public String toString() {
		return "CamBoardTipLikeDTO [board_no=" + board_no + ", member_id=" + member_id + ", likeBtn_result="
				+ likeBtn_result + "]";
	}
	
}
