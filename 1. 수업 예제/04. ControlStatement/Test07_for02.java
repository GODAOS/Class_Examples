public class Test07_for02 {
	public static void main(String[] args) {
		// 1���� 100������ ���� �߿��� Ȧ���� ������(oddSum)�� ���Ͽ� ��� : for(�ݺ�), if(Ȧ��)
		int oddSum = 0;					// ����� ����� ����(oddSum)�� �ʱ�ȭ
		for(int i = 1; i < 101; i++) {	// 1���� 100���� 1�� ����(�ݺ�)
			if(i % 2 == 1) {			// Ȧ���̸� (i % 2 != 0)
				oddSum += i;			// Ȧ�� ������ ��� (oddSum = oddSum + i;) 
			} // if
		} // for
		System.out.println("Ȧ���� ������ : " + oddSum);
	} // main()
} // class