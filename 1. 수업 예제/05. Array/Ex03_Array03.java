public class Ex03_Array03 {
	public static void main(String[] args) {
		// 2�� 3���� ������ 2���� �迭(arr)�� ���� �� �����ϰ�
		// ��� ��ҿ� 10�� �Ҵ��ϰ� ���
		int[][] arr; // ������ 2���� �迭(arr)�� ����
		arr = new int[2][3]; // 2�� 3���� 2���� �迭(arr)�� ����
//		int[][] arr = new int[2][3];
		
//		arr[0][0] = 10;
//		arr[0][1] = 10;
//		arr[0][2] = 10;
//		
//		arr[1][0] = 10;
//		arr[1][1] = 10;
//		arr[1][2] = 10;
		
		for (int i = 0; i < arr.length; i++) {			// arr.length : 2
			for (int j = 0; j < arr[i].length; j++) {	// arr[i].length : 3
				arr[i][j] = 10;
				System.out.println("arr[" + i + "][" + j + "]�� �� : " + arr[i][j] + "\t");
			} // for j
			System.out.println();
		} // for i
	} // main()
} // class