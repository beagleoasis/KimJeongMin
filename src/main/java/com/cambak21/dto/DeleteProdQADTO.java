package com.cambak21.dto;

public class DeleteProdQADTO {
	private int prodQA_no;
	private String isDelete;
	
	public int getProdQA_no() {
		return prodQA_no;
	}
	public void setProdQA_no(int prodQA_no) {
		this.prodQA_no = prodQA_no;
	}
	public String getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(String isDelete) {
		this.isDelete = isDelete;
	}
	
	@Override
	public String toString() {
		return "DeleteProdQADTO [prodQA_no=" + prodQA_no + ", isDelete=" + isDelete + "]";
	}
	
}
