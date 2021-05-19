package com.cambak21.dto;

public class mallMainTotalDTO {

	private int totcount;
	private String mainCategory_id;
	public int getTotcount() {
		return totcount;
	}
	public void setTotcount(int totcount) {
		this.totcount = totcount;
	}
	public String getMainCategory_id() {
		return mainCategory_id;
	}
	public void setMainCategory_id(String mainCategory_id) {
		this.mainCategory_id = mainCategory_id;
	}
	@Override
	public String toString() {
		return "mallMainTotalDTO [totcount=" + totcount + ", mainCategory_id=" + mainCategory_id + "]";
	}
	
	
}
