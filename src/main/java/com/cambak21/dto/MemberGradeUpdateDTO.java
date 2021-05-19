package com.cambak21.dto;

public class MemberGradeUpdateDTO {
	private String grade_name;

	public String getGrade_name() {
		return grade_name;
	}

	public void setGrade_name(String grade_name) {
		this.grade_name = grade_name;
	}

	@Override
	public String toString() {
		return "MemberGradeUpdate [grade_name=" + grade_name + "]";
	}
	
	
}
