import java.util.Arrays;

public class Ex01Sum {
	public static void main(String[] args) {
		// ������ �迭(arr[])�� ���Ұ��� ������(sum)�� ���Ͽ� ���
		int[] arr = {3, 2, 4, 1, 5};	// ������ �迭(arr[])�� �����ϰ� ���� �Ҵ� : �ʱ�ȭ
		int sum = 0;					// �������� ����� ������ ����(sum)�� �����ϰ� ���� �Ҵ� : �ʱ�ȭ
		
		for (int i = 0; i < arr.length; i++) {
			sum += arr[i];				// ������ ���
		} // for
		
		System.out.println("�迭�� ���Ұ� : " + Arrays.toString(arr));
		System.out.println("������ ������ : " + sum);
	} // main()
} // class