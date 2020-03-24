package com.hanul.finalanimal;

public class Ex04_Final_Action {
	public void action(Ex04_Final_Animal animal) {	// ������ �μ�
		animal.cry();
		
		if(animal instanceof Ex04_Final_Dog) {		// ��ü Ÿ�� ��
			((Ex04_Final_Dog)animal).run();			// �ٿ� ĳ����
		} else if(animal instanceof Ex04_Final_Cat) {
			((Ex04_Final_Cat)animal).grooming();
		} else if(animal instanceof Ex04_Final_Tiger) {
			((Ex04_Final_Tiger)animal).hunter();
		} else if(animal instanceof Ex04_Final_Duck) {
			((Ex04_Final_Duck)animal).fly();
		}
	}

}
