public class Ex06_for01 {
	public static void main(String[] args) {
		// 0���� 10���� ����Ͻÿ�.		
		for(int i = 0; i <= 10; i++) {	// ����� : �ݺ����� i�� 0���� 10���� 1�� ����(�ݺ�)
			System.out.println(i);;		// i ���� ���
		} // for
		System.out.println("------------------------------");
		
		// 0���� 10������ ���� �߿��� ¦���� ����Ͻÿ�. : for
		for(int i = 0; i <= 10; i+=2) {
			System.out.println(i);
		} // for
		System.out.println("------------------------------");
		
		//0���� 10������ ���� �߿��� ¦���� ����Ͻÿ�. : for(�ݺ�), if(¦���Ǵ�)
		for(int i = 0; i <= 10; i++) {	// �ݺ����� i�� 0���� 10���� 1�� ���� (�ݺ�)
			if(i % 2 == 0) {			// i�� 2�� ���� �������� 0�̸� (¦��)
				System.out.println(i);	// i���� ���
			} // if
		} // for			
		System.out.println("------------------------------");
		
		// 10���� 0���� ���
		for(int i = 10; i >= 0; i--) {	// �ݺ����� i�� 10���� 0���� 1�� ���� (�ݺ�)
			System.out.println(i);
		} // for
	} // main()
} // class

/*
�� �ݺ���(��ȯ��, Loop��) : for, while, do~while

for(�ʱⰪ(���۰�); ���ǽ�(������); �ݺ����۾�(������)) {
	�ݺ��� ����;
}
*/