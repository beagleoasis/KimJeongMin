package com.cambak21.util;

public class BoardAdminSearchCriteria {

	private String goStartDate;
	private String goEndDate;
	private String board_category;
	private String searchboardType;
	private String searchTxtValue;
	
	
	public BoardAdminSearchCriteria(String goStartDate, String goEndDate, String board_category, String searchboardType,
			String searchTxtValue) {
		super();
		this.goStartDate = goStartDate;
		this.goEndDate = goEndDate;
		this.board_category = board_category;
		this.searchboardType = searchboardType;
		this.searchTxtValue = searchTxtValue;
	}
	
	public BoardAdminSearchCriteria(String goStartDate, String goEndDate, String board_category) {
		
		super();
		this.goStartDate = goStartDate;
		this.goEndDate = goEndDate;
		this.board_category = board_category;
	
	}
	
	
	
	
	
	
	public String getGoStartDate() {
		return goStartDate;
	}
	public void setGoStartDate(String goStartDate) {
		this.goStartDate = goStartDate;
	}
	public String getGoEndDate() {
		return goEndDate;
	}
	public void setGoEndDate(String goEndDate) {
		this.goEndDate = goEndDate;
	}
	public String getBoard_category() {
		return board_category;
	}
	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}
	public String getSearchboardType() {
		return searchboardType;
	}
	public void setSearchboardType(String searchboardType) {
		this.searchboardType = searchboardType;
	}
	public String getSearchTxtValue() {
		return searchTxtValue;
	}
	public void setSearchTxtValue(String searchTxtValue) {
		this.searchTxtValue = searchTxtValue;
	}
	@Override
	public String toString() {
		return "BoardAdminSearchCriteria [goStartDate=" + goStartDate + ", goEndDate=" + goEndDate + ", board_category="
				+ board_category + ", searchboardType=" + searchboardType + ", searchTxtValue=" + searchTxtValue + "]";
	}
	
	
}
