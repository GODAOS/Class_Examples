import java.util.Scanner;

public class Ex06SumMachine {
	// ���� ��(startNum)�� ���� ��(endNum)�� �Է¹��� ��, makeSum() �޼ҵ带 ȣ��
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("���� �� : ");
		int startNum = Integer.parseInt(scanner.nextLine());
		System.out.print("���� �� : ");
		int endNum = Integer.parseInt(scanner.nextLine());
		scanner.close();
		
//		makeSum(startNum, endNum);						// ���� : makeSum() �޼ҵ忡 static�� ����
		Ex06SumMachine sm = new Ex06SumMachine(); 		// ��ü�� ����
		sm.makeSum(startNum, endNum); 					// ������ ��ü �ȿ� �ִ� �޼ҵ带 ȣ��
	} // main()
	
	// ���� ���� ���� ������ ���� ���� ���ϰ� ����ϴ� �޼ҵ�(makeSum())�� ����
	public void makeSum(int x, int y) {	//static ����
		int sum = 0;
		for(int i = x; i <= y; i++) {
			sum += i;
		} // for
		System.out.println("���� �� : " + sum);
	} // makeSum()
} // class