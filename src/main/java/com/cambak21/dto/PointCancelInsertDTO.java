package com.cambak21.dto;

public class PointCancelInsertDTO {
	private int buyProduct_no;
	private String member_id;
	private String grade_name;
	private int buyProduct_totPrice;
	private int point_usedPoint;
	
	public int getBuyProduct_no() {
		return buyProduct_no;
	}
	public void setBuyProduct_no(int buyProduct_no) {
		this.buyProduct_no = buyProduct_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getGrade_name() {
		return grade_name;
	}
	public void setGrade_name(String grade_name) {
		this.grade_name = grade_name;
	}
	public int getBuyProduct_totPrice() {
		return buyProduct_totPrice;
	}
	public void setBuyProduct_totPrice(int buyProduct_totPrice) {
		this.buyProduct_totPrice = buyProduct_totPrice;
	}
	public int getPoint_usedPoint() {
		return point_usedPoint;
	}
	public void setPoint_usedPoint(int point_usedPoint) {
		this.point_usedPoint = point_usedPoint;
	}
	
	@Override
	public String toString() {
		return "PointCancelInsert [buyProduct_no=" + buyProduct_no + ", member_id=" + member_id + ", grade_name="
				+ grade_name + ", buyProduct_totPrice=" + buyProduct_totPrice + ", point_usedPoint=" + point_usedPoint
				+ "]";
	}
	
	
}