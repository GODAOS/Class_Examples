import java.util.Scanner;

public class Ex07SumMachineReturn {
	// ���� ��(startNum)�� ���� ��(endNum)�� �Է¹��� ��
	// makeSum() �޼ҵ带 ȣ���ϰ� ��� ��(sum)�� return �޾� ���
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("���� ���� �Է��ϼ��� : ");
		int startNum = Integer.parseInt(scanner.nextLine());
		System.out.print("���� ���� �Է��ϼ��� : ");
		int endNum = Integer.parseInt(scanner.nextLine());
		scanner.close();
		
		
		System.out.println("���� �� : " + startNum);
		System.out.println("���� �� : " + endNum);
//		System.out.println("���� �� : " + makeSum(startNum, endNum));
		Ex07SumMachineReturn smr = new Ex07SumMachineReturn();
		System.out.println("���� �� : " + smr.makeSum(startNum, endNum));
	} // main()
	
	// ���� ���� ���� ������ ���� ��(sum)�� ���ϰ� ����� �����ϴ� �޼ҵ�(makeSum())�� ����
	private int makeSum(int x, int y) {	// static ����, public �� private ����
		int sum =0;
		for(int i = x; i <= y; i++) {
			sum += i;
		} // if
		return sum;
	} // makeSum()
} // class