package com.cambak21.domain;

public class ProductDetailParamVO {
	private String mainCategory_id;
	private String middleCategory_id;
	private String prodRankOrder;
	private String priceRangeOrder;
	private String maxPrice;
	private String minPrice;
	private String ratingSorter;
	private String prodScore;
	
	public String getMainCategory_id() {
		return mainCategory_id;
	}
	public void setMainCategory_id(String mainCategory_id) {
		this.mainCategory_id = mainCategory_id;
	}
	public String getMiddleCategory_id() {
		return middleCategory_id;
	}
	public void setMiddleCategory_id(String middleCategory_id) {
		this.middleCategory_id = middleCategory_id;
	}
	public String getProdRankOrder() {
		return prodRankOrder;
	}
	public void setProdRankOrder(String prodRankOrder) {
		this.prodRankOrder = prodRankOrder;
	}
	public String getPriceRangeOrder() {
		return priceRangeOrder;
	}
	public void setPriceRangeOrder(String priceRangeOrder) {
		this.priceRangeOrder = priceRangeOrder;
	}
	public String getMaxPrice() {
		return maxPrice;
	}
	public void setMaxPrice(String maxPrice) {
		this.maxPrice = maxPrice;
	}
	public String getMinPrice() {
		return minPrice;
	}
	public void setMinPrice(String minPrice) {
		this.minPrice = minPrice;
	}
	public String getRatingSorter() {
		return ratingSorter;
	}
	public void setRatingSorter(String ratingSorter) {
		this.ratingSorter = ratingSorter;
	}
	public String getProdScore() {
		return prodScore;
	}
	public void setProdScore(String prodScore) {
		this.prodScore = prodScore;
	}
	
	@Override
	public String toString() {
		return "ProductDetailOrderVO [mainCategory_id=" + mainCategory_id + ", middleCategory_id=" + middleCategory_id
				+ ", prodRankOrder=" + prodRankOrder + ", priceRangeOrder=" + priceRangeOrder + ", maxPrice=" + maxPrice
				+ ", minPrice=" + minPrice + ", ratingSorter=" + ratingSorter + ", prodScore=" + prodScore + "]";
	}
	
}
