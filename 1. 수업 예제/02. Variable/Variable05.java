public class Variable05 {
	public static void main(String[] args) {
		// ���� ������ Ÿ�� : char(2Byte) �� �ϳ��� ���ڸ� ���� : �����ڵ�
		// ���� �Ҵ�(����)�� ���� ��������ǥ�� ����Ѵ�.
		char a = 'A';
		char b = '��';
		char c = '��';
		System.out.println("���� a�� �� : " + a);
		System.out.println("���� b�� �� : " + b);
		System.out.println("���� c�� �� : " + c);
		
		// String : ����, ���ڿ��� ������ �� �ִ� Ŭ���� �� ������ �ڷ�(Reference Type) �� 4Byte
		// ���� �Ҵ�(����)�� ���� �ֵ���ǥ�� ����Ѵ�.
		String str1 = "ABCD";
		String str2 = "�����ٶ�";
		System.out.println("���� str1�� �� : " + str1);
		System.out.println("���� str2�� �� : " + str2);
		
		String str3 = "null"; // ������ Ÿ���� �ʱ�ȭ�Ҷ� null�� ����Ѵ�.
	} // main()
} // class