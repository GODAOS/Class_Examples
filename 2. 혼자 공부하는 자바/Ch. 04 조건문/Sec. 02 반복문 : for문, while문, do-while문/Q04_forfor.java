package sec02;

public class Q04_forfor {
	public static void main(String[] args) {
		// ��ø for���� �̿��ؼ� ������ 4x + 5y = 60�� ��� �ظ� ���ؼ� (x, y) ���·� ����϶�.
		// ��, x�� y�� 10 ������ �ڿ����̴�.
		for(int x = 1; x < 11; x++) {
			for(int y = 1; y < 11; y++) {
				if(4*x + 5*y == 60) {
					System.out.println("(" + x + "," + y + ")");
				} // if
			} // for y
		} // for x
	} // main()
} // class