import java.util.Scanner;

public class Test16_scanner1 {
	public static void main(String[] args) {
		// ����ڷκ��� ����ϰ� ���� �������� �Է�(danNumber)�޴´�. �� Scanner
		// �Է¹��� ���� �������� ����Ѵ� �� �ݺ���(for, while, do~while)
		// ��, �Է¹��� ���� ������ 2�ܺ��� 9�ܱ����̸� �� if, break
		// �� ���� ���� �ԷµǸ� �����޼����� ����ϰ� ���Է� �޴´�. �� while, continue
		Scanner scanner = new Scanner(System.in);
		while(true) {
			System.out.print("����ϰ� ���� ���� �Է��ϼ��� : ");
			int danNumber = scanner.nextInt();
			
			if(danNumber > 9 || danNumber < 2) {
				System.out.println("2 ~ 9 ������ �ܼ��� �Է��ϼ���!" + "\n");
				continue;
			} else {
				System.out.println(danNumber + "���� ����մϴ�.");
				for(int i = 1; i < 10; i++) {
					if(danNumber * i < 10) {
						System.out.println(danNumber + " X " + i + " = 0" + danNumber*i);
					} else {
						System.out.println(danNumber + " X " + i + " = " + danNumber*i);
					} // if else
				} // for
			} // if else
			break;
		} // while
		scanner.close();
	} // main()
} // class