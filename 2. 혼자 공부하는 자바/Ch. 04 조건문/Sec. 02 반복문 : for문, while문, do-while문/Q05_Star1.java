package sec02;

public class Q05_Star1 {
	public static void main(String[] args) {
		// for���� �̿��ؼ� ������ ���� ����Ͻÿ�.
		// *
		// **
		// ***
		// ****
		for(int i = 1; i < 5; i++) {
			for(int j = 1; j <= i; j++) {
				System.out.print("*");
			} // for j
			System.out.println();
		} // for i
	} // main()
} // class