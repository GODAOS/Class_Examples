package sec02;

import java.util.Scanner;

public class q06 {
	public static void main(String[] args) {
		// ���� ����� ���� �˸°� �ۼ��Ͻÿ�.
		boolean run = true;
		int studentNum = 0;
		int[] scores = null;
		Scanner scanner = new Scanner(System.in);
		
		while(run) {
			System.out.println("-----------------------------------------");
			System.out.println("1. �л��� | 2. ���� �Է� | 3. ���� ����Ʈ | 4. �м� | 5. ����");
			System.out.println("-----------------------------------------");
			System.out.print("����> ");
			
			int selectNo = Integer.parseInt(scanner.nextLine());
			
			if(selectNo == 1) {
				// �ۼ� ��ġ
				System.out.print("�л���> ");
				studentNum = Integer.parseInt(scanner.nextLine());
				scores = new int[studentNum];
			} else if(selectNo == 2) {
				// �ۼ� ��ġ
				for (int i = 0; i < scores.length; i++) {
					System.out.print("scores[" + i + "]> " );
					scores[i] = Integer.parseInt(scanner.nextLine());
				} // for
			} else if(selectNo == 3) {
				// �ۼ� ��ġ
				for (int i = 0; i < scores.length; i++) {
					System.out.println("scores[" + i + "]> " + scores[i]);
				} // for
			} else if(selectNo == 4) {
				// �ۼ� ��ġ
				int sum = 0;
				double avg = 0;
				int max = 0;
//				int cnt = 0;
				for (int i = 0; i < scores.length; i++) {
					sum += scores[i];
//					cnt++;
					if(max < scores[i]) {
						max = scores[i];
					} // if
				} // for
//				avg = (double)sum / cnt;
				avg = (double)sum / studentNum;
				System.out.println("�ְ� ���� : " + max);
				System.out.println("��� ���� : " + avg);
			} else if(selectNo == 5) {
				run = false;
			} // if else if
		} // while
		
		System.out.println("���α׷� ����");
	} // main()
} // class