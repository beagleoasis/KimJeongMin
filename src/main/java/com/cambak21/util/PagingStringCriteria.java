package com.cambak21.util;

public class PagingStringCriteria {
	private String page;
	private String perPageNum;
	
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(String perPageNum) {
		this.perPageNum = perPageNum;
	}
	
	@Override
	public String toString() {
		return "PagingStringCriteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	
}
