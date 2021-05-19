package com.cambak21.dto;

public class finalProdOrderInfo {
	private int point_usedPoint;
	private int point_futurePoint;
	private int buyProduct_totPrice;
	private String buyProduct_isFinished;
	private String member_id;
	private String payInfo_way;
	
	public int getPoint_usedPoint() {
		return point_usedPoint;
	}
	public void setPoint_usedPoint(int point_usedPoint) {
		this.point_usedPoint = point_usedPoint;
	}
	public int getPoint_futurePoint() {
		return point_futurePoint;
	}
	public void setPoint_futurePoint(int point_futurePoint) {
		this.point_futurePoint = point_futurePoint;
	}
	public int getBuyProduct_totPrice() {
		return buyProduct_totPrice;
	}
	public void setBuyProduct_totPrice(int buyProduct_totPrice) {
		this.buyProduct_totPrice = buyProduct_totPrice;
	}
	public String getBuyProduct_isFinished() {
		return buyProduct_isFinished;
	}
	public void setBuyProduct_isFinished(String buyProduct_isFinished) {
		this.buyProduct_isFinished = buyProduct_isFinished;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getPayInfo_way() {
		return payInfo_way;
	}
	public void setPayInfo_way(String payInfo_way) {
		this.payInfo_way = payInfo_way;
	}
	
	@Override
	public String toString() {
		return "finalProdOrderInfo [point_usedPoint=" + point_usedPoint + ", point_futurePoint=" + point_futurePoint
				+ ", buyProduct_totPrice=" + buyProduct_totPrice + ", buyProduct_isFinished=" + buyProduct_isFinished
				+ ", member_id=" + member_id + ", payInfo_way=" + payInfo_way + "]";
	}
	
	
}
