import java.util.Arrays;

public class Test02_Array02 {
	public static void main(String[] args) {
		// �ʱ�ȭ�� �迭(arr)���� Ȧ���� ��(oddSum)�� ¦���� ��(evenSum)�� ���Ͽ� ���
		int[] arr = {1, 4, 5, 8, 3, 7, 9, 2, 6};	// �迭(arr)�� �����ϰ� ���ÿ� ���� �Ҵ� : �ʱ�ȭ
		int oddSum = 0, evenSum = 0;				// ����� ����� ������ �ʱ�ȭ
		
		for (int i = 0; i < arr.length; i++) {
			if(arr[i] % 2 == 1) {
				oddSum += arr[i];
			} else {
				evenSum += arr[i];
			} // if else
		} // for
		
		System.out.println("�迭(arr)�� ���� �� : " + Arrays.toString(arr));
		System.out.println("Ȧ���� �� : " + oddSum);
		System.out.println("¦���� �� : " + evenSum);
	} // main()
} // class