package sec01;

public class Ex06_SwitchNoBreakCaseExample {
	public static void main(String[] args) {
		// break���� ���� case
		int time = (int)(Math.random() * 4) +8;		// 8 ~ 11 ������ ���� �̱�
		System.out.println("[���� �ð� : " + time + "��]");
		
		switch(time) {
			case 8 :
				System.out.println("����մϴ�.");
			case 9 :
				System.out.println("ȸ�Ǹ� �մϴ�.");
			case 10 :
				System.out.println("������ ���ϴ�.");
			default :
				System.out.println("�ܱ��� �����ϴ�.");
		} // switch
	} // main()
} // class