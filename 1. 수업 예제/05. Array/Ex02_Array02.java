public class Ex02_Array02 {
	public static void main(String[] args) {
		// ���� 3���� ������ �迭(arr)�� �����ϰ�
		// ���ÿ� ��� ��ҿ� 10�� �Ҵ��Ͻÿ� ��
		int[] arr = {10, 10, 10};	// ������ �迭 arr�� �����ϰ� �ٷ� ���� �Ҵ�
		
		// �迭(arr)�� ��� ����� ����(sum)�� ���Ͽ� ����Ͻÿ�.
//		int sum = arr[0] + arr[1] + arr[2];
		int sum = 0;
		for (int i = 0; i < arr.length; i++) { // for �Է��ϰ� �ڵ� �ϼ�,	�迭�� ���� arr.length
			sum += arr[i];
		} // for	
		
		System.out.println("�迭(arr)�� ���� : " + sum);
		System.out.println("�迭(arr)�� ���� : " + arr.length);
	} // main()
} // class

/*
	�� �迭(Array) : ��ü(Object)�� ��� �� ������(Reference) �ڷ� ����
		- ������ ��� ������ �޸𸮿� ���������� �����ϴ� ���� : ����Ʈ(����) ����
		- ���� Ÿ���� ���� �������� ����
		- �迭�� �����ϰ� ������ ��, ���߿� ���빰(���Ұ�)�� ä��� ���	 	�� Ex01_Array01.java
		- �迭�� �����ϴ� ���ÿ� �迭���� ���빰(���Ұ�)�� ���� ä��� ���	�� Ex02_Array02.java
		- �迭�� ������  �ݵ�� ��ҹ�ȣ(index)�� �����ϸ�, index�� 0���� ����
		- �迭�� ���� : �迭��.length
		- �迭�� ������ ������ index �� : �迭�� ũ�� - 1 �� arr.length - 1
 */