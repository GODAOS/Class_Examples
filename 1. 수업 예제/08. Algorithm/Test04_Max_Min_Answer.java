import java.util.Arrays;
import java.util.Scanner;

public class Test04_Max_Min_Answer {
	public static void main(String[] args) {
		Test04_Max_Min_Answer tmm = new Test04_Max_Min_Answer();
		int[] arr = tmm.input();
		tmm.maxMachine(arr);
		tmm.minMachine(arr);
		
	} // main()
	
	// �迭�� �����ϰ� ������ �Է¹޾� �����ϰ� �Ҵ��ϴ� �޼ҵ� (�޼ҵ带 ����� �ּ��� �޾��� ��)
	public int[] input() {
			Scanner scanner = new Scanner(System.in);
			System.out.print("�Է��� ���� ������ �Է��ϼ��� : ");
			int[] arr = new int[Integer.parseInt(scanner.nextLine())];
			System.out.println();
			
			for (int i = 0; i < arr.length; i++) {
				System.out.print((i + 1) + "��° ������ �Է��ϼ��� : ");
				arr[i] = Integer.parseInt(scanner.nextLine());
			} // for
			System.out.println("�Է��� �Ϸ��Ͽ����ϴ�.");
			System.out.println();
			System.out.println();
			scanner.close();
			System.out.println("�Է��Ͻ� �� : " + Arrays.toString(arr));
			return arr;
	} // input()
	
	// �迭�� �ִ��� ���ϰ� ����ϴ� �޼ҵ�
	public void maxMachine(int[] arr) {
		int max = arr[0];
		for (int i = 0; i < arr.length; i++) {
			if(max < arr[i]) {
				max = arr[i];
			} // if
		} // for
		System.out.println("�ִ� : " + max);
	} // maxMachine()
	
	// �迭�� �ּڰ��� ���ϰ� ����ϴ� �޼ҵ�
	public void minMachine(int[] arr) {
		int min = arr[0];
		for (int i = 0; i < arr.length; i++) {
			if(min > arr[i]) {
				min = arr[i];
			} // if
		} // for
		System.out.println("�ּڰ� : " + min);
	} // minMachine()
} // class