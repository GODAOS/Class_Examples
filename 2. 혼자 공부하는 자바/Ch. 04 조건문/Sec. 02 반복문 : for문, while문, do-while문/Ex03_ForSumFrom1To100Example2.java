package sec02;

public class Ex03_ForSumFrom1To100Example2 {
	public static void main(String[] args) {
		// 1���� 100���� ���� ���
		int sum = 0;	// �հ� ����
		
		int i = 0;		// ���� ī���� ����
		for(i = 1; i <= 100; i++) {
			sum += i;
		} // for
		System.out.println("1 ~ " + (i - 1) + " �� : " + sum);
	} // main()
} // class