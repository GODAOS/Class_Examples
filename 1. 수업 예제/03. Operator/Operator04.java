public class Operator04 {
	public static void main(String[] args) {
		// �� ������ �� ���ǹ��� ���� ���
		// ������ ����� true, false ��ȯ
		// >(gt), >=(ge), <(lt), <=(le) : ������ ����� ���� ���� ������ (�񱳿���)
		// a = b	: ���п����� ���ٶ�� �ǹ������� ���α׷������� �Ҵ�(����)�� �ǹ�
		// a == b	: ���α׷����� ���ٶ�� �ǹ�
		// a != b	: ���� �ʴٶ�� �ǹ�
		int a = 10, b = 5;
		System.out.println(a > b);	// true
		System.out.println(a >= b);	// true
		System.out.println(a < b);	// false
		System.out.println(a <= b);	// false
		System.out.println(a == b); // false
		System.out.println(a != b);	// true
	} // main()
} // class