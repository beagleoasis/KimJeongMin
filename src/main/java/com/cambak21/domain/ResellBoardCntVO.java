package com.cambak21.domain;

public class ResellBoardCntVO {
	private int resellBoardWriteCnt;
	private int resellBoardLikeCnt;
	private int resellBoardReplyCnt;
	
	public int getResellBoardWriteCnt() {
		return resellBoardWriteCnt;
	}
	public void setResellBoardWriteCnt(int resellBoardWriteCnt) {
		this.resellBoardWriteCnt = resellBoardWriteCnt;
	}
	public int getResellBoardLikeCnt() {
		return resellBoardLikeCnt;
	}
	public void setResellBoardLikeCnt(int resellBoardLikeCnt) {
		this.resellBoardLikeCnt = resellBoardLikeCnt;
	}
	public int getResellBoardReplyCnt() {
		return resellBoardReplyCnt;
	}
	public void setResellBoardReplyCnt(int resellBoardReplyCnt) {
		this.resellBoardReplyCnt = resellBoardReplyCnt;
	}
	
	@Override
	public String toString() {
		return "ResellBoardCntVO [resellBoardWriteCnt=" + resellBoardWriteCnt + ", resellBoardLikeCnt="
				+ resellBoardLikeCnt + ", resellBoardReplyCnt=" + resellBoardReplyCnt + "]";
	}
	
	
}
