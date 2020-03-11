import java.util.Random;
import java.util.Scanner;

public class Ex17_DiceGame {
	public static void main(String[] args) {
		// �� Dice Game(�ֻ�������)
		// ���� ���� : 1, ���� ���� : -1�� �Է��ϼ��� �� X
		// ���ڸ� �߸� �Է� �ϼ̽��ϴ�!
		
		// ���ӽ��� : 1, ���� ���� : -1�� �Է��ϼ��� �� -1
		// ������ �����մϴ�.
		
		// ���ӽ��� : 1, ���� ���� : -1�� �Է��ϼ��� �� 1
		// �ֻ��� ������ �����մϴ�^~^
		
		// ����ڰ� �ֻ����� �����ϴ�.
		// Enter Key�� �Է��ϼ���!
		// 1 ~ 6 ������ ���� �߿��� ������(������)�� ���ڸ� �Ҵ� : userNumber
		// ������� ���ڴ� X�Դϴ�.
		
		// ��ǻ�Ͱ� �ֻ����� �����ϴ�.
		// Enter Key�� �Է��ϼ���!
		// 1 ~ 6 ������ ���� �߿��� ������(������)�� ���ڸ� �Ҵ� : comNumber
		// ��ǻ���� ���ڴ� X�Դϴ�.
		
		// userNumber�� comNumber �� : You Win! // You Lose! // Draw!
		Scanner scanner = new Scanner(System.in);	// �Է��� �ޱ� ���� ��ü ����
		Random random = new Random();				// �������� ���ڸ� �Ҵ��ϱ� ���� ��ü ����
		
		// 1, -1 �̿��� ���ڰ� �ԷµǸ� �����޼����� ����ϰ� ���Է�
		while(true) {
			System.out.print("���� ���� : 1, ���� ���� : -1�� �Է��ϼ��� �� ");
			int userInput = Integer.parseInt(scanner.nextLine());
			if(userInput != 1 && userInput != -1) {
				System.out.println("���ڸ� �߸� �Է��ϼ̽��ϴ�!");
				continue;
			} // if 
			
			// -1�� �ԷµǸ� ������ ����(while ���� Ż��)
			if(userInput == -1) {
				System.out.println("������ �����մϴ�!");
				break;
			} // if
			
			// ������ ���� : ��ǻ���� ���ڸ� �������� �Ҵ�
			System.out.println("�ֻ��� ������ �����մϴ� ^~^");
			System.out.println("��ǻ�Ͱ� �ֻ����� �����ϴ�.");
			System.out.println("Enter Key�� �Է��ϼ���!");
			int comNumber = random.nextInt(6) + 1;
			System.out.println("��ǻ���� ���ڴ� " + comNumber + "�Դϴ�.\n");
			
			// ���и� ����, ��ǥ �¹��� 7:1:2
			int result = random.nextInt(10) + 1;	// ��� ���� result�� 1 ~ 10���� ����
			int userNumber = 0;
			
			if(result > 3) {						// ����� �¸� but comN=6�϶� ���º�
				if(comNumber == 6) {
					userNumber = 6;
				} else {
					userNumber = 6 - random.nextInt(6 - comNumber);
				} // if else
			} // if win

			if(result == 3) {						// ���º�
				userNumber = comNumber;
			} // if draw
			
			if(result < 3) {						// ����� �й� but comN=1�϶� ���º�
				if(comNumber == 1) {
					userNumber = 1;
				} else {
					userNumber = random.nextInt(comNumber - 1) + 1;
				} // if else
			} // if lose
			
			// ������� ���ڸ� �������� �Ҵ�
			System.out.println("����ڰ� �ֻ����� �����ϴ�.");
			System.out.print("Enter Key�� �Է��ϼ���!");
			scanner.nextLine();		// ���ŷ �޼ҵ� : ����ڷκ��� �Է��� ����ϰ�, �Է��� �Ǹ� �Է°��� ó��
			System.out.println("������� ���ڴ� " + userNumber + "�Դϴ�.\n");
			
			// ������� ����(userNumber�� ��ǻ���� ����(comNumber)�� ���ؼ� ����� ���
			if(userNumber > comNumber) {
				System.out.println("Result : You Win!!!");
			} else if(userNumber < comNumber) {
				System.out.println("Result : You Lose!!!");
			} else {
				System.out.println("Result : Draw!!!");
			} // if
		} // while
		scanner.close();
	} // main()
} // class