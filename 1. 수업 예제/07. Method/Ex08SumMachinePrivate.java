import java.util.Scanner;

public class Ex08SumMachinePrivate {
	// ���� ��(startNum)�� ���� ��(endNum)�� �Է¹��� ��
	// makeSum() �޼ҵ带 ȣ���ϰ� ��� ��(sum)�� return �޾� ���
	// makeSum() �޼ҵ�� Ex06SumMachine.java, 07SumMachineReturn.java Ŭ������ Ȱ��
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("���� ���� �Է��ϼ��� : ");
		int startNum = Integer.parseInt(scanner.nextLine());
		System.out.print("���� ���� �Է��ϼ��� : ");
		int endNum = Integer.parseInt(scanner.nextLine());
		scanner.close();
		
		Ex06SumMachine sm = new Ex06SumMachine();	// Ex06SumMachine ��ü ����
		sm.makeSum(startNum, endNum);		// ��Ʈ�� + �޼ҵ� Ŭ�� �� �ش� Ŭ������ �̵�
		// public ~~ makeSum() : ���������ڰ� public ���� �� �ܺο����� ��� ����
		
		Ex07SumMachineReturn smr = new Ex07SumMachineReturn();	// Ex07SumMachineReturn ��ü ����
//		smr.makeSum(startNum, endNum);	// ����
		// private ~~ makeSum() : ���������ڰ� private ���� �� ���ο����� ��� ����(��������)
	} // main()
} // class