package com.cambak21.domain;

import java.util.Date;

public class MemberOrderVO {
	private int payment_no;
	private Date payment_date;
	private String product_name;
	private String member_id;
	private String destination_address;
	private String destination_toUser;
	private String destination_mobile;
	private String payment_deliveryMsg;
	private String product_factory;
	private int point_usedPoint;
	private int buyProduct_deliveriPay;
	private int buyProduct_totPrice;
	private int point_futurePoint;
	private String delivery_status;
	private String payInfo_way;
	private String refundnExchange_status;
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
	public String getDestination_address() {
		return destination_address;
	}
	public void setDestination_address(String destination_address) {
		this.destination_address = destination_address;
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
	public String getPayment_deliveryMsg() {
		return payment_deliveryMsg;
	}
	public void setPayment_deliveryMsg(String payment_deliveryMsg) {
		this.payment_deliveryMsg = payment_deliveryMsg;
	}
	public String getProduct_factory() {
		return product_factory;
	}
	public void setProduct_factory(String product_factory) {
		this.product_factory = product_factory;
	}
	public int getPoint_usedPoint() {
		return point_usedPoint;
	}
	public void setPoint_usedPoint(int point_usedPoint) {
		this.point_usedPoint = point_usedPoint;
	}
	public int getBuyProduct_deliveriPay() {
		return buyProduct_deliveriPay;
	}
	public void setBuyProduct_deliveriPay(int buyProduct_deliveriPay) {
		this.buyProduct_deliveriPay = buyProduct_deliveriPay;
	}
	public int getBuyProduct_totPrice() {
		return buyProduct_totPrice;
	}
	public void setBuyProduct_totPrice(int buyProduct_totPrice) {
		this.buyProduct_totPrice = buyProduct_totPrice;
	}
	public int getPoint_futurePoint() {
		return point_futurePoint;
	}
	public void setPoint_futurePoint(int point_futurePoint) {
		this.point_futurePoint = point_futurePoint;
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
	public String getRefundnExchange_status() {
		return refundnExchange_status;
	}
	public void setRefundnExchange_status(String refundnExchange_status) {
		this.refundnExchange_status = refundnExchange_status;
	}
	
	@Override
	public String toString() {
		return "MemberOrderVO [payment_no=" + payment_no + ", payment_date=" + payment_date + ", product_name="
				+ product_name + ", member_id=" + member_id + ", destination_address=" + destination_address
				+ ", destination_toUser=" + destination_toUser + ", destination_mobile=" + destination_mobile
				+ ", payment_deliveryMsg=" + payment_deliveryMsg + ", product_factory=" + product_factory
				+ ", point_usedPoint=" + point_usedPoint + ", buyProduct_deliveriPay=" + buyProduct_deliveriPay
				+ ", buyProduct_totPrice=" + buyProduct_totPrice + ", point_futurePoint=" + point_futurePoint
				+ ", delivery_status=" + delivery_status + ", payInfo_way=" + payInfo_way + ", refundnExchange_status="
				+ refundnExchange_status + "]";
	}

	
	
	
	
	
	
}
