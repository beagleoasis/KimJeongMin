package com.cambak21.domain;

import java.util.Date;

public class PayInfoVO {
	private int payInfo_no;
	private String member_id;
	private String payInfo_way;
	private Date payInfo_date;

	public int getPayInfo_no() {
		return payInfo_no;
	}

	public void setPayInfo_no(int payInfo_no) {
		this.payInfo_no = payInfo_no;
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

	public Date getPayInfo_date() {
		return payInfo_date;
	}

	public void setPayInfo_date(Date payInfo_date) {
		this.payInfo_date = payInfo_date;
	}

	@Override
	public String toString() {
		return "PayInfoVO [payInfo_no=" + payInfo_no + ", member_id=" + member_id + ", payInfo_way=" + payInfo_way
				+ ", payInfo_date=" + payInfo_date + "]";
	}

}
