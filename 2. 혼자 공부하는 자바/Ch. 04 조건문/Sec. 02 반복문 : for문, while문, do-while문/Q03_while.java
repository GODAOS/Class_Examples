package sec02;

public class Q03_while {
	public static void main(String[] args) {
		// while���� Math.random() �޼ҵ带 �̿��� 2���� �ֻ����� ������ �� ������ ���� (��1, ��2) ���·� ����ϰ�,
		// ���� ���� 5�� �ƴϸ� ��� �ֻ����� ������, ���� ���� 5�̸� ������ ���ߴ� �ڵ带 �ۼ��϶�.
		int num1 = (int)(Math.random() * 6) + 1;
		int num2 = (int)(Math.random() * 6) + 1;
		while(true) {
			if(num1 + num2 == 5) {
				break;
			} else {
				num1 = (int)(Math.random() * 6) + 1;
				num2 = (int)(Math.random() * 6) + 1;
				System.out.println("(" + num1 + "," + num2 + ")");
			} // if
		} // while
	} // main()
} // class