package com.cambak21.domain;

public class MyPageAllCountVO {
	private int boardCnt;
	private int resellBoardCnt;
	private int replyCnt;
	private int resellReplyCnt;
	private int likeCnt;
	private int resellLikeCnt;
	private int myQuestion;
	
	public int getBoardCnt() {
		return boardCnt;
	}
	public void setBoardCnt(int boardCnt) {
		this.boardCnt = boardCnt;
	}
	public int getResellBoardCnt() {
		return resellBoardCnt;
	}
	public void setResellBoardCnt(int resellBoardCnt) {
		this.resellBoardCnt = resellBoardCnt;
	}
	public int getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	public int getResellReplyCnt() {
		return resellReplyCnt;
	}
	public void setResellReplyCnt(int resellReplyCnt) {
		this.resellReplyCnt = resellReplyCnt;
	}
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}
	public int getResellLikeCnt() {
		return resellLikeCnt;
	}
	public void setResellLikeCnt(int resellLikeCnt) {
		this.resellLikeCnt = resellLikeCnt;
	}
	public int getMyQuestion() {
		return myQuestion;
	}
	public void setMyQuestion(int myQuestion) {
		this.myQuestion = myQuestion;
	}
	
	@Override
	public String toString() {
		return "MyPageAllCountVO [boardCnt=" + boardCnt + ", resellBoardCnt=" + resellBoardCnt + ", replyCnt="
				+ replyCnt + ", resellReplyCnt=" + resellReplyCnt + ", likeCnt=" + likeCnt + ", resellLikeCnt="
				+ resellLikeCnt + ", myQuestion=" + myQuestion + "]";
	}
	
}
