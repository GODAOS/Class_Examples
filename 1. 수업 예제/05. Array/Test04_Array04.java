public class Test04_Array04 {
	public static void main(String[] args) {
		/*
			�� ��������(��������) �迭�� �̿��� �����
			��
			�ڡ�
			�ڡڡ�
			�ڡڡڡ�
			�ڡڡڡڡ�
		*/
		int[][] star = new int[5][];	// �������� �迭(star)�� ���� �� ���� 
//		star[0] = new int[1];			// ù ��° ���� ���� ���� ����(1��)
//		star[1] = new int[2];			// �� ��° ���� ���� ���� ����(2��)
//		star[2] = new int[3];			// �� ��° ���� ���� ���� ����(3��)
//		star[3] = new int[4];			// �� ��° ���� ���� ���� ����(4��)
//		star[4] = new int[5];			// �ټ� ��° ���� ���� ���� ����(5��)
		

		for (int i = 0; i < star.length; i++) {
			star[i] = new int[(star.length + 1) - i];
			for (int j = 1; j < star[i].length; j++) {
				System.out.print("��");
			} // for j
			System.out.println();
		} // for i	
		
//		// ������ ��ҿ� ���� �Ҵ� �� ���
//		int[][] star = new int[5][];
//		
//		for (int i = 0; i < star.length; i++) {
//			for (int j = 0; j < star[i].length; j++) {
//				star[i][j] = '��';
//				System.out.print((char)star[i][j]);
//			} // for j
//			System.out.println();
//		} // for i
	} // main()
} // class