public class Ex02_String02 {
	// ���ڿ��� ��� ���� ��(compareTo()), compareToIgnoreCase(), ������� ��(equals(), equalsIgnoreCase())
	public static void main(String[] args) {
		String str1 = "APPLE";
		String str2 = "ORANGE";
		String str3 = "APPLE";
		String str4 = "apple";
		
//		if(str1 > str2) {}	�� ���� : ���ڿ��� ��� ����� �� �����ڸ� ����� �� ����.
		// ���ڿ��� �񱳴� �����ڵ� ������ ���Ѵ� �� compareTo()
		// compareTo() ��� : ���, 0, ����
		int result = str1.compareTo(str2);
		System.out.println(result);	// -14(����) : str2�� �� ũ��
		// A�� �ƽ�Ű�ڵ� = 65 O�� �ƽ�Ű �ڵ� = 79 ù���ڰ� ������ ���� ���ڸ� ���Ѵ�

		result = str1.compareTo(str3);
		System.out.println(result);	// 0 : str1�� str2�� ����
		
		result = str1.compareTo(str4);
		System.out.println(result); // -32(����) : str4�� �� ũ��
		
		result = str1.compareToIgnoreCase(str4);	// ��ҹ��� ���о��� ��
		System.out.println(result);	// 0 : str1�� str4�� ����
		
		// ���ڿ��� ������ �ٸ���(�������)�� �Ǵ� �� if(str1.compareTo(str2) == 0)
		if(str1.equals(str4)) {		// equals() : true, false ��ȯ
			System.out.println(str1 + "��(��) " + str4 + "��(��) ����.");
		} else {
			System.out.println(str1 + "��(��) " + str4 + "��(��) ���� �ʴ�.");
		}

		if(str1.equals(str4.toUpperCase())) {
			System.out.println(str1 + "��(��) " + str4 + "��(��) ����.");
		} else {
			System.out.println(str1 + "��(��) " + str4 + "��(��) ���� �ʴ�.");
		}
		
		if(str1.toLowerCase().equals(str4)) {
			System.out.println(str1 + "��(��) " + str4 + "��(��) ����.");
		} else {
			System.out.println(str1 + "��(��) " + str4 + "��(��) ���� �ʴ�.");
		}
		
		if(str1.equalsIgnoreCase(str4)) {	// ��ҹ��� ���о��� ���Ѵ�
			System.out.println(str1 + "��(��) " + str4 + "��(��) ����.");
		} else {
			System.out.println(str1 + "��(��) " + str4 + "��(��) ���� �ʴ�.");
		}
	} // main()
} // class	