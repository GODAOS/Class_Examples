public class Test06_for01 {
	public static void main(String[] args) {
		// 1���� 10������ ������(sum)�� ���Ͻÿ�.
		int sum = 0;						// ������(���)�� ����� ����(sum)�� �ʱ�ȭ
		for (int i = 1; i <= 10; i++) {		// �ݺ����� i�� 1���� 10���� 1�� ����(�ݺ�)
			sum += i;	// sum = sum + i; 	// ������ ���
			System.out.println("i�� : " + i + ", sum�� : " + sum);
		} // for
		System.out.println("������ : " + sum);		
	} // main()
} // class