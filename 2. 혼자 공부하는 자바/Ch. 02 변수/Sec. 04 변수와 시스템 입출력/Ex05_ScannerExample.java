package sec04;

import java.util.Scanner;

public class Ex05_ScannerExample {
	public static void main(String[] args) throws Exception {
		Scanner scanner = new Scanner(System.in);
		String inputData;
		
		while(true) {
			inputData = scanner.nextLine();
			System.out.println("�Էµ� ���ڿ� : \"" + inputData + "\"");
			if(inputData.equals("q")) {
				break;
			} // if
		} // while
		System.out.println("����");
	} // main()
} // class