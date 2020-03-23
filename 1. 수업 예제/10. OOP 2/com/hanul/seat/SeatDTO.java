package com.hanul.seat;

public class SeatDTO {
	private int groupNo;	// �ߺ� ������ ����
	private char gender;	// ����
	private String name;	// �̸�

	
	public SeatDTO(int groupNo, char gender, String name) {
		super();
		this.groupNo = groupNo;
		this.gender = gender;
		this.name = name;
	}


	public int getGroupNo() {
		return groupNo;
	}


	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}


	public char getGender() {
		return gender;
	}


	public void setGender(char gender) {
		this.gender = gender;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}
	

} // class