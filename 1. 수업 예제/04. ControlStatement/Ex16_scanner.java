import java.util.Scanner;

public class Ex16_scanner {
	public static void main(String[] args) {
		// �Է�â���� ����(score)�� �Է¹��� ��, ������ ����ϴ� ���α׷� �� Scanner (�Է�), if (����)
		// Scanner ��ü ���� : new Scanner(); �� Ű����κ��� �Է� : System.in
		Scanner scanner = new Scanner(System.in);
		while(true) {
			System.out.print("������ �Է��ϼ��� : ");		// ��ŷ ���� : Ű����κ��� �Է��� ����ϴ� ����
			int score = scanner.nextInt();
			System.out.println("�Է��Ͻ� ������ " + score + "���Դϴ�.");
			
			if(score >= 0 && score <= 100) {
				if(score >= 90) {
					System.out.println("����� ������ A�����Դϴ�.");
				} else if(score >= 80) {
					System.out.println("����� ������ B�����Դϴ�.");
				} else if(score >= 70) {
					System.out.println("����� ������ C�����Դϴ�.");
				} else if(score >= 60) {
					System.out.println("����� ������ D�����Դϴ�.");
				} else {
					System.out.println("����� ������ F�����Դϴ�.");
				} // if
				break;
			} else {
				System.out.println("������ �߸� �Է��ϼ̽��ϴ�!");
			} // if
		} // while
		scanner.close();
	} // main()
} // class