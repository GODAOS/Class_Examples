import java.util.Scanner;

public class Test16_scanner2_operator {
	public static void main(String[] args) {
		// �� ���� ������ �Է�(num1, num2)���� �Ŀ�, ��Ģ������ �����ϰ� ����� ���
		Scanner scanner = new Scanner(System.in);
		System.out.print("ù ��° ������ �Է��ϼ��� : ");
		int num1 = Integer.parseInt(scanner.nextLine());
		System.out.print("�� ��° ������ �Է��ϼ��� : ");
		int num2 = Integer.parseInt(scanner.nextLine());
		scanner.close();
		
		System.out.println("ù ��° ���� : " + num1);
		System.out.println("�� ��° ���� : " + num2);
		System.out.println("������ ��� : " + (num1 + num2));
		System.out.println("������ ��� : " + (num1 - num2));
		System.out.println("������ ��� : " + (num1 * num2));
		System.out.println("�������� ��� : " + ((double)num1 / num2));
	} // main()
} // class