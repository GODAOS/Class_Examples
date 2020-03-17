import java.util.Arrays;

public class Ex04Min {
	public static void main(String[] args) {
		// ������ �迭(arr[])�� ���� �� �߿��� �ּڰ�(min)�� ���Ͽ� ���
		int[]arr = {3, 2, 1, 4, 5}; // ������ �迭(arr[])�� �����ϰ� ���� �Ҵ� : �ʱ�ȭ
		
		int min = arr[0];
		for (int i = 0; i < arr.length; i++) {
			if(min > arr[i]) {	// ������ �ּڰ�(min)�� �迭(arr[])�� ���ڰ��� ���� ��
				min = arr[i];	// �迭 ���� ��(arr[i])�� �� ������, �ּڰ��� ����(arr[i]�� ������ ���Ҵ�)
			} // if
		} // for
		
		System.out.println("�迭�� ���� �� : " + Arrays.toString(arr));
		System.out.println("������ �ּڰ� : " + min);
		//========================================
		Arrays.sort(arr);	// �迭(arr[])�� ������������ ����
		System.out.println("�迭�� ���� �� : " + Arrays.toString(arr));
		System.out.println("������ �ּڰ� : " + arr[0]);
	} // main()
} // class