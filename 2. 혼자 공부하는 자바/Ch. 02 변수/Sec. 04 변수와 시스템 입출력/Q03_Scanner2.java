package sec04;

import java.util.Scanner;

public class Q03_Scanner2 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		

		
		System.out.println("[�ʼ� ���� �Է�]");
		
		System.out.print("1. �̸� : ");
		String name = scanner.nextLine();
		
		System.out.print("2. �ֹι�ȣ �� 6�ڸ� : ");
		String regNo = scanner.nextLine();
		
		System.out.print("3. ��ȭ��ȣ : ");
		String tel = scanner.nextLine();
		
		System.out.println();
		
		System.out.println("[�Է��� ����]");
		System.out.println(name);
		System.out.println(regNo);
		System.out.println(tel);
	} // main()
} // class