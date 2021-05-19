package com.cambak21.domain;

public class changeStockVO {
	private int product_id;
	private int buyProduct_qty;
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getBuyProduct_qty() {
		return buyProduct_qty;
	}
	public void setBuyProduct_qty(int buyProduct_qty) {
		this.buyProduct_qty = buyProduct_qty;
	}
	
	@Override
	public String toString() {
		return "changeStockVO [product_id=" + product_id + ", buyProduct_qty=" + buyProduct_qty + "]";
	}
	
}
