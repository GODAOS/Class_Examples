package sec02;

public class Ex05_MainStringArrayArgument {
	public static void main(String[] args) {
		// main() �޼ҵ��� �Ű� ����
		if(args.length != 2) {			// �Էµ� �������� ������ 2���� �ƴ� ���
			System.out.println("���� ���� �����մϴ�.");
			System.exit(0);				// ���α׷� ���� ����
		} // if
		
		String strNum1 = args[0];		// ù ��° ������ ���
		String strNum2 = args[1];		// �� ��° ������ ���
		
		int num1 = Integer.parseInt(strNum1);	// ���ڿ��� ������ ��ȯ
		int num2 = Integer.parseInt(strNum2);	// ���ڿ��� ������ ��ȯ
		
		int result = num1 + num2;
		System.out.println(num1 + " + " + num2 + " = " + result);
	} // main()
} // class