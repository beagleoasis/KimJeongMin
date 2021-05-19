package com.cambak21.domain;

public class SearchCampingTipVO {
	private String member_id;
	private String searchType;
	private String searchWord;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	
	@Override
	public String toString() {
		return "SearchCampingTipVO [member_id=" + member_id + ", searchType=" + searchType + ", searchWord="
				+ searchWord + "]";
	}
	
}
