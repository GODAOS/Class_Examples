package sec02;

public class Q02_for3sum {
	public static void main(String[] args) {
		// for���� �̿��ؼ� 1���� 100������ ���� �߿� 3�� ����� ������ ���ϴ� �ڵ带 �ۼ��϶�.
		int sum = 0;
		for(int i = 1; i <= 100; i++) {
			if(i % 3 == 0) {
				sum += i;
			} // if
		} // for
		System.out.println(sum);
	} // main()
} // class