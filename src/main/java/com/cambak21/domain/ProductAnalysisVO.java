package com.cambak21.domain;

public class ProductAnalysisVO {
	private int buyProduct_totPrice;
	private int product_count;
	private String product_name;
	private String payment_date;
	public int getBuyProduct_totPrice() {
		return buyProduct_totPrice;
	}
	public void setBuyProduct_totPrice(int buyProduct_totPrice) {
		this.buyProduct_totPrice = buyProduct_totPrice;
	}
	public int getProduct_count() {
		return product_count;
	}
	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}
	@Override
	public String toString() {
		return "ProductAnalisysVO [buyProduct_totPrice=" + buyProduct_totPrice + ", product_count=" + product_count
				+ ", product_name=" + product_name + ", payment_date=" + payment_date + "]";
	}
	
	
}
