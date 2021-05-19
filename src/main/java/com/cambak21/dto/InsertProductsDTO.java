package com.cambak21.dto;

public class InsertProductsDTO {
	private int middleCategory_id;
	private int mainCategory_id;
	private String product_name;
	private int product_purchPrice;
	private int product_purchaseQty;
	private int product_totQty;
	private int product_sellPrice;
	private String product_factory;
	private String product_detail;
	private String product_img1;
	private String product_img2;
	private String product_img3;
	private String product_img4;
	private String title;

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

	public int getProduct_purchPrice() {
		return product_purchPrice;
	}

	public void setProduct_purchPrice(int product_purchPrice) {
		this.product_purchPrice = product_purchPrice;
	}

	public int getProduct_purchaseQty() {
		return product_purchaseQty;
	}

	public void setProduct_purchaseQty(int product_purchaseQty) {
		this.product_purchaseQty = product_purchaseQty;
	}

	public int getProduct_totQty() {
		return product_totQty;
	}

	public void setProduct_totQty(int product_totQty) {
		this.product_totQty = product_totQty;
	}

	public int getProduct_sellPrice() {
		return product_sellPrice;
	}

	public void setProduct_sellPrice(int product_sellPrice) {
		this.product_sellPrice = product_sellPrice;
	}

	public String getProduct_factory() {
		return product_factory;
	}

	public void setProduct_factory(String product_factory) {
		this.product_factory = product_factory;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "InsertProductsDTO [middleCategory_id=" + middleCategory_id + ", mainCategory_id=" + mainCategory_id
				+ ", product_name=" + product_name + ", product_purchPrice=" + product_purchPrice
				+ ", product_purchaseQty=" + product_purchaseQty + ", product_totQty=" + product_totQty
				+ ", product_sellPrice=" + product_sellPrice + ", product_factory=" + product_factory
				+ ", product_detail=" + product_detail + ", product_img1=" + product_img1 + ", product_img2="
				+ product_img2 + ", product_img3=" + product_img3 + ", product_img4=" + product_img4 + ", title="
				+ title + "]";
	}

}
