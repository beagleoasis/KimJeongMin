package com.cambak21.domain;

public class MiddleCategoryVO {
	private int middleCategory_id;
	private String middleCategory_content;
	private int mainCategory_id;
	
	public int getMiddleCategory_id() {
		return middleCategory_id;
	}
	public void setMiddleCategory_id(int middleCategory_id) {
		this.middleCategory_id = middleCategory_id;
	}
	public String getMiddleCategory_content() {
		return middleCategory_content;
	}
	public void setMiddleCategory_content(String middleCategory_content) {
		this.middleCategory_content = middleCategory_content;
	}
	public int getMainCategory_id() {
		return mainCategory_id;
	}
	public void setMainCategory_id(int mainCategory_id) {
		this.mainCategory_id = mainCategory_id;
	}
	
	@Override
	public String toString() {
		return "MiddleCategory [middleCategory_id=" + middleCategory_id + ", middleCategory_content="
				+ middleCategory_content + ", mainCategory_id=" + mainCategory_id + "]";
	}
	
}
