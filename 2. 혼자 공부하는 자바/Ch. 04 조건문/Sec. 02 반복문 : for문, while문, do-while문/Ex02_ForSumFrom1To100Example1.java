package sec02;

public class Ex02_ForSumFrom1To100Example1 {
	public static void main(String[] args) {
		// 1���� 100���� ���� ���
		int sum = 0;	// �հ� ����
		
		for(int i = 1; i <= 100; i++) {
			sum += i;
		} // for
		System.out.println("1 ~ 100 �� : " + sum);
	} // main ()
} // class