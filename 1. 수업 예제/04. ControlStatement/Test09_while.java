public class Test09_while {
	public static void main(String[] args) {
		// 1���� 100������ ���� �߿��� ¦���� ��(evenSum)�� ���Ͻÿ� : for, if
		int evenSum = 0;
		for(int i = 1; i < 101; i++) {
			if(i % 2 == 0) {
				evenSum += i;
			} // if
		} // for
		System.out.println("for ¦���� �� : " + evenSum);
		
		// 1���� 100������ ���� �߿��� ¦���� ��(evenSum)�� ���Ͻÿ� : while
		evenSum = 0;
		int i = 1;
		while(true) {
//			i++;				//i++�� ���� �ϸ� �ȵ�
			if(i % 2 == 0) {
				evenSum += i;
			} if(i > 100) {
				break;
			} // if
			i++;				//i++�� if������ ���߿� �� ��
		} // while
		System.out.println("while ¦���� �� : " + evenSum);
		
		// ����
		evenSum = 0;
		i = 1;
		while(i < 101) {
			if(i % 2 == 0) {
				evenSum += i;
			} // if
			i++;
		} // while
		System.out.println("while ¦���� �� : " + evenSum);
	} // main()
} // class