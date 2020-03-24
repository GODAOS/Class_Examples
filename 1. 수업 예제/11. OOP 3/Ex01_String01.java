import java.util.Arrays;

public class Ex01_String01 {
	// String Class : ���ڿ��� �����ϱ� ���� ����� ��� �ִ� Ŭ����
	// SunMicroSystem(Oracle) ��ü���� �̸��� �����Ͽ� ���� �� API(Library)
	// API ����(����) : www.oracle.collm > Java APIs
	// JRE System Library > rt.jar > java.lang > String.class
	public static void main(String[] args) {
		String str1 = "apple";	// apple ���ڿ��� str1 ������ �Ҵ�
		String str2 = new String("APPLE");	// APPLE str2 ��ü�� �Ҵ�
		
		System.out.println(str1);
		System.out.println(str2);
		
		// ���ڿ��� ���� : length()
		System.out.println("str1�� ���� : " + str1.length());
		
		// �빮�ڷ� ���� : toUpperCase()
		System.out.println("str1�� �빮�ڷ� ���� : " + str1.toUpperCase());
		
		// �ҹ��ڷ� ���� : toLowerCase()
		System.out.println("str2�� �ҹ��ڷ� ���� : " + str2.toLowerCase());
		
		// Ư�� ���ڸ� ���� : subString()
		System.out.println(str1.substring(1));		// index 1���� ������ ���� (a�� index 0)
		System.out.println(str2.substring(1, 3));	// index 1���� 3�� �ձ��� ����
		
		// ���ڿ����� Ư�� ���� �� ���ڸ� ��� : charAt()
		System.out.println(str2.charAt(3));
		System.out.println(str2.substring(3, 4));
		
		// Ư�� ������ ���� ���� : indexOf() �� ���� : index ���� ��ȯ, ���� : -1
		int index = str2.indexOf("B");
		System.out.println(index);
		
		// ���ڿ� �и� : split()
		String str3 = "����@�ٶ�@����";
		String[] sp = str3.split("@");
		for (int i = 0; i < sp.length; i++) {
			System.out.println(sp[i]);
		}
		System.out.println(Arrays.toString(sp));
		
		// ���ڿ� ġȯ(ã�� �ٲٱ�) : replaceAll()
		System.out.println(str2.replaceAll("PP", "@@"));	// PP �� @@
		System.out.println(str2.replaceAll("P", "@@"));	// PP �� @@@@
		
		// �¿� ���� ���� : trim()
		String str4 = "   abc   def   ";
		System.out.println(str4);
		System.out.println("���� ���� �� ���� : " + str4.length());
		System.out.println(str4.trim());
		System.out.println("���� ���� �� ���� : " + str4.trim().length());
	} // main()
} // class