package com.cambak21.domain;

import java.util.Date;

public class OrderManagementSearchVO {
	private String checkOption;
	private String checkOptionSearch;
	private String searchDateRange = "all";
	private Date startDate;
	private Date endDate;
	private String productInfo;
	private String productInfoSearch;
	private String csOrderRange = "check";
	private String purchaseStatus;
	private String orderStatus;
	private String csStatus;
	
	public String getCheckOption() {
		return checkOption;
	}
	public void setCheckOption(String checkOption) {
		this.checkOption = checkOption;
	}
	public String getCheckOptionSearch() {
		return checkOptionSearch;
	}
	public void setCheckOptionSearch(String checkOptionSearch) {
		this.checkOptionSearch = checkOptionSearch;
	}
	public String getSearchDateRange() {
		return searchDateRange;
	}
	public void setSearchDateRange(String searchDateRange) {
		this.searchDateRange = searchDateRange;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getProductInfo() {
		return productInfo;
	}
	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}
	public String getProductInfoSearch() {
		return productInfoSearch;
	}
	public void setProductInfoSearch(String productInfoSearch) {
		this.productInfoSearch = productInfoSearch;
	}
	public String getCsOrderRange() {
		return csOrderRange;
	}
	public void setCsOrderRange(String csOrderRange) {
		this.csOrderRange = csOrderRange;
	}
	public String getPurchaseStatus() {
		return purchaseStatus;
	}
	public void setPurchaseStatus(String purchaseStatus) {
		this.purchaseStatus = purchaseStatus;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getCsStatus() {
		return csStatus;
	}
	public void setCsStatus(String csStatus) {
		this.csStatus = csStatus;
	}
	
	@Override
	public String toString() {
		return "OrderManagementSearchVO [checkOption=" + checkOption + ", checkOptionSearch=" + checkOptionSearch
				+ ", searchDateRange=" + searchDateRange + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", productInfo=" + productInfo + ", productInfoSearch=" + productInfoSearch + ", csOrderRange="
				+ csOrderRange + ", purchaseStatus=" + purchaseStatus + ", orderStatus=" + orderStatus + ", csStatus="
				+ csStatus + "]";
	}
	
}
