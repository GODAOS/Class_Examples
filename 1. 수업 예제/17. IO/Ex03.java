import java.io.InputStream;

public class Ex03 {
	// Ű���忡�� ������ ���� ���ڸ� �Է¹޾� ����Ͻÿ�.
	public static void main(String[] args) {
		InputStream is = System.in;
		System.out.print("������ ���� ���ڸ� �Է��ϼ��� : ");
		
/*
		while(true) {	// �Է� ���� ���ڰ� �� �������� �� �� ����.
			try {
				int data = is.read();
				System.out.println("�Է��Ͻ� �����ڴ� " + (char)data + "�Դϴ�.");
				
				if(data == -1) {	// Ctrl + C �Է� �� break ����� ���� ����
					System.out.println("����Ǿ����ϴ�.");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
			} // try catch
		}// while
*/
		
		try {
			int data;
			while((data = is.read()) != -1) {
				System.out.println("�Է��Ͻ� �����ڴ� " + (char)data + "�Դϴ�.");
			}
			System.out.println("����Ǿ����ϴ�.");
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class