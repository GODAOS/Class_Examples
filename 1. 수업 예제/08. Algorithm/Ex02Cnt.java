import java.util.Scanner;

public class Ex02Cnt {
	public static void main(String[] args) {
		// �� ���� ������ �Է¹޾�(num1, num2) �� �� ������ ������ ����(cnt)�� ���
		Scanner scanner = new Scanner(System.in);
		System.out.print("ù ��° ������ �Է��ϼ��� : ");
		int num1 = Integer.parseInt(scanner.nextLine());
		System.out.print("ù ��° ������ �Է��ϼ��� : ");
		int num2 = Integer.parseInt(scanner.nextLine());
		scanner.close();
		
		int cnt = 0;	// ������ ������ ����(cnt)�� �ʱ�ȭ
		for(int i = num1; i <= num2; i++) {
			cnt++;	// cnt = cnt +1; / cnt += 1;
		} // for
		
		System.out.println("ù ��° ���� : " + num1);
		System.out.println("�� ��° ���� : " + num2);
		System.out.println("�� �� ������ ������ ���� : " + cnt);
	} // main()
} // class