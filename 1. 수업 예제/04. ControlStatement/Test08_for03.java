public class Test08_for03 {
	public static void main(String[] args) {
		// 1���� 100������ ���� �߿��� 3�� ����� ������(sum)�� 3�� ����� ����(cnt)�� ���
		int sum = 0, cnt = 0;
		
		for(int i = 1; i < 101; i++) {
			if(i % 3 == 0) {
				sum += i;
				cnt++;
			} // if
		} // for
		System.out.println("3�� ����� ������ : " + sum);
		System.out.println("3�� ����� ���� : " + cnt);
		
		// 1���� 100������ ���� �߿��� 3�� ����� ����Ͻÿ�.
		// ��, �� �ٿ� 5���� ���� ����Ͻÿ�
		int printCnt = 0;					// ��� Ƚ���� ������ ������ �ʱ�ȭ
		for(int i = 1; i <= 100; i++) {
			if(i % 3 == 0) {
				printCnt++;					// ��� Ƚ�� ����
				if(i < 10) {				// ��� ���� �� �ڸ����̸�
					System.out.print("0" + i + " ");
				} else {
					System.out.print(i + " ");
				} // if
				if(printCnt % 5 == 0) {		// ��� Ƚ���� 5��°�̸�
					System.out.println();	// �ٹٲ�
				} // if
			} // if
		} // for
	} // main()
} // class