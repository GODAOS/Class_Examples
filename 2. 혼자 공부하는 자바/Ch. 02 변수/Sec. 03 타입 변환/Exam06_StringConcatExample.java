package sec03;

public class Exam06_StringConcatExample {
	public static void main(String[] args) {
		// ���� ����
		int value = 10 + 2 + 8;
		System.out.println("value : " + value);
		
		// ���ڿ� ���� ����
		String str1 = 10 + 2 + "8"; 	// ���� + ���� + "���ڿ�" = ���� + "���ڿ�" = "���ڹ��ڿ�"
		System.out.println("str1 : " + str1);
		
		String str2 = 10 + "2" + 8; 	// ���� + "���ڿ�" + ���� = "���ڹ��ڿ�����"
		System.out.println("str2 : " + str2);
		
		String str3 = "10" + 2 + 8; 	// "���ڿ�" + ���� + ���� = "���ڿ����ڼ���"
		System.out.println("str3 : " + str3);
		
		String str4 = "10" + (2 + 8); 	// "���ڿ�" + (���� + ����) = "���ڿ�" + ���� = "���ڿ�����"
		System.out.println("str4 : " + str4);
	}
}