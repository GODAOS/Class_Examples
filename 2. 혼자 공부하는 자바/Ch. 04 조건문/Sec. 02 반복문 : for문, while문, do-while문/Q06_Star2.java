package sec02;

public class Q06_Star2 {
	public static void main(String[] args) {
		// for���� �̿��ؼ� ������ ���� ����Ͻÿ�.
		//    *
		//   **
		//  ***
		// ****
		// ...*
		// ..**
		// .***
		// ****
		for(int i = 4; i > 0; i--) {
			for(int j = 1; j < 5; j++) {
				if(i <= j) {
					System.out.print("*");
				} else {
					System.out.print(" ");
				} // if
			}	// for j
			System.out.println();
		} // for i
	} // main()
} // class