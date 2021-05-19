package com.cambak21.domain;

import java.util.Date;

public class AdminOrderListVO {
	private int payment_no;
	private Date payment_date;
	private String product_name;
	private String member_id;
	private String member_name;
	private String destination_toUser;
	private String destination_mobile;
	private int point_usedPoint;
	private int buyProduct_totPrice;
	private String delivery_status;
	private String payInfo_way;
	private String payment_isComit;
	private int orderProductNum;
	
	public int getPayment_no() {
		return payment_no;
	}
	public void setPayment_no(int payment_no) {
		this.payment_no = payment_no;
	}
	public Date getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getDestination_toUser() {
		return destination_toUser;
	}
	public void setDestination_toUser(String destination_toUser) {
		this.destination_toUser = destination_toUser;
	}
	public String getDestination_mobile() {
		return destination_mobile;
	}
	public void setDestination_mobile(String destination_mobile) {
		this.destination_mobile = destination_mobile;
	}
	public int getPoint_usedPoint() {
		return point_usedPoint;
	}
	public void setPoint_usedPoint(int point_usedPoint) {
		this.point_usedPoint = point_usedPoint;
	}
	public int getBuyProduct_totPrice() {
		return buyProduct_totPrice;
	}
	public void setBuyProduct_totPrice(int buyProduct_totPrice) {
		this.buyProduct_totPrice = buyProduct_totPrice;
	}
	public String getDelivery_status() {
		return delivery_status;
	}
	public void setDelivery_status(String delivery_status) {
		this.delivery_status = delivery_status;
	}
	public String getPayInfo_way() {
		return payInfo_way;
	}
	public void setPayInfo_way(String payInfo_way) {
		this.payInfo_way = payInfo_way;
	}
	public String getPayment_isComit() {
		return payment_isComit;
	}
	public void setPayment_isComit(String payment_isComit) {
		this.payment_isComit = payment_isComit;
	}
	public int getOrderProductNum() {
		return orderProductNum;
	}
	public void setOrderProductNum(int orderProductNum) {
		this.orderProductNum = orderProductNum;
	}
	
	@Override
	public String toString() {
		return "AdminOrderListVO [payment_no=" + payment_no + ", payment_date=" + payment_date + ", product_name="
				+ product_name + ", member_id=" + member_id + ", member_name=" + member_name + ", destination_toUser="
				+ destination_toUser + ", destination_mobile=" + destination_mobile + ", point_usedPoint="
				+ point_usedPoint + ", buyProduct_totPrice=" + buyProduct_totPrice + ", delivery_status="
				+ delivery_status + ", payInfo_way=" + payInfo_way + ", payment_isComit=" + payment_isComit
				+ ", orderProductNum=" + orderProductNum + "]";
	}
	
}
