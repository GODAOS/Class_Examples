public class Casting02 {
	public static void main(String[] args) {
		char upper = 'A';
		char lower = 'a';
		
		System.out.println(upper);			// ��°� : A(65)
		System.out.println(lower);			// ��°� : a(97)
		System.out.println(upper + lower);	// ��°� : 162
		
		// �빮��(upper)�� �ҹ��ڷ� �ٲپ ����Ͻÿ�.
		System.out.println((char)(upper + 32));
		
		// �Ʒ��� ����� �� ���� ����ȯ�� �߻��ϴ°�?
		// double sum = 3.5F + 12;
		//�� 3.5F + 12.0F �� int �� float ��ȣ�� �������� �����ʺ��� ���� ������ 12�� float�� �ٲ�
		//�� double sum = 15.5F �� float �� double
	} // main()
} // class