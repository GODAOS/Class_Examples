import java.util.Scanner;

public class Ex03_Method03 {
	// ������ �Ǽ� 2���� �Է¹޾�(num1, num2) �� Scanner
	// �� �Ǽ��� ���� ���Ͽ� �����ϴ� �޼ҵ�(getSum)�� ȣ��
	// ����� ���
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("ù ��° �Ǽ��� �Է��ϼ��� : ");
		double num1 = Double.parseDouble(scanner.nextLine());
		System.out.print("�� ��° �Ǽ��� �Է��ϼ��� : ");
		double num2 = Double.parseDouble(scanner.nextLine());
		scanner.close();
		
		double sum = getSum(num1, num2);
		System.out.println("ù ��° �Ǽ� : " + num1);
		System.out.println("�� ��° �Ǽ� : " + num2);
		System.out.println("�� �Ǽ��� �� : " + sum);
		System.out.println("�� �Ǽ��� �� : " + getSum(num1, num2));
	} // main()
	
	// ������ �Ǽ� 2���� ���� �޾�, �� �Ǽ��� ��(sum)�� ���Ͽ� �����ϴ� �޼ҵ�(getSum())�� ����
	public static double getSum(double num1, double num2) {
//		double sum = num1 + num2;
//		return sum;
		return num1 + num2;
	} // getSum()
} // class
