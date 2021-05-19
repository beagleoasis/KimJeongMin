package com.cambak21.domain;

public class MainCategoryVO {
	private String mainCategory_id;
	private String mainCategory_content;
	
	
	public String getMainCategory_id() {
		return mainCategory_id;
	}
	public void setMainCategory_id(String mainCategory_id) {
		this.mainCategory_id = mainCategory_id;
	}
	public String getMainCategory_content() {
		return mainCategory_content;
	}
	public void setMainCategory_content(String mainCategory_content) {
		this.mainCategory_content = mainCategory_content;
	}
	
	@Override
	public String toString() {
		return "MainCategoryVO [mainCategory_id=" + mainCategory_id + ", mainCategory_content=" + mainCategory_content
				+ "]";
	}


	
}
