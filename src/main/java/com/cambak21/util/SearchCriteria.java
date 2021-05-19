package com.cambak21.util;

public class SearchCriteria {
	private String searchType; //검색 종류
	private String searchWord; // 검색어
	private String optionType;
	
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
	
	public String getOptionType() {
		return optionType;
	}
	public void setOptionType(String optionType) {
		this.optionType = optionType;
	}
	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", searchWord=" + searchWord + ", optionType=" + optionType
				+ "]";
	}
	
	
	
	
}
