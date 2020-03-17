import java.util.Scanner;

public class Ex06BinSearch {
	// ���� �˻�(Binary Search) : low, middle, high ���� ���
	// low : arr[0] ���� �����Ͽ� arr[middle + 1] ����
	// high : arr[arr.length - 1] ���� �����Ͽ� arr[middle - 1] ����
	// middle : (low + high) / 2
	// ã���� �ϴ� �����͸� �߾ӿ� ��ġ�� �߰� ���� ���ϴ� ���
	// ������ ����� �ݵ�� ������ ������������ ���ĵǾ� �־�� �Ѵ�(��������)
	public static void main(String[] args) {
		int[] arr = {10, 20, 30, 40, 50, 60, 70, 80, 90, 100};
		Scanner scanner = new Scanner(System.in);
		System.out.print("ã�� ���� �Է��ϼ��� : ");
		int searchData = Integer.parseInt(scanner.nextLine());
		scanner.close();
		
		binSearch(arr, searchData);

		int index = binSearch(arr, searchData);	// seqSearch() �޼ҵ� ȣ��
		if(index == -1) {
			System.out.println("ã�� ���� " + searchData + "�̸�, �˻��� �����߽��ϴ�");
		} else {
			System.out.println("ã�� ���� " + searchData + "�̸�, " + index + "��°�� �ֽ��ϴ�.");
		} // if
	} // main()
	
	public static int binSearch(int[] arr, int searchData) {
		int index = -1;
		int low = 0, high = arr.length - 1, middle = 0;
		while(low <= high) {
			middle = (low + high) / 2;		// �߰����� ����� �迭�� index
			if(arr[middle] == searchData) {	// ���� : �˻� �Ϸ�
				index = middle + 1;
				break;
			} else if(arr[middle] < searchData) {
				low = middle + 1;			// low ������ ���� : �߰����� �������� ���� �κ��� ����
			} else if(arr[middle] > searchData) {
				high = middle - 1;			// high ������ ���� : �߰����� �������� ������ �κ��� ����
			} // if else if
		} // while
		return index;
	} // binSearch()
} // class

/*
int[] arr = {10, 20, 30, 40, 50, 60, 70, 80, 90, 100};
searchData : 70

low : 0 �� arr[0]
high : arr.length - 1 �� arr[9]
middle : (low + high) / 2 �� arr[4] �� 50

arr[middle] < searchData (50 < 70)
low : arr[middle + 1] �� arr[5]
middle : (low + high) / 2 �� arr[7] �� 80

arr[middle] < searchData (80 > 70)
low : arr[middle - 1] �� arr[6]
middle : (low + high) / 2 �� arr[5] �� 60

arr[middle] < searchData (60 < 70)
low : arr[middle + 1] �� arr[6]
middle : (low + high) / 2 �� arr[6] �� 70

arr[middle] == searchData (70 == 70)
index = middle
*/