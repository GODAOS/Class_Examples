import java.util.Arrays;

public class Ex03Max {
	public static void main(String[] args) {
		// ������ �迭(arr[])�� ���� �� �߿��� �ִ� ��(max)�� ���Ͽ� ���
		int[] arr = {3, 2, 4, 1, 5};	// ������ �迭(arr[])�� �����ϰ� ���� �Ҵ� : �ʱ�ȭ

		int max = arr[0];				// �ִ� ���� ����� ����(max)�� �ʱ�ȭ �� �迭�� ù��° index �Ҵ�
		for (int i = 0; i < arr.length; i++) {
			if(max < arr[i]) {			// ������ �ִ� ��(max)�� �迭(arr[])�� ���� ���� ��
				max = arr[i];			// �迭 ���� ��(arr[i])�� �� ũ��, �ִ� ���� ����(arr[i]�� ������ ���Ҵ�)
			} // if
		} // for
		
		System.out.println("�迭�� ���� �� : " + Arrays.toString(arr));
		System.out.println("������ �ִ� �� : " + max);
		//========================================
		Arrays.sort(arr);	// �迭(arr[])�� ������������ ����
		System.out.println("�迭�� ���� �� : " + Arrays.toString(arr));
		System.out.println("������ �ִ� �� : " + arr[arr.length - 1]);
	} // main()
} // class