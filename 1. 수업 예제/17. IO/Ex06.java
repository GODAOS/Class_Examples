import java.io.InputStream;

public class Ex06 {
	// Ű���忡�� ������ ���� ���ڸ� �Է¹޾� ���
	// ��, �Է��� ���� �߿� 'q'��� ���ڰ� ������ ����
	public static void main(String[] args) {
		InputStream is = System.in;
		System.out.print("������ ���� ���ڸ� �Է��ϼ��� : ");
		
		try {
			int data;
			while((data = is.read()) != 'q') {
				System.out.println("�Է��Ͻ� �����ڴ� " + (char)data + "�Դϴ�.");
			}
			System.out.println("���� �Ǿ����ϴ�.");
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class