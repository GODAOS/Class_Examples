package com.hanul.finalanimal;

public class Ex04_Final_Dog extends Ex04_Final_Animal {
	@Override
	public void cry() {	// cry() �޼ҵ带 ������
		super.cry();	// ���� Ŭ������ cry() �޼ҵ带 ���۽�Ų��.
		System.out.println("�۸�");
	}

	public void run() {
		System.out.println(name + "�� �ڴ�.");
	}
}
