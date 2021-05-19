package com.cambak21.domain;

public class GradeVO {
	private String grade_name;
	private int grade_maxPrice;
	private int grade_minPrice;
	private int grade_benefit;
	public String getGrade_name() {
		return grade_name;
	}
	public void setGrade_name(String grade_name) {
		this.grade_name = grade_name;
	}
	public int getGrade_maxPrice() {
		return grade_maxPrice;
	}
	public void setGrade_maxPrice(int grade_maxPrice) {
		this.grade_maxPrice = grade_maxPrice;
	}
	public int getGrade_minPrice() {
		return grade_minPrice;
	}
	public void setGrade_minPrice(int grade_minPrice) {
		this.grade_minPrice = grade_minPrice;
	}
	public int getGrade_benefit() {
		return grade_benefit;
	}
	public void setGrade_benefit(int grade_benefit) {
		this.grade_benefit = grade_benefit;
	}
	@Override
	public String toString() {
		return "GradeVO [grade_name=" + grade_name + ", grade_maxPrice=" + grade_maxPrice + ", grade_minPrice="
				+ grade_minPrice + ", grade_benefit=" + grade_benefit + "]";
	}
	
	
	
}
