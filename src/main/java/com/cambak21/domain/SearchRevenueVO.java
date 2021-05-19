package com.cambak21.domain;

import java.util.Date;

public class SearchRevenueVO {
	private int buyProduct_totPrice;
	private String buyProduct_isFinished;
	private Date payment_date;
	private String payInfo_way;
	private String member_gender;
	
	public int getBuyProduct_totPrice() {
		return buyProduct_totPrice;
	}
	public void setBuyProduct_totPrice(int buyProduct_totPrice) {
		this.buyProduct_totPrice = buyProduct_totPrice;
	}

	public void setBuyProduct_isFinished(String buyProduct_isFinished) {
		this.buyProduct_isFinished = buyProduct_isFinished;
	}
	public String getBuyProduct_isFinished() {
		return buyProduct_isFinished;
	}
	public Date getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}
	public String getPayInfo_way() {
		return payInfo_way;
	}
	public void setPayInfo_way(String payInfo_way) {
		this.payInfo_way = payInfo_way;
	}
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	
	@Override
	public String toString() {
		return "SearchRevenueDTO [buyProduct_totPrice=" + buyProduct_totPrice + ", buyProduct_isFinished="
				+ buyProduct_isFinished + ", payment_date=" + payment_date + ", payInfo_way=" + payInfo_way
				+ ", member_gender=" + member_gender + "]";
	}
	
	
}
