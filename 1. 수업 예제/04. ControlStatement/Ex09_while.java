public class Ex09_while {
	public static void main(String[] args) {
	// 1���� 100������ ������(forSum)�� ���Ͻÿ� : for
		int forSum = 0;
		for(int i = 1; i < 101; i++) {
			forSum += i;
		} // for
		System.out.println("for ������ : " + forSum);

	// 1���� 100������ ������(whileSum)�� ���Ͻÿ� : while
		int whileSum = 0;
		int i = 1;
		while(i < 101) {
			whileSum += i;
			i++;
		} // while
		System.out.println("while ������ : " + whileSum);
		
	// while���� ���� loop�� ������ �ʵ��� �Ʒ��� ���� �ۼ��ϴ� ���� �����Ѵ�.
//		whileSum = 0;
//		i = 1;
//		while(true) {			
//			whileSum += i;
//			i++;
//		} if(i > 100) {
//			break;
//		} // while
	} // main()
} // class

/*
�� while : �ݺ� Ƚ���� �� ��� ���(������ �� ��ó��)

�ʱⰪ ����;
while(���ǽ�){
	���๮;
	������;
}
*/