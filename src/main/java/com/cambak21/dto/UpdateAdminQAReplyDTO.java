package com.cambak21.dto;

public class UpdateAdminQAReplyDTO {
	private String prodQA_content;
	private String prodQA_img;
	
	public String getProdQA_content() {
		return prodQA_content;
	}
	public void setProdQA_content(String prodQA_content) {
		this.prodQA_content = prodQA_content;
	}
	public String getProdQA_img() {
		return prodQA_img;
	}
	public void setProdQA_img(String prodQA_img) {
		this.prodQA_img = prodQA_img;
	}
	
	@Override
	public String toString() {
		return "UpdateAdminQAReply [prodQA_content=" + prodQA_content + ", prodQA_img=" + prodQA_img + "]";
	}
	
	
}
