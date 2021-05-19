package com.cambak21.dto;

public class UpdateBuyProductIsFinishedDTO {
	private String buyProduct_isFinished;
	private int buyProduct_no;
	
	public String getBuyProduct_isFinished() {
		return buyProduct_isFinished;
	}
	public void setBuyProduct_isFinished(String buyProduct_isFinished) {
		this.buyProduct_isFinished = buyProduct_isFinished;
	}
	public int getBuyProduct_no() {
		return buyProduct_no;
	}
	public void setBuyProduct_no(int buyProduct_no) {
		this.buyProduct_no = buyProduct_no;
	}
	
	@Override
	public String toString() {
		return "UpdateBuyProductIsFinishedDTO [buyProduct_isFinished=" + buyProduct_isFinished + ", buyProduct_no="
				+ buyProduct_no + "]";
	}
	
}
