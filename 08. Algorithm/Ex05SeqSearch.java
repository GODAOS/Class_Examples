import java.util.Scanner;

public class Ex05SeqSearch {
	// ���� �˻�(Sequence Search) : �����͸� ó������ ������ �˻� �� �����Ͱ� �ҷ��� ���
	public static void main(String[] args) {
		int[] arr = {30, 90, 10, 60, 40, 70, 50, 20, 80, 100};	// ������ ����� ����� �迭(arr[])
		Scanner scanner = new Scanner(System.in);
		System.out.print("ã�� ���� �Է��ϼ��� : ");
		int searchData = Integer.parseInt(scanner.nextLine());
		scanner.close();
		
		int index = seqSearch(arr, searchData);	// seqSearch() �޼ҵ� ȣ��
		if(index == -1) {
			System.out.println("ã�� ���� " + searchData + "�̸�, �˻��� �����߽��ϴ�");
		} else {
			System.out.println("ã�� ���� " + searchData + "�̸�, " + index + "��°�� �ֽ��ϴ�.");
		} // if
	} // main()
	
	public static int seqSearch(int[] arr, int searchData) {
		int index = -1;		// ���α׷����� -1�� ����(��)�� �ǹ���
		for (int i = 0; i < arr.length; i++) {
			if(arr[i] == searchData) {		// ã�� �����Ͱ� �ִ�.
				index = i + 1;				// ã�� �������� ��ġ���� ���Ѵ�.
				break;
			} // if
		} // for
		return index;
	} // seqSearch()
} // class