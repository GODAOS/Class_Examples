public class Ex10_do_while {
	public static void main(String[] args) {
		// 1���� 100������ ���� �߿��� ¦���� ��(evenSum)�� ���Ͻÿ� : while, if
		int evenSum = 0;
		
		int i = 1;									// int i = 1;
		while(i < 101) {							// do {
			if(i % 2 == 0) {						// 
				evenSum += i;						//
			} // if									//
			i++;									//
		} // while									//} while(i < 101);
		System.out.println("while ¦���� �� : " + evenSum);
		
		//1���� 100��Ӥ��� ���� �߿��� ¦���� ��(evenSum)�� ���Ͻÿ� : do_while, if
		evenSum = 0;
		i = 1;
		do {
			if(i % 2 ==0) {
				evenSum += i;
			} // if
			i++;
		} while(i <= 100);
		System.out.println("do_while ¦���� �� : " + evenSum);
	} // main()
} // class

/*
 �� do ~~ while : ��ó�� �� ������, ���� �������� �ʴ´�.
 	�� ������ ó������ �����̴��� ���๮�� �ּ� 1���� ����
 	
 	�ʱⰪ;
 	do{
 		���๮;
 		������;
 	} while(���ǽ�);
 
 */
 