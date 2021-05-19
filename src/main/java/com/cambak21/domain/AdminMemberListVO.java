package com.cambak21.domain;

import java.util.Date;

public class AdminMemberListVO {
	private String memberOption;
	private String memberOptionSearchWord;
	private String dateOption;
	private String checkLowDate;
	private String checkHighDate;
	private String PriceOption;
	private String checkHighNum;
	private String checkLowNum;
	private String genderResult;
	private String AResult;
	private String BResult;
	private String CResult;
	
	public String getMemberOption() {
		return memberOption;
	}
	public void setMemberOption(String memberOption) {
		this.memberOption = memberOption;
	}
	public String getMemberOptionSearchWord() {
		return memberOptionSearchWord;
	}
	public void setMemberOptionSearchWord(String memberOptionSearchWord) {
		this.memberOptionSearchWord = memberOptionSearchWord;
	}
	public String getDateOption() {
		return dateOption;
	}
	public void setDateOption(String dateOption) {
		this.dateOption = dateOption;
	}
	public String getCheckLowDate() {
		return checkLowDate;
	}
	public void setCheckLowDate(String checkLowDate) {
		this.checkLowDate = checkLowDate;
	}
	public String getCheckHighDate() {
		return checkHighDate;
	}
	public void setCheckHighDate(String checkHighDate) {
		this.checkHighDate = checkHighDate;
	}
	public String getPriceOption() {
		return PriceOption;
	}
	public void setPriceOption(String priceOption) {
		PriceOption = priceOption;
	}
	public String getCheckHighNum() {
		return checkHighNum;
	}
	public void setCheckHighNum(String checkHighNum) {
		this.checkHighNum = checkHighNum;
	}
	public String getCheckLowNum() {
		return checkLowNum;
	}
	public void setCheckLowNum(String checkLowNum) {
		this.checkLowNum = checkLowNum;
	}
	public String getGenderResult() {
		return genderResult;
	}
	public void setGenderResult(String genderResult) {
		this.genderResult = genderResult;
	}
	public String getAResult() {
		return AResult;
	}
	public void setAResult(String aResult) {
		AResult = aResult;
	}
	public String getBResult() {
		return BResult;
	}
	public void setBResult(String bResult) {
		BResult = bResult;
	}
	public String getCResult() {
		return CResult;
	}
	public void setCResult(String cResult) {
		CResult = cResult;
	}
	
	@Override
	public String toString() {
		return "AdminMemberListVO [memberOption=" + memberOption + ", memberOptionSearchWord=" + memberOptionSearchWord
				+ ", dateOption=" + dateOption + ", checkLowDate=" + checkLowDate + ", checkHighDate=" + checkHighDate
				+ ", PriceOption=" + PriceOption + ", checkHighNum=" + checkHighNum + ", checkLowNum=" + checkLowNum
				+ ", genderResult=" + genderResult + ", AResult=" + AResult + ", BResult=" + BResult + ", CResult="
				+ CResult + "]";
	}
	
}
