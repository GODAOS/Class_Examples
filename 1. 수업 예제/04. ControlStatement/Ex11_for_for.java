public class Ex11_for_for {
	public static void main(String[] args) {
		for(int i = 1; i <= 5; i++) {		// for i : 1���� 5���� �ݺ�
			for (int j = 1; j <= i; j++) {	// for j : 1���� i���� �ݺ�
				System.out.println("i�� : " + i + "\t" + "j�� : " + j);
			} // for
		} // for
		
		/* �����
		��	�� for j
		f	��
		o	�ڡ�
		r	�ڡڡ�
			�ڡڡڡ�
		i	�ڡڡڡڡ�
		 */
		for(int i = 1; i <= 5; i++) {
			for(int j = 1; j <= i; j++) {
				System.out.print("��");
			} // for j
			System.out.println();
		} // for i
		
		for(int i = 5; i >= 1; i--) {
			for(int j = 5; j >= i; j--) {
				System.out.print("��");
			} //for j
			System.out.println();
		} // for i
	} // main()
} // class