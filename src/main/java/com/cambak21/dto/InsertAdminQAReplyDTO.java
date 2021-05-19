package com.cambak21.dto;

public class InsertAdminQAReplyDTO {
	private int product_id;
	private String member_id;
	private String prodQA_title;
	private String prodQA_content;
	private int prodQA_ref;
	private int prodQA_refOrder;
	private int prodQA_step;
	private String prodQA_img;
	private String prodQA_completed;
	private String prodQA_isSecret;
	private String prodQA_secretPassword;
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getProdQA_title() {
		return prodQA_title;
	}
	public void setProdQA_title(String prodQA_title) {
		this.prodQA_title = prodQA_title;
	}
	public String getProdQA_content() {
		return prodQA_content;
	}
	public void setProdQA_content(String prodQA_content) {
		this.prodQA_content = prodQA_content;
	}
	public int getProdQA_ref() {
		return prodQA_ref;
	}
	public void setProdQA_ref(int prodQA_ref) {
		this.prodQA_ref = prodQA_ref;
	}
	public int getProdQA_refOrder() {
		return prodQA_refOrder;
	}
	public void setProdQA_refOrder(int prodQA_refOrder) {
		this.prodQA_refOrder = prodQA_refOrder;
	}
	public int getProdQA_step() {
		return prodQA_step;
	}
	public void setProdQA_step(int prodQA_step) {
		this.prodQA_step = prodQA_step;
	}
	public String getProdQA_img() {
		return prodQA_img;
	}
	public void setProdQA_img(String prodQA_img) {
		this.prodQA_img = prodQA_img;
	}
	public String getProdQA_completed() {
		return prodQA_completed;
	}
	public void setProdQA_completed(String prodQA_completed) {
		this.prodQA_completed = prodQA_completed;
	}
	public String getProdQA_isSecret() {
		return prodQA_isSecret;
	}
	public void setProdQA_isSecret(String prodQA_isSecret) {
		this.prodQA_isSecret = prodQA_isSecret;
	}
	public String getProdQA_secretPassword() {
		return prodQA_secretPassword;
	}
	public void setProdQA_secretPassword(String prodQA_secretPassword) {
		this.prodQA_secretPassword = prodQA_secretPassword;
	}
	
	@Override
	public String toString() {
		return "InsertAdminQAReply [product_id=" + product_id + ", member_id=" + member_id + ", prodQA_title="
				+ prodQA_title + ", prodQA_content=" + prodQA_content + ", prodQA_ref=" + prodQA_ref
				+ ", prodQA_refOrder=" + prodQA_refOrder + ", prodQA_step=" + prodQA_step + ", prodQA_img=" + prodQA_img
				+ ", prodQA_completed=" + prodQA_completed + ", prodQA_isSecret=" + prodQA_isSecret
				+ ", prodQA_secretPassword=" + prodQA_secretPassword + "]";
	}
	
}
