public class Ex05_Swap {
	public static void main(String[] args) {
		// swap(��ȯ) : �⺻ ������ Ÿ��(PDT), �迭(Array)
		int a = 10;
		int b = 20;
		System.out.println("��ȯ �� : a = " + a + ", b = " + b);
		
		// a�� b�� ���� ��ȯ�Ͽ� ����Ͻÿ�.
		int temp = a;		// ������ a���� ������ �ӽú����� �����ϰ� a���� �Ҵ�
		a = b;				// ���� a�� ���� b�� ���� ���Ҵ�
		b = temp;			// ���� b�� ���� temp�� ���� ���Ҵ�
		System.out.println("��ȯ �� : a = " + a + ", b = " + b);
	} // main()
} // class