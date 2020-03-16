import java.io.FileInputStream;
import java.io.FileNotFoundException;

public class Ex01_Exception01 {
	public static void main(String[] args) {
		// 3���� ���̸� ���� ������ �迭(arr[])�� �����ϰ� ������ ��, ���� �Ҵ�
		int[] arr = new int[3];
		arr[0] = 10;
		arr[1] = 20;
		arr[2] = 30;
//		arr[3] = 40;	// ArrayindexOutOfBoundsException : ��Ȯ�� ���� �߻�
		
		System.out.println("�迭 0���� �� : " + arr[0]);
		System.out.println("�迭 1���� �� : " + arr[1]);
		System.out.println("�迭 2���� �� : " + arr[2]);
//		System.out.println("�迭 3���� �� : " + arr[3]); // ArrayindexOutOfBoundsException : ��Ȯ�� ���� �߻�
		
		System.out.println("===================================");
		
//		String str1 = 100;	// ����
		String str1 = "100";
		System.out.println(str1);
		int pstr1 = Integer.parseInt(str1);
		System.out.println(pstr1);
		
		String str2 = "100a";
		System.out.println(str2);
//		int pstr2 = Integer.parseInt(str2);	// NumberFormatException : ��Ȯ�� ���� �߻�
//		System.out.println(pstr2);
		
		System.out.println("===================================");

		int x = 10;
		int y = 0;
		System.out.println(y / x);	// ��� �� : 0
//		System.out.println(x / y);	// ArithmeticException : ��Ȯ�� ���� �߻�
		
		System.out.println("===================================");

		// "abc.txt" ������ �о���̽ÿ� : FileInputStream Class
//		FileInputStream fis = new FileInputStream("abc.txt");	// Ȯ�� ���� �߻�
		try {
			FileInputStream fis = new FileInputStream("abc.txt");
		} catch (FileNotFoundException e) {						// Ȯ�� ����
			e.printStackTrace();				// ���� �߻��� ������ �޸𸮿��� �����Ͽ� ���ϰ� ���
			System.out.println(e.getMessage());	// ���� �޼����� ������ ���
			System.out.println("�ش��ϴ� ������ �������� �ʽ��ϴ�.");
		}
		
		/*
		try {
			���ܰ� �߻��� ���ɼ��� �ִ� �ڵ�;
		} catch (Exception e) {
			���ܰ� �߻��� ó���� ��� �ڵ�;
		} finally { �� ���� ����
			������ �����ϰ� ���� �ڵ�;
		}
		*/
	} // main()
} // class

/*
	[������ ����]
	�� �ϵ�������� ����	: ġ������ ����	�� ���α׷��� ���� ���� �ʴ´� 
	�� ����Ʈ�������� ����	: ������ ����	�� ����(Exception)
		- SunMicroSystem(Oracle)������ ��� ���ܵ��� Ŭ������ ���� �����Ѵ�.
		��) ArrayindexOutOfBoundsException : ÷��(index)�� �߸��� �迭�� ����ߴ�.
		
	[����Ŭ���� �з�]
	�� ��Ȯ�� ����(���� ����)
		- ���α׷��� ���� �غ��� ���ܰ� �߻��ߴ��� �� �� �ִ�.
		- ���α׷����� �Ǽ��� ���� �߻� : �����(��������) �۾��� ����.
		
	�� Ȯ�� ����(�Ϲ� ����)
		- ���α׷� �ۼ���(�ڵ�)�� �ݵ�� ����ó���� �ؾߵǴ� Ŭ����
		- try(~~) catch(~~) finally(~~) �� ����ó��
*/