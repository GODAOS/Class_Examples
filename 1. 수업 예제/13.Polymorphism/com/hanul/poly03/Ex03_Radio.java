package com.hanul.poly03;

public class Ex03_Radio implements Ex03_RemoCon {
	@Override
	public void volUp() {
		System.out.println("Radio �Ҹ��� �ø���.");
	}

	@Override
	public void volDown() {
		System.out.println("Radio �Ҹ��� ������.");
	}

	@Override
	public void internet() {
		System.out.println("���ͳ� ���� ����� ����.");
	}
	
}
