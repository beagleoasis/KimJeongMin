package com.cambak21.dto;


public class AdminProductListDTO {
	private String mainCategory_id;
	private String middleCategory_id;
	private String product_show;
	private String checkLowDate;
	private String checkHighDate;
	public String getMainCategory_id() {
		return mainCategory_id;
	}
	public void setMainCategory_id(String mainCategory_id) {
		this.mainCategory_id = mainCategory_id;
	}
	public String getMiddleCategory_id() {
		return middleCategory_id;
	}
	public void setMiddleCategory_id(String middleCategory_id) {
		this.middleCategory_id = middleCategory_id;
	}
	public String getProduct_show() {
		return product_show;
	}
	public void setProduct_show(String product_show) {
		this.product_show = product_show;
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
	@Override
	public String toString() {
		return "AdminProductListDTO [mainCategory_id=" + mainCategory_id + ", middleCategory_id=" + middleCategory_id
				+ ", product_show=" + product_show + ", checkLowDate=" + checkLowDate + ", checkHighDate="
				+ checkHighDate + ", getMainCategory_id()=" + getMainCategory_id() + ", getMiddleCategory_id()="
				+ getMiddleCategory_id() + ", getProduct_show()=" + getProduct_show() + ", getCheckLowDate()="
				+ getCheckLowDate() + ", getCheckHighDate()=" + getCheckHighDate() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}

	
	
	
	
	
	
}
