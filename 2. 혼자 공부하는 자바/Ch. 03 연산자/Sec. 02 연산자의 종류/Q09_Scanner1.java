package sec02;

import java.util.Scanner;

public class Q09_Scanner1 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("ù ��° �� : ");
		String a = scanner.nextLine();
		
		System.out.print("�� ��° �� : ");
		String b = scanner.nextLine();
		System.out.println("--------------------------");

		double num1 = Double.parseDouble(a);
		double num2 = Double.parseDouble(b);
		double result = num1 / num2;
		
		if((num2 == 0) || (num2 == 0.0)) {
			System.out.println("��� : ���Ѵ�");
			} else {System.out.println("��� : " + result);
		} // if
	} // main()
} // class