package com.cambak21.domain;

public class ProductDetailOrderVO {
	private int mainCategory_id;
	private int middleCategory_id;
	private String prodRankOrder;
	private String priceRangeOrder;
	private int maxPrice;
	private int minPrice;
	private String ratingSorter;
	private int prodScore;
	
	public int getMainCategory_id() {
		return mainCategory_id;
	}
	public void setMainCategory_id(int mainCategory_id) {
		this.mainCategory_id = mainCategory_id;
	}
	public int getMiddleCategory_id() {
		return middleCategory_id;
	}
	public void setMiddleCategory_id(int middleCategory_id) {
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
	public int getMaxPrice() {
		return maxPrice;
	}
	public void setMaxPrice(int maxPrice) {
		this.maxPrice = maxPrice;
	}
	public int getMinPrice() {
		return minPrice;
	}
	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}
	public String getRatingSorter() {
		return ratingSorter;
	}
	public void setRatingSorter(String ratingSorter) {
		this.ratingSorter = ratingSorter;
	}
	public int getProdScore() {
		return prodScore;
	}
	public void setProdScore(int prodScore) {
		this.prodScore = prodScore;
	}
	
	@Override
	public String toString() {
		return "ProductDetailOrderVO [mainCategory_id=" + mainCategory_id + ", middleCategory_id=" + middleCategory_id
				+ ", prodRankOrder=" + prodRankOrder + ", priceRangeOrder=" + priceRangeOrder + ", maxPrice=" + maxPrice
				+ ", minPrice=" + minPrice + ", ratingSorter=" + ratingSorter + ", prodScore=" + prodScore + "]";
	}
	
}
