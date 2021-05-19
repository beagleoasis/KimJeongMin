package com.cambak21.dto;

public class OrderInfoModifyDTO {
	private String deliveryInfo;
	private String purchaseStatus;
	private String csStatus;
	
	public String getDeliveryInfo() {
		return deliveryInfo;
	}
	public void setDeliveryInfo(String deliveryInfo) {
		this.deliveryInfo = deliveryInfo;
	}
	public String getPurchaseStatus() {
		return purchaseStatus;
	}
	public void setPurchaseStatus(String purchaseStatus) {
		this.purchaseStatus = purchaseStatus;
	}
	public String getCsStatus() {
		return csStatus;
	}
	public void setCsStatus(String csStatus) {
		this.csStatus = csStatus;
	}
	
	@Override
	public String toString() {
		return "OrderInfoModifyDTO [deliveryInfo=" + deliveryInfo + ", purchaseStatus=" + purchaseStatus + ", csStatus="
				+ csStatus + "]";
	}
	
}
