public class Ex04_Array04 {
	public static void main(String[] args) {
		// ��������(��������) �迭 : ���� ����, ���� ��������
		int[][] arr = new int[2][];
		arr[0] = new int[2];
		arr[1] = new int[3];

		for (int i = 0; i < arr.length; i++) {			// arr.length : 2
			for (int j = 0; j < arr[i].length; j++) {	// arr[i].length : 2, 3
				arr[i][j] = 10;
				System.out.println("arr[" + i + "][" + j + "]�� �� : " + arr[i][j] + "\t");
			} // for j
			System.out.println();
		} // for i
	} // main()
} // class