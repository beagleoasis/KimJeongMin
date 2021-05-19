package com.cambak21.dto;

public class UpdateProductDTO {
	private int middleCategory_id;
	private int mainCategory_id;
	private String product_name;
	private int product_sellPrice;
	private String product_detail;
	private String product_img1;
	private String product_img2;
	private String product_img3;
	private String product_img4;
	private String product_show;
	private String product_title;

	public int getMiddleCategory_id() {
		return middleCategory_id;
	}

	public void setMiddleCategory_id(int middleCategory_id) {
		this.middleCategory_id = middleCategory_id;
	}

	public int getMainCategory_id() {
		return mainCategory_id;
	}

	public void setMainCategory_id(int mainCategory_id) {
		this.mainCategory_id = mainCategory_id;
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

	public String getProduct_detail() {
		return product_detail;
	}

	public void setProduct_detail(String product_detail) {
		this.product_detail = product_detail;
	}

	public String getProduct_img1() {
		return product_img1;
	}

	public void setProduct_img1(String product_img1) {
		this.product_img1 = product_img1;
	}

	public String getProduct_img2() {
		return product_img2;
	}

	public void setProduct_img2(String product_img2) {
		this.product_img2 = product_img2;
	}

	public String getProduct_img3() {
		return product_img3;
	}

	public void setProduct_img3(String product_img3) {
		this.product_img3 = product_img3;
	}

	public String getProduct_img4() {
		return product_img4;
	}

	public void setProduct_img4(String product_img4) {
		this.product_img4 = product_img4;
	}

	public String getProduct_show() {
		return product_show;
	}

	public void setProduct_show(String product_show) {
		this.product_show = product_show;
	}

	public String getProduct_title() {
		return product_title;
	}

	public void setProduct_title(String product_title) {
		this.product_title = product_title;
	}

	@Override
	public String toString() {
		return "UpdateProductDTO [middleCategory_id=" + middleCategory_id + ", mainCategory_id=" + mainCategory_id
				+ ", product_name=" + product_name + ", product_sellPrice=" + product_sellPrice + ", product_detail="
				+ product_detail + ", product_img1=" + product_img1 + ", product_img2=" + product_img2
				+ ", product_img3=" + product_img3 + ", product_img4=" + product_img4 + ", product_show=" + product_show
				+ ", product_title=" + product_title + "]";
	}

}
