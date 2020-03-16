import java.text.DecimalFormat;
import java.util.Scanner;

public class Test03_Method03_1 {
	// ������ ���� �� ���� �Է¹޾�(num1, num2)
	// ��Ģ������ �����ϴ�, �޼ҵ带 ȣ��(add(), sub(), mul(), div()
	// ��� ���� �����Ͽ� ���
	// ��, �������� ����� �Ҽ� ��°�ڸ����� ǥ�� �� DecimalFormat Class
	// 0�� �� ĭ�� 0���� ä��, #�� �ǹ� ���� 0�� ǥ������ ����
	public static void main(String[] args) {	
		Scanner scanner = new Scanner(System.in);
		System.out.print("ù ��° ������ �Է��ϼ��� : ");
		int num1 = Integer.parseInt(scanner.nextLine());
		System.out.print("�� ��° ������ �Է��ϼ��� : ");
		int num2 = Integer.parseInt(scanner.nextLine());
		scanner.close();
		
		System.out.println("ù ��° ���� : " + num1);
		System.out.println("�� ��° ���� : " + num2);
		
		System.out.println("������ ��� : " + add(num1, num2));
		System.out.println("������ ��� : " + sub(num1, num2));
		System.out.println("������ ��� : " + mul(num1, num2));
		System.out.println("�������� ��� : " + div(num1, num2));
		System.out.println("�������� ��� : " + divResult(num1, num2));
	} // main()
	
	// �޼ҵ� ����
	public static int add(int x, int y) {
		return x + y;
	} // add()

	public static int sub(int x, int y) {
		return x - y;
	} // sub()
	
	public static int mul(int x, int y) {
		return x * y;
	} // mul()
	
	public static double div(double x, double y) {
		return x / y;
	} // div()

	public static String divResult(int x, int y) {
		DecimalFormat df = new DecimalFormat("0.00");	// DecimalFormat ����ϸ� ����� String Type
		return df.format((double)x / y);
	} // divResult()
} // class