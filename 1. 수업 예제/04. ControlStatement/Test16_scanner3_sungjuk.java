import java.util.Scanner;

public class Test16_scanner3_sungjuk {
	public static void main(String[] args) {
		// ���� ������ �Է��ϼ��� : XX (0 ~ 100)
		// ���� ������ �Է��ϼ��� : XX (0 ~ 100)
		// ���� ������ �Է��ϼ��� : XX (0 ~ 100)
		//
		// ���� ���� : XX
		// ���� ���� : XX
		// ���� ���� : XX
		// ���� : XX
		// ��� : XX
		// ���� : X����
		// =========================
		// ���� ������ �Է��ϼ��� : 789
		// ���� ������ �߸� �Է��ϼ̽��ϴ�!
		// ���� ������ �Է��ϼ��� : XX
		//
		// ���� ������ �Է��ϼ��� : 1000
		// ���� ������ �߸� �Է��ϼ̽��ϴ�!
		// ���� ������ �Է��ϼ��� : XX
		// ���� ���� : kor
		// ���� ���� : eng
		// ���� ���� : mat
		// ���� : sum
		// ��� : avg
		// ���� : grade
		
		Scanner scanner = new Scanner(System.in);
		
//		int kor = 0;			// ���� Ÿ�� ������ �ϳ��� ����
//		int eng = 0;
//		int mat = 0;
		int kor = 0, eng = 0, mat = 0;
		
		while(true) {
			System.out.print("���� ������ �Է��ϼ��� : ");
			kor = Integer.parseInt(scanner.nextLine());
			if(kor > 100 || kor < 0) {
				System.out.println("���� ������ �߸� �Է��ϼ̽��ϴ�!" + "\n");
				continue;
//			} else {			// ���� else ����� ������ �ʾƵ� �Ȱ���
//				break;
			} // if
			break;
		} // while
		System.out.println();
		
		while(true) {
			System.out.print("���� ������ �Է��ϼ��� : ");
			eng = Integer.parseInt(scanner.nextLine());
			if(eng > 100 || eng < 0) {
				System.out.println("���� ������ �߸� �Է��ϼ̽��ϴ�!" + "\n");
				continue;
//			} else {
//				break;
			} // if
			break;
		} // while
		System.out.println();
		
		while(true) {
			System.out.print("���� ������ �Է��ϼ��� : ");
			mat = Integer.parseInt(scanner.nextLine());
			if(mat > 100 || mat < 0) {
			System.out.println("���� ������ �߸� �Է��ϼ̽��ϴ�!" + "\n");
			continue;
//			} else {
//				break;
			} // if
			break;
		} // while
		scanner.close();
		System.out.println();

		int sum = kor + eng + mat;
		double avg = sum / 3.0;
		char grade = '0';
		System.out.println("���� ���� : " + kor);
		System.out.println("���� ���� : " + eng);
		System.out.println("���� ���� : " + mat);
		System.out.println("���� : " + sum);
		System.out.println("��� : " + avg);
//		if(avg <= 100 && avg > 90) {		// �Է¹��� ���� 0 ~ 100�����̹Ƿ� �翬�� ��յ� 100������
		if(avg > 90) {
			grade = 'A';
		} else if(avg > 80) {
			grade = 'B';
		} else if(avg > 70) {
			grade = 'C';
		} else if(avg > 60) {
			grade = 'D';
		} else {
			grade = 'F';
		} // if else
		System.out.println("���� : " + grade + "����");
	} // main()
} // class