package com.cambak21.domain;

import java.util.Date;

public class MyWriteQnAVO {
	private int product_id;
	private String product_name;
	private String prodQA_content;
	private Date prodQA_date;
	private String prodQA_completed;

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProdQA_content() {
		return prodQA_content;
	}

	public void setProdQA_content(String prodQA_content) {
		this.prodQA_content = prodQA_content;
	}

	public Date getProdQA_date() {
		return prodQA_date;
	}

	public void setProdQA_date(Date prodQA_date) {
		this.prodQA_date = prodQA_date;
	}

	public String getProdQA_completed() {
		return prodQA_completed;
	}

	public void setProdQA_completed(String prodQA_completed) {
		this.prodQA_completed = prodQA_completed;
	}

	@Override
	public String toString() {
		return "MyWriteQnAVO [product_id=" + product_id + ", product_name=" + product_name + ", prodQA_content="
				+ prodQA_content + ", prodQA_date=" + prodQA_date + ", prodQA_completed=" + prodQA_completed + "]";
	}

}
