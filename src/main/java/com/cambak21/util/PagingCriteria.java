package com.cambak21.util;

public class PagingCriteria {
	private int page;	//시작 페이지
	private int perPageNum;
	
	public PagingCriteria() {
		this.page = 1;
		this.perPageNum = 10;
		
	}
	
	public void setPage(int page) {
		if(page <= 0 ) {
			this.page = 1;
			return;
		}
		this.page =page;
	}
	
	public void setPerPageNum(int perPageNum) {
		if(perPageNum <= 0 || perPageNum > 81) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public int getPageStart() {
		return (this.page -1) * 10;
	}
	
	public int getListCount(int count) {
		return (this.page - 1) * count;
	}
	
	public int getPerPageNum() {
		return this.perPageNum;
	}

	@Override
	public String toString() {
		return "PagingCriteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	
	public int getPage() {
		return this.page;
	}
}
