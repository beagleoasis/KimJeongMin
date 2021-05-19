package com.cambak21.dto;

public class InsertBuyProductDTO {
	private String member_id;
	private int bucket_no;
	private String product_name;
	private int buyProduct_qty;
	private int product_sellPrice;
	private int buyProduct_totPrice;
	private int product_id;

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getBucket_no() {
		return bucket_no;
	}

	public void setBucket_no(int bucket_no) {
		this.bucket_no = bucket_no;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
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

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	@Override
	public String toString() {
		return "InsertBuyProductDTO [member_id=" + member_id + ", bucket_no=" + bucket_no + ", product_name="
				+ product_name + ", buyProduct_qty=" + buyProduct_qty + ", product_sellPrice=" + product_sellPrice
				+ ", buyProduct_totPrice=" + buyProduct_totPrice + ", product_id=" + product_id + "]";
	}

}
