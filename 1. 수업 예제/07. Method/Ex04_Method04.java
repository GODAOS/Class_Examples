import java.util.Arrays;

public class Ex04_Method04 {
	//������ �迭(arr[])�� �Ű� ������ �����Ͽ�, ����(sum)�� ���Ͽ� ����ϴ� �޼ҵ�(arrSum()) ȣ��
	public static void main(String[] args) {
		int[] arr = {10, 20, 30};	// �Ű� ������ ������ ������ �迭(arr[])�� ���� �� �ʱ�ȭ
		arrSum(arr);				// arrSum() �޼ҵ带 ȣ�� : ���μ�
	} // main()
	
	// ������ �迭(arr[])�� �Ű������� ���� �޾�, ����(sum)�� ���Ͽ� ����ϴ� �޼ҵ带 ����
	public static void arrSum(int[] arr) {	// arrSum() �޼ҵ带 ���� : ���μ�
		int sum = 0;
		for (int i = 0; i < arr.length; i++) {
			sum += arr[i];
		} // for
		System.out.println("�迭 arr[]�� ���� �� : " + Arrays.toString(arr));
		System.out.println("�迭 arr[]�� ���� : " + sum);
	} // arrSum()
} // class