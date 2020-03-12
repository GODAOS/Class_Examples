public class Ex01_Array01 {
	public static void main(String[] args) {
		// ������ ������ �迭(arr)�� �����ϰ�
		// ������ �迭�� ���̸� 3���� �����ϰ�
		// ��� ��ҿ� 10�� �Ҵ��ϰ� ����Ͻÿ�.
		
		int[] arr;				// ������ �迭 arr�� ���� : int arr[];
		arr = new int[3];		// �迭�� ����
//		int[] arr = new int[3];	// �迭�� ���� �� ����
		
		arr[0] = 10;	// �迭(arr)�� 0����(index)�� 10�� �Ҵ�
		arr[1] = 10;	// �迭(arr)�� 1����(index)�� 10�� �Ҵ�
		arr[2] = 10;	// �迭(arr)�� 2����(index)�� 10�� �Ҵ�
		
		System.out.println("arr[0]�� �� : " + arr[0]); // �迭(arr)�� 0����(index) ���� ���
		System.out.println("arr[1]�� �� : " + arr[1]); // �迭(arr)�� 1����(index) ���� ���
		System.out.println("arr[2]�� �� : " + arr[2]); // �迭(arr)�� 2����(index) ���� ���
		
		System.out.println(arr);	// �迭(arr)�� �����ϴ� �޸��� �ؽ��ڵ� ���� ���(16����)
	} // main()
} // class

/*
 * ��ɾ� ����
  Opcode	R		Operand
   	��ɺ�	��������	����
  
 * Stack : FILO (First In Last Out)
  			Memory
  Pop	��	C		�� Push
  			B
  			A
 Memory
 ����	������
 1	xx
 2	xx
 3	10
 :	:
 10	100
 
 */