package com.hanul.finalanimal;

public class Ex04_Final_Duck extends Ex04_Final_Animal {
	@Override
	public void cry() {
		super.cry();
		System.out.println("�в�");
	}
	
	public void fly() {
		System.out.println(name + "�� ����.");
	}
}
