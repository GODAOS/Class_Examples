public class Ex13_continue {
	public static void main(String[] args) {
		// continue : �ݺ������� continue�� �Ʒ��� ���๮�� �������� �ʰ�,
		// ������� �ݺ����� ù�Ӹ��� �̵��ϴ� ���
		
		//1���� 10������ ���� �߿��� Ȧ���� ������(oddSum)�� ���Ͻÿ�. : for(�ݺ�), if(Ȧ�� �Ǵ�)
		int oddSum = 0;
		for(int i = 0; i < 11; i++) {
			if(i % 2 == 1) {
				oddSum += i;
			} // if
		} // for
		System.out.println("Ȧ���� ������ : " + oddSum);
		
		//1���� 10������ ���� �߿��� Ȧ���� ������(oddSum)�� ���Ͻÿ�. : for, if, continue
		oddSum = 0;
		for(int i = 0; i < 11; i++) {
			if(i % 2 == 0) {		// ¦���̸�
				continue;			// �ݺ����� ó������ �ǵ���
			} else {				// Ȧ���̸�
				oddSum += i;		// Ȧ���� ������ ���
			} // if else
		} // for
		System.out.println("Ȧ���� ������ : " + oddSum);
	} // main()
} // class