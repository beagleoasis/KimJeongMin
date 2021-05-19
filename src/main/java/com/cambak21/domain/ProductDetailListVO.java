package com.cambak21.domain;

import java.util.Date;

public class ProductDetailListVO {
	private int product_id;
	private String mainCategory_content;
	private String middleCategory_content;
	private String product_name;
	private int product_sellPrice;
	private int product_totQty;
	private Date product_date;
	private String product_img1;
	private int product_prodAvgScore;
	private int product_reviewNum;
	private String product_popularProduct;
	private String product_info;
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getMainCategory_content() {
		return mainCategory_content;
	}
	public void setMainCategory_content(String mainCategory_content) {
		this.mainCategory_content = mainCategory_content;
	}
	public String getMiddleCategory_content() {
		return middleCategory_content;
	}
	public void setMiddleCategory_content(String middleCategory_content) {
		this.middleCategory_content = middleCategory_content;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_sellPrice() {
		return product_sellPrice;
	}
	public void setProduct_sellPrice(int product_sellPrice) {
		this.product_sellPrice = product_sellPrice;
	}
	public int getProduct_totQty() {
		return product_totQty;
	}
	public void setProduct_totQty(int product_totQty) {
		this.product_totQty = product_totQty;
	}
	public Date getProduct_date() {
		return product_date;
	}
	public void setProduct_date(Date product_date) {
		this.product_date = product_date;
	}
	public String getProduct_img1() {
		return product_img1;
	}
	public void setProduct_img1(String product_img1) {
		this.product_img1 = product_img1;
	}
	public int getProduct_prodAvgScore() {
		return product_prodAvgScore;
	}
	public void setProduct_prodAvgScore(int product_prodAvgScore) {
		this.product_prodAvgScore = product_prodAvgScore;
	}
	public int getProduct_reviewNum() {
		return product_reviewNum;
	}
	public void setProduct_reviewNum(int product_reviewNum) {
		this.product_reviewNum = product_reviewNum;
	}
	public String getProduct_popularProduct() {
		return product_popularProduct;
	}
	public void setProduct_popularProduct(String product_popularProduct) {
		this.product_popularProduct = product_popularProduct;
	}
	public String getProduct_info() {
		return product_info;
	}
	public void setProduct_info(String product_info) {
		this.product_info = product_info;
	}
	
	@Override
	public String toString() {
		return "ProductDetailListVO [product_id=" + product_id + ", mainCategory_content=" + mainCategory_content
				+ ", middleCategory_content=" + middleCategory_content + ", product_name=" + product_name
				+ ", product_sellPrice=" + product_sellPrice + ", product_totQty=" + product_totQty + ", product_date="
				+ product_date + ", product_img1=" + product_img1 + ", product_prodAvgScore=" + product_prodAvgScore
				+ ", product_reviewNum=" + product_reviewNum + ", product_popularProduct=" + product_popularProduct
				+ ", product_info=" + product_info + "]";
	}
	
}
