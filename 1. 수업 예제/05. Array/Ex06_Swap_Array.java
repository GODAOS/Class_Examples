import java.util.Arrays;

public class Ex06_Swap_Array {
	public static void main(String[] args) {
		int[] arr1 = {1, 2, 3, 4, 5};
		
		// �迭(arr1)�� ����� ���� ���� ��� : java.util.Arrays Class
		System.out.println("arr1 �迭�� ���� �� : " + Arrays.toString(arr1));
		
		// �迭(arr1)�� ����� ���� ���� ��� : �ܼ� for��
		for (int i = 0; i < arr1.length; i++) {
			System.out.print(arr1[i] + "\t");
		} // for
		System.out.println();

		System.out.print("arr1 �迭�� ���� �� : [");
		for (int i = 0; i < arr1.length; i++) {
			if(i != arr1.length -1) {
				System.out.print(arr1[i] + ", ");
			} else {
				System.out.println(arr1[i] + "]\n");
			} // else
		} // for
//		System.out.print("\b" + "\b" + "]");
		
		//�迭(arr1)�� ����� �����͸� �������� ���
		int[] arr2 = new int[arr1.length];	//�ӽ� �迭(arr2)�� ���� �� ����
		arr2[0] = arr1[4];		// arr1[arr1.length - 1];
		arr2[1] = arr1[3];		// arr1[arr1.length - 2];
		arr2[2] = arr1[2];		// arr1[arr1.length - 3];
		arr2[3] = arr1[1];		// arr1[arr1.length - 4];
		arr2[4] = arr1[0];		// arr1[arr1.length - 5];
		System.out.println("arr2 �迭�� ���� �� : " + Arrays.toString(arr2));

		//�迭(arr1)�� ����� �����͸� �������� ���
		int[] arr3 = new int[arr1.length];
		int index = arr1.length -1;		// index : 4
		for (int i = 0; i < arr3.length; i++) {
			arr3[i] = arr1[index--];
		} // for
		System.out.println("arr3 �迭�� ���� �� : " + Arrays.toString(arr3));
	} // main()
} // class