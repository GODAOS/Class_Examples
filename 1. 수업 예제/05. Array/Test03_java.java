import java.util.Random;
import java.util.Scanner;

public class Test03_java {

	public static void main(String[] args) {
		// Test.java : ���弱�� ���α׷�
		// �л������ ����� �迭 ���� : String[] student = new String[16];
		// 1�� ~ 16�� �л��� �̸��� �Է¹޾� �迭�� ���� : Scanner
		// # 1�� �л��� �̸��� �Է� : XXX
		// # 16�� �л��� �̸��� �Է� : XXX
		// - �Է��� �Ϸ�Ǹ� �Է��� �л��� ����� ����Ѵ�
		// # �Է��� �Ϸ��ϼ̽��ϴ�!
		// # 1�� : XXX
		// # 16�� : XXX
		// ���� ������ ���� Enter Key�� �Է¹޾�, �������� �Ҵ�� ���� ���� �������� �ش� ��ȣ�� �ش�Ǵ� �л��� �������� �����Ѵ�.
		// # ������ �����մϴ�. Enter Key�� �Է��ϼ���!
		// X�� �л��� XXX���� ����Ǿ����ϴ�.
		// # �����մϴ�!
		String[] student = new String[16];
		Scanner scanner = new Scanner(System.in);
		
		// �л� �̸� �Է�
		for (int i = 0; i < student.length; i++) {
			if((i + 1) < 10) {
				System.out.print("0");
			} // if
			System.out.print((i + 1) + "�� �л��� �̸��� �Է� : ");
			student[i] = scanner.nextLine(); 
		} // for
		System.out.println("=======================================" + "\n");
		
		// �л� �̸� ���
		for (int i = 0; i < student.length; i++) {
			if((i + 1) < 10) {
				System.out.print("0");
			} // if
			System.out.print((i + 1) + "�� �л� : " + student[i] + "\t");
			if((i + 1) % 4 == 0) {
				System.out.println();
			} // if
		} // for
		System.out.println("=======================================" + "\n");
		
		// ���� ����
		Random random = new Random();
		System.out.println("���� ������ �����մϴ�. Enter key�� �Է��ϼ���!");
		scanner.nextLine();
		int classLeader = random.nextInt(16);
		System.out.println("�����մϴ�! " + (classLeader + 1) + "�� �л� " + student[classLeader] + "���� ����Ǿ����ϴ�.");
	} // main()
} // class