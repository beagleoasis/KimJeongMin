package com.cambak21.util;

public class ProdListPagingCriteria {
	private int page;
	private int perPageNum;
	
	public ProdListPagingCriteria() {
		this.page = 1;
		this.perPageNum = 12;
		
	}
	
	public void setPage(int page) {
		if(page <= 0 ) {
			this.page = 1;
			return;
		}
		this.page =page;
	}
	
	public void setPerPageNum(int perPageNum) {
		if(perPageNum <= 0 || perPageNum > 60) {
			this.perPageNum = 12;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public int getPageStart() {
		return (this.page -1) * perPageNum;
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
