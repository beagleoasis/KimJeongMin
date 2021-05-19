package com.cambak21.domain;

public class ProdInfoVO {
	private int buyProduct_no;
	private String product_name;
	private String product_img1;
	private int buyProduct_qty;
	private int product_sellPrice;
	private int buyProduct_deliveriPay;
	private int buyProduct_totPrice;
	private String member_id;
	public int getBuyProduct_no() {
		return buyProduct_no;
	}
	public void setBuyProduct_no(int buyProduct_no) {
		this.buyProduct_no = buyProduct_no;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_img1() {
		return product_img1;
	}
	public void setProduct_img1(String product_img1) {
		this.product_img1 = product_img1;
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
	public int getBuyProduct_deliveriPay() {
		return buyProduct_deliveriPay;
	}
	public void setBuyProduct_deliveriPay(int buyProduct_deliveriPay) {
		this.buyProduct_deliveriPay = buyProduct_deliveriPay;
	}
	public int getBuyProduct_totPrice() {
		return buyProduct_totPrice;
	}
	public void setBuyProduct_totPrice(int buyProduct_totPrice) {
		this.buyProduct_totPrice = buyProduct_totPrice;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	@Override
	public String toString() {
		return "ProdInfo [buyProduct_no=" + buyProduct_no + ", product_name=" + product_name + ", product_img1="
				+ product_img1 + ", buyProduct_qty=" + buyProduct_qty + ", product_sellPrice=" + product_sellPrice
				+ ", buyProduct_deliveriPay=" + buyProduct_deliveriPay + ", buyProduct_totPrice=" + buyProduct_totPrice
				+ ", member_id=" + member_id + "]";
	}
	
}
