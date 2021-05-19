package com.cambak21.dto;

public class ProdReviewWritingInfoDTO {
	
	private int product_id;
	private int buyProduct_no;
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getBuyProduct_no() {
		return buyProduct_no;
	}
	public void setBuyProduct_no(int buyProduct_no) {
		this.buyProduct_no = buyProduct_no;
	}
	
	@Override
	public String toString() {
		return "ProdReviewWritingInfoDTO [product_id=" + product_id + ", buyProduct_no=" + buyProduct_no
				+ ", getProduct_id()=" + getProduct_id() + ", getBuyProduct_no()=" + getBuyProduct_no()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
	
}
