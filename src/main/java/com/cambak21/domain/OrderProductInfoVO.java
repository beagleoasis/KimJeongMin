package com.cambak21.domain;

public class OrderProductInfoVO {
	private int product_id;
	private String mainCategory_content;
	private String middleCategory_content;
	private String product_name;
	private String product_factory;
	private int buyProduct_qty;
	private int product_sellPrice;
	private int buyProduct_totPrice;
	
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
	public String getProduct_factory() {
		return product_factory;
	}
	public void setProduct_factory(String product_factory) {
		this.product_factory = product_factory;
	}
	public int getBuyProduct_qty() {
		return buyProduct_qty;
	}
	public void setBuyProduct_qty(int buyProduct_qty) {
		this.buyProduct_qty = buyProduct_qty;
	}
	public int getProduct_sellPrice() {
		return product_sellPrice;
	}
	public void setProduct_sellPrice(int product_sellPrice) {
		this.product_sellPrice = product_sellPrice;
	}
	public int getBuyProduct_totPrice() {
		return buyProduct_totPrice;
	}
	public void setBuyProduct_totPrice(int buyProduct_totPrice) {
		this.buyProduct_totPrice = buyProduct_totPrice;
	}
	
	@Override
	public String toString() {
		return "OrderProductInfoVO [product_id=" + product_id + ", mainCategory_content=" + mainCategory_content
				+ ", middleCategory_content=" + middleCategory_content + ", product_name=" + product_name
				+ ", product_factory=" + product_factory + ", buyProduct_qty=" + buyProduct_qty + ", product_sellPrice="
				+ product_sellPrice + ", buyProduct_totPrice=" + buyProduct_totPrice + "]";
	}
	
}
