import java.util.Scanner;

public class Test03_Method03_2 {
	// ������ ���� �ΰ��� �Է¹޾�(su1, su2)
	// ¦���� ��(evenSum)�� Ȧ���� ��(oddSum)�� ���ϴ� �޼ҵ� ȣ��(evenSum(), oddSum())
	// ��� ���� �����Ͽ� ���
	// ��, ù ��° ������ ���� ���� �Է� �ް�, �� ��° ������ ū ���� �Է¹޴´�.
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		int su1 = 0;
		int su2 = 0;
		
		while(true) {
			System.out.print("ù ��° ������ �Է��ϼ��� : ");
			su1 = Integer.parseInt(scanner.nextLine());
			System.out.print("�� ��° ������ �Է��ϼ��� : ");
			su2 = Integer.parseInt(scanner.nextLine());
			System.out.println();
			
			if(su1 > su2) {
				System.out.println("ù ��° ������ ���� ��, �� ��° ������ ū ���� �Է��ϼ���!");
				System.out.println("=======================================");
				continue;
			} // if
			break;
		} // while
		scanner.close();

		System.out.println("ù ��° ���� : " + su1);
		System.out.println("�� ��° ���� : " + su2);
		System.out.println(su1 + "���� " + su2 + "������ ¦���� ���� �� : " + evenSum(su1, su2));
		System.out.println(su1 + "���� " + su2 + "������ Ȧ���� ���� �� : " + oddSum(su1, su2));
	} // main()
	
	// ¦���� ��
	public static int evenSum(int x, int y) {
		int evenSum = 0;
		for(int i = x; i <= y; i++) {
			if(i % 2 == 0) {
				evenSum += i;
			} // if
		} // for
		return evenSum;
	} // evenSum()
	
	// Ȧ���� ��
	public static int oddSum(int x, int y) {
		int oddSum = 0;
		for(int i = x; i <= y; i++) {
			if(i % 2 == 1) {
				oddSum += i;
			} // if
		} // for
		return oddSum;
	} // oddSum()
} // class