import java.io.InputStream;
import java.io.InputStreamReader;

public class Ex04 {
	// Ű���忡�� �ѱ� 1���ڸ� �Է¹޾� ���
	// InputStreamReader : ���� ��Ʈ���� �Է¹޴� �긴�� ��Ʈ��
	public static void main(String[] args) {
		InputStream is = System.in;	// ����Ʈ ��Ʈ�� : ASCII Code, �̹���, ���� ���� ��
		InputStreamReader isr = new InputStreamReader(is);	// ���� ��Ʈ�� : UniCode
//		InputStreamReader isr = new InputStreamReader(System.in);
		
		System.out.print("�ѱ� 1���ڸ� �Է��ϼ��� : ");
		try {
			int data = isr.read();
			System.out.println("�Է��Ͻ� ���ڴ� " + data + "�Դϴ�.");	// UniCode
			System.out.println("�Է��Ͻ� ���ڴ� " + (char)data + "�Դϴ�.");
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class