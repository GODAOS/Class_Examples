import java.io.IOException;
import java.io.InputStream;

public class Ex01 {
	// Ű���忡�� ������ 1���ڸ� �Է¹޾� ���
	public static void main(String[] args) {
		InputStream is = System.in;	// ��� ��Ʈ�� : ���� ���� ����Ǵ� ��Ʈ��
		System.out.print("������ 1���ڸ� �Է��ϼ��� : ");	// ��� ����(Blocked State)
		
		try {
			int data = is.read();
			System.out.println("�Է��Ͻ� �����ڴ� " + (char)data + "�Դϴ�.");
		} catch (IOException e) {
			e.printStackTrace();
		}
	} // main()
} // class