package com.cambak21.dto;

import java.util.Date;

public class AdminReplyProdReviewDTO {

	private int prodReview_no;
	private int product_id;
	private String member_id;
	private String prodReview_title;
	private int prodReview_grade;
	private Date prodReview_postDate;
	private String prodReview_isDelete;
	private Date prodReview_updateDate;
	private int prodReview_likeCnt;
	private int prodReview_replyCnt;
	private int replyProdReview_no;
	private int RprodReview_no;
	private String Rmember_id;
	private String replyProdReview_content;
	private Date replyProdReview_date;
	private String replyProdReview_isDelete;
	private String replyProdReview_repMember_id;
	public int getProdReview_no() {
		return prodReview_no;
	}
	public void setProdReview_no(int prodReview_no) {
		this.prodReview_no = prodReview_no;
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
	public String getProdReview_title() {
		return prodReview_title;
	}
	public void setProdReview_title(String prodReview_title) {
		this.prodReview_title = prodReview_title;
	}
	public int getProdReview_grade() {
		return prodReview_grade;
	}
	public void setProdReview_grade(int prodReview_grade) {
		this.prodReview_grade = prodReview_grade;
	}
	public Date getProdReview_postDate() {
		return prodReview_postDate;
	}
	public void setProdReview_postDate(Date prodReview_postDate) {
		this.prodReview_postDate = prodReview_postDate;
	}
	public String getProdReview_isDelete() {
		return prodReview_isDelete;
	}
	public void setProdReview_isDelete(String prodReview_isDelete) {
		this.prodReview_isDelete = prodReview_isDelete;
	}
	public Date getProdReview_updateDate() {
		return prodReview_updateDate;
	}
	public void setProdReview_updateDate(Date prodReview_updateDate) {
		this.prodReview_updateDate = prodReview_updateDate;
	}
	public int getProdReview_likeCnt() {
		return prodReview_likeCnt;
	}
	public void setProdReview_likeCnt(int prodReview_likeCnt) {
		this.prodReview_likeCnt = prodReview_likeCnt;
	}
	public int getProdReview_replyCnt() {
		return prodReview_replyCnt;
	}
	public void setProdReview_replyCnt(int prodReview_replyCnt) {
		this.prodReview_replyCnt = prodReview_replyCnt;
	}
	public int getReplyProdReview_no() {
		return replyProdReview_no;
	}
	public void setReplyProdReview_no(int replyProdReview_no) {
		this.replyProdReview_no = replyProdReview_no;
	}
	public int getRprodReview_no() {
		return RprodReview_no;
	}
	public void setRprodReview_no(int rprodReview_no) {
		RprodReview_no = rprodReview_no;
	}
	public String getRmember_id() {
		return Rmember_id;
	}
	public void setRmember_id(String rmember_id) {
		Rmember_id = rmember_id;
	}
	public String getReplyProdReview_content() {
		return replyProdReview_content;
	}
	public void setReplyProdReview_content(String replyProdReview_content) {
		this.replyProdReview_content = replyProdReview_content;
	}
	public Date getReplyProdReview_date() {
		return replyProdReview_date;
	}
	public void setReplyProdReview_date(Date replyProdReview_date) {
		this.replyProdReview_date = replyProdReview_date;
	}
	public String getReplyProdReview_isDelete() {
		return replyProdReview_isDelete;
	}
	public void setReplyProdReview_isDelete(String replyProdReview_isDelete) {
		this.replyProdReview_isDelete = replyProdReview_isDelete;
	}
	public String getReplyProdReview_repMember_id() {
		return replyProdReview_repMember_id;
	}
	public void setReplyProdReview_repMember_id(String replyProdReview_repMember_id) {
		this.replyProdReview_repMember_id = replyProdReview_repMember_id;
	}
	@Override
	public String toString() {
		return "AdminReplyProdReviewDTO [prodReview_no=" + prodReview_no + ", product_id=" + product_id + ", member_id="
				+ member_id + ", prodReview_title=" + prodReview_title + ", prodReview_grade=" + prodReview_grade
				+ ", prodReview_postDate=" + prodReview_postDate + ", prodReview_isDelete=" + prodReview_isDelete
				+ ", prodReview_updateDate=" + prodReview_updateDate + ", prodReview_likeCnt=" + prodReview_likeCnt
				+ ", prodReview_replyCnt=" + prodReview_replyCnt + ", replyProdReview_no=" + replyProdReview_no
				+ ", RprodReview_no=" + RprodReview_no + ", Rmember_id=" + Rmember_id + ", replyProdReview_content="
				+ replyProdReview_content + ", replyProdReview_date=" + replyProdReview_date
				+ ", replyProdReview_isDelete=" + replyProdReview_isDelete + ", replyProdReview_repMember_id="
				+ replyProdReview_repMember_id + "]";
	}
	
	
	
	
}
