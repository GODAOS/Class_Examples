public class Operator02 {
	public static void main(String[] args) {
		// ���� ������ : ++(����), --(����) �� �ݺ������� ���� ���
		// ���� ������ : ������ ���� ����� ó������ ���� ������
		// �������� ��ġ�� ������ ������ �������� ���� ����� �ٸ���.
		int a= 0;
		int b = 10;
		System.out.println(++a);	// ��°� : 1
		System.out.println(--b);	// ��°� : 9
		System.out.println(a);		// ��°� : 1
		System.out.println(b);		// ��°� : 9
		
		int c = 0;
		int d = 10;
		System.out.println(c++);	// ��°� : 0
		System.out.println(d--);	// ��°� : 10
		System.out.println(c);		// ��°� : 1
		System.out.println(d);		// ��°� : 9
		
		//����. x = 5, y = 10�� ��� 'x++ + ++x + y++'�� �����
		//������ ����� �� 'x + y'�� �����?
		int x = 5, y = 10;
		int z = x++ + ++x + y++;
		System.out.println(z);		// ��°� : 22 (5 + 7 + 10)
		System.out.println(x + y);	// ��°� : 18 (7 + 11)
		System.out.println(x);
		System.out.println(y);
		
		/*
		  ����		���	�޸�
		 x++	5	6
		 ++x	7	7
		 y++	10	11
		 */
		
		// Ctrl + / �ش� ���� �ּ�
		// Ctrl + Shift + / �ش� ��� ��ü �ּ�
		// Ctrl + Shift + \ �ش� ��� ��ü �ּ� ����
	} // main()
} // class