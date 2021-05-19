package com.cambak21.util;

public class PagingParam {
	
	private int totalCount;	//전체 게시글 수
	private int startPage;// 보여주는 페이징 번호의 시작페이지
	private int endPage; // 끝 페이지(보여주는 페이징 번호의)
	private boolean prev; // 이전페이지
	private boolean next; // 다음 페이지로
	private int displayPageNum = 10; //보여줄 페이지 수 (block)
	private int tempEndPage;
	private PagingCriteria cri;
	
	public void setCri(PagingCriteria cri) {
		this.cri = cri;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		
		this.calcParam();
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	
	private void calcParam() {
		//블럭화를 했을 경우 실제 endPage
		this.endPage = (int)(Math.ceil(cri.getPage() / (double)this.displayPageNum) * displayPageNum);
		
		//게시물 수에 따른 실제 endPage
		tempEndPage = (int)(Math.ceil(this.totalCount / (double)cri.getPerPageNum()));
		
		this.startPage = (this.endPage - this.displayPageNum) +1;
		
		if(this.endPage > tempEndPage) {
			this.endPage = tempEndPage;
		}
		
		this.prev = (cri.getPage() == 1)? false:true;
		this.next = ((cri.getPage() * cri.getPerPageNum()) >= this.totalCount)? false:true;
		
	}

	public int getTempEndPage() {
		return tempEndPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public PagingCriteria getCri() {
		return cri;
	}

	@Override
	public String toString() {
		return "PagingParam [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", cri=" + cri + "]";
	}
	
	
	
}
