public class Ex08_for03 {
	public static void main(String[] args) {
		// 1���� 100������ ���� �߿��� Ȧ���� ��(oddSum)�� ¦���� ��(evenSum)�� ���
		// Ȧ���� ����(oddCnt)�� ¦���� ����(evenCnt)�� ���
		// for(�ݺ�), if(Ȧ���� ¦���� �Ǵ�)
		
		int oddSum = 0, evenSum = 0;	// ����� ����� ������ �ʱ�ȭ
		int oddCnt = 0, evenCnt = 0;
		
		for (int i = 1; i < 12346; i++ ) {	// 1���� 100���� 1�� ������Ű�鼭 �ݺ�
			if (i % 2 == 1) {				// Ȧ���̸� (i % 2 == 1)
				oddSum += i;				// Ȧ�� ������ ��� (oddSum = oddSum + i;)
				oddCnt++;					// Ȧ�� ������ ���� (oddCnt += 1;)
			} else {						// ¦���̸�
				evenSum += i;				// ¦�� ������ ��� (evenSum = evenSum + i;)
				evenCnt++;					// ¦�� ������ ���� (evenCnt += 1;)
			} // if
		} // for
		
		System.out.println("Ȧ���� ������ : " + oddSum + "\n" + "¦���� ������ : " + evenSum);
		System.out.println("Ȧ���� ���� : " + oddCnt + "\n" + "¦���� ���� : " + evenCnt);
	} // main()
} // class