package com.hanul.seat;

import java.util.Arrays;
import java.util.Collections;

public class SeatDAO {

	private SeatDTO[] seat;	// ��� ���� ����
	public SeatDAO(SeatDTO[] seat) {
		this.seat = seat;
	}
	
	// �л� �й� �޼ҵ�
	public void divStudent() {
		// seat�� ���� 4���� �ߺ��˻縦 �Ѵ�.
		int i = 0;
		while(true) {
			if(i >= seat.length) {
				break;
			}
			if ( (i % 4 == 0) &&	// �ߺ� �˻�
				(seat[i].getGroupNo() != seat[i + 1].getGroupNo()) &&
				(seat[i].getGroupNo() != seat[i + 2].getGroupNo()) &&
				(seat[i].getGroupNo() != seat[i + 3].getGroupNo()) &&
				(seat[i + 1].getGroupNo() != seat[i + 2].getGroupNo()) &&
				(seat[i + 1].getGroupNo() != seat[i + 3].getGroupNo()) &&
				(seat[i + 2].getGroupNo() != seat[i + 3].getGroupNo()) ) {
			} else {
				Collections.shuffle(Arrays.asList(seat));
				i = 0;
			} // if else
			if ( // ���� �˻�, MMMM, FFFF ���̺� ������
				(seat[i].getGender() == seat[i + 1].getGender()) &&
				(seat[i].getGender() == seat[i + 2].getGender()) &&
				(seat[i].getGender() == seat[i + 3].getGender()) &&
				(seat[i + 1].getGender() == seat[i + 2].getGender()) &&
				(seat[i + 1].getGender() == seat[i + 3].getGender()) &&
				(seat[i + 2].getGender() == seat[i + 3].getGender()) ) {
				Collections.shuffle(Arrays.asList(seat));
				i = 0;
				continue;
			} // if
			i += 4;
		} // while
	} // divStudent()

	// ��� �޼ҵ�
	public void display() {
		// �ߺ��Ǵ°��� ���� ������ ���� ���� �Ǿ����� 4���� ��� �̸��� ����Ѵ�.
		int cnt = 1;
		for (int i = 0; i < seat.length; i++) {
			System.out.print(seat[i].getName() + seat[i].getGender() + "\t");
				if((i + 1) % 4 == 0) {
					System.out.print("����" + cnt);
					cnt++;
					System.out.println();
				} // if
		} // for
	} // display()
} // class