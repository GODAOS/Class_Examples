package sec02;

public class Ex05_ForMultiplicationTableExample {
	public static void main(String[] args) {
		// ������ ����ϱ�
		for(int m = 2; m <= 9; m++) {		// �ٱ��� for��
			System.out.println("*** " + m + "�� ***");
			for(int n = 1; n <= 9; n++) {	// ��ø for��
				System.out.println(m + " x " + n + " = " + (m * n));
			} // for n
		} // for m
	} // main()
} // class