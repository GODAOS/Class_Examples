package sec02;

import java.util.Scanner;

public class Q07_Scanner {
	public static void main(String[] args) {
		// while���� Scanner�� �̿��ؼ� Ű����� �Էµ� �����ͷ� ����, ���, ��ȸ, ���� ����� �����ϴ� �ڵ带 ���μ� ������ �ۼ��϶�.
		// ��, Scanner�� nextLine()�� ����Ѵ�.
		boolean run = true;
		int balance = 0;
		Scanner scanner = new Scanner(System.in);
		
		while(run) {
			System.out.println("--------------------------------");
			System.out.println("1. ���� | 2. ��� | 3. �ܰ� | 4. ����");
			System.out.println("--------------------------------");
			System.out.print("����> ");
//			=====================================================================
			int choice = Integer.parseInt(scanner.nextLine());
			if(choice == 1) {
				System.out.print("���ݾ�>");
				int deposit = Integer.parseInt(scanner.nextLine());
				balance += deposit;
				System.out.println();
			} else if(choice == 2) {
				System.out.print("��ݾ�>");
				int withdraw = Integer.parseInt(scanner.nextLine());
				balance -= withdraw;
				System.out.println();
			} else if(choice == 3) {
				System.out.print("�ܰ�>" + balance + "\n" + "\n");
			} else if(choice == 4) {
				break;
			} //if else if
		} // while
		System.out.println("\n" + "���α׷� ����");
		scanner.close();
	} // main()
} // class