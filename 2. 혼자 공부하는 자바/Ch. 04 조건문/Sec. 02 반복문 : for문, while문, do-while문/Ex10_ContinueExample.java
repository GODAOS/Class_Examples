package sec02;

public class Ex10_ContinueExample {
	public static void main(String[] args) {
		// continue�� ����� for��
		for(int i = 1; i <= 10; i++) {
			if(i % 2 != 0) {		// Ȧ���� ���
				continue;
			} // if
			System.out.println(i);	// Ȧ���� ������� ����
		} // for
	} // main()
} // class