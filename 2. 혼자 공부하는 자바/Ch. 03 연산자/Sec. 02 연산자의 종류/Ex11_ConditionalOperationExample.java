package sec02;

public class Ex11_ConditionalOperationExample {
	public static void main(String[] args) {
		// ���� ������
		int score = 85;
		char grade = (score > 90) ? 'A' : ( (score > 80) ? 'B' : 'C' );
		System.out.println(score + "���� " + grade + "����Դϴ�.");
	} // main()
} // class