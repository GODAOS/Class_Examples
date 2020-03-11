import java.util.Random;
import java.util.Scanner;

public class Ex18_HighLowGame {
	public static void main(String[] args) {
		// �� ���� ���߱� ���� : HighLowGame
		// 1 ~ 100 ������ ������ ���� ���� �Ҵ� �Ͽ� comNumber�� ���� �� Random
		Random random = new Random();				// Random ��ü�� ����
		int comNumber = random.nextInt(100) +1;		// 1 ~ 100 ������ ������ ���� ���� �Ҵ�
		
		// ����ڷκ��� ���ڸ� �Է¹ޱ� ���� �غ� �� Scanner
		Scanner scanner = new Scanner(System.in);	// Scanner ��ü�� ����
		int userNumber = 0;							// ����ڰ� �Է��� ���� ������ ����
		int count = 0;								// �õ� Ƚ���� ������ ������ �ʱ�ȭ
		
		// ���ӽ���
		do {
			System.out.print("1���� 100 ������ ���� ���� �Է��ϼ��� : ");
			userNumber = Integer.parseInt(scanner.nextLine());
			count++;
			
			if(comNumber > userNumber) {
				System.out.println("�� ū ���� �Է��ϼ���!");
				continue;
			} else if(comNumber < userNumber) {
				System.out.println("�� ���� ���� �Է��ϼ���!");
				continue;
			} else {
				System.out.println("������ϴ�!");
				System.out.println("�õ� Ƚ���� " + count + "�� �Դϴ�.");
				break;
			}
		} while(true);
		scanner.close();
	} // main()
} // class