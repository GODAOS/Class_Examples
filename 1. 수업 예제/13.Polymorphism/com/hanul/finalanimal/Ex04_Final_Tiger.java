package com.hanul.finalanimal;

public class Ex04_Final_Tiger extends Ex04_Final_Animal {
	@Override
	public void cry() {
		super.cry();
		System.out.println("����");
	}
	
	public void hunter() {
		System.out.println(name + "�� ����� �Ѵ�.");
	}
}
