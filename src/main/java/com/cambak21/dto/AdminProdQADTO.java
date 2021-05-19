package com.cambak21.dto;

import java.util.Date;

public class AdminProdQADTO {
	private int prodQA_no;
	private int product_id;
	private String member_id;
	private String prodQA_title;
	private String prodQA_content;
	private Date prodQA_date;
	private String prodQA_completed;
	private int prodQA_likeCnt;
	private int prodQA_viewCnt;
	private String prodQA_isSecret;
	private String prodQA_secretPassword;
	private String prodQA_isDelete;
	private String prodQA_category;
	private String CategoryLink;
	public int getProdQA_no() {
		return prodQA_no;
	}
	public void setProdQA_no(int prodQA_no) {
		this.prodQA_no = prodQA_no;
	}
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
	public int getProdQA_likeCnt() {
		return prodQA_likeCnt;
	}
	public void setProdQA_likeCnt(int prodQA_likeCnt) {
		this.prodQA_likeCnt = prodQA_likeCnt;
	}
	public int getProdQA_viewCnt() {
		return prodQA_viewCnt;
	}
	public void setProdQA_viewCnt(int prodQA_viewCnt) {
		this.prodQA_viewCnt = prodQA_viewCnt;
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
	public String getProdQA_isDelete() {
		return prodQA_isDelete;
	}
	public void setProdQA_isDelete(String prodQA_isDelete) {
		this.prodQA_isDelete = prodQA_isDelete;
	}
	public String getProdQA_category() {
		return prodQA_category;
	}
	public void setProdQA_category(String prodQA_category) {
		this.prodQA_category = prodQA_category;
	}
	public String getCategoryLink() {
		return CategoryLink;
	}
	public void setCategoryLink(String categoryLink) {
		CategoryLink = categoryLink;
	}
	@Override
	public String toString() {
		return "AdminProdQADTO [prodQA_no=" + prodQA_no + ", product_id=" + product_id + ", member_id=" + member_id
				+ ", prodQA_title=" + prodQA_title + ", prodQA_content=" + prodQA_content + ", prodQA_date="
				+ prodQA_date + ", prodQA_completed=" + prodQA_completed + ", prodQA_likeCnt=" + prodQA_likeCnt
				+ ", prodQA_viewCnt=" + prodQA_viewCnt + ", prodQA_isSecret=" + prodQA_isSecret
				+ ", prodQA_secretPassword=" + prodQA_secretPassword + ", prodQA_isDelete=" + prodQA_isDelete
				+ ", prodQA_category=" + prodQA_category + ", CategoryLink=" + CategoryLink + "]";
	}
	
	
	
	
	
	
	
	
	
}
