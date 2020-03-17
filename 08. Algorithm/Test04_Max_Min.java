import java.util.Arrays;
import java.util.Scanner;

public class Test04_Max_Min {
	// ������ �迭�� ���̸� �Է¹��� ��, �迭 ����(arr[]) �� Scanner
	// arr[] �迭�� ���̿� �°� ������ ������ �Է¹޾� �迭�� �Ҵ� �� for
	// maxMachine() : �迭(arr[])�� �ִ�(max)�� ���Ͽ� ���
	// minMachine() : �迭(arr[])�� �ּڰ�(min)�� ���Ͽ� ���
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("�Է��� ���� ������ �Է��ϼ��� : ");
		int[] arr = new int[Integer.parseInt(scanner.nextLine())];
		System.out.println();
		
		for (int i = 0; i < arr.length; i++) {
			System.out.print((i + 1) + "��° ������ �Է��ϼ��� : ");
			arr[i] = Integer.parseInt(scanner.nextLine());
//			if(i == (arr.length - 1)) {
//				System.out.println("�Է��� �Ϸ��Ͽ����ϴ�.");
//				System.out.println();
//			} // if
		} // for
		System.out.println("�Է��� �Ϸ��Ͽ����ϴ�.");
		System.out.println();
		scanner.close();
		
//		System.out.print("�Է��Ͻ� �� : [");
//		for (int i = 0; i < arr.length; i++) {
//			System.out.print(arr[i] + ", ");
//			if(i == (arr.length - 1)) {
//				System.out.println("\b" + "\b" + "]");
//			} // if
//		} // for
		
		System.out.println("�Է��Ͻ� �� : " + Arrays.toString(arr));
		
		Test04_Max_Min mac = new Test04_Max_Min();
		mac.maxMachine(arr);
		mac.minMachine(arr);
	} // main()
	
	public void maxMachine(int[] arr) {
		int max = arr[0];
		for (int i = 0; i < arr.length; i++) {
			if(max < arr[i]) {
				max = arr[i];
			} // if
		} // for
		System.out.println("�ִ� : " + max);
	} // maxMachine()
	
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