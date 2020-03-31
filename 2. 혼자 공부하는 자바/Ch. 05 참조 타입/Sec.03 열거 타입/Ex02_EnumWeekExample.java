package sec03;

import java.util.Calendar;

public class Ex02_EnumWeekExample {
	public static void main(String[] args) {
		Ex01_Week today = null;		// ���� Ÿ�� ���� ����
		
		Calendar cal = Calendar.getInstance();
		// Calendar ���� ����, Caledndar.getInstance() �޼ҵ�� Calendar ��ü ����
		int week = cal.get(Calendar.DAY_OF_WEEK);	// ��(1) ~ ��(7)������ ���ڸ� ����
		
		switch(week) {
			case 1:
				today = Ex01_Week.SUNDAY; break;	// ���� ��� ����
			case 2:
				today = Ex01_Week.MONDAY; break;
			case 3:
				today = Ex01_Week.TUESDAY; break;
			case 4:
				today = Ex01_Week.WEDNESDAY; break;
			case 5:
				today = Ex01_Week.THURSDAY; break;
			case 6:
				today = Ex01_Week.FRIDAY; break;
			case 7:
				today = Ex01_Week.SATURDAY; break;
		 } // switch
		
		System.out.println("���� ���� : " + today);
		
		if(today == Ex01_Week.SUNDAY) {
			System.out.println("�Ͽ��Ͽ��� �౸�� �մϴ�.");
		} else {
			System.out.println("������ �ڹ� �����մϴ�.");
		} // if else
	} // main()
} // class