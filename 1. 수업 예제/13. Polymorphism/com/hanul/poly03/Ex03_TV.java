package com.hanul.poly03;

public class Ex03_TV implements Ex03_RemoCon { // interface�� ����� implements Ű���� ���

	@Override
	public void volUp() {
		System.out.println("TV �Ҹ��� �ø���.");
	}

	@Override
	public void volDown() {
		System.out.println("TV �Ҹ��� ������.");
	}

	@Override
	public void internet() {
		System.out.println("���ͳ� ���� ����� �ִ�.");
	}	

} // class