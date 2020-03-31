import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex08 {
	// Ű���忡�� ���ڿ��� ������ �Է¹޾� ���
	// ���۸� Ȱ�� : InputStream �� InputStreamReader �� BufferedReader
	// ��, 'bye' ���ڿ��� �ԷµǸ� ����
	public static void main(String[] args) {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		while (true) {
			System.out.print("���� ���ڸ� �Է��ϼ��� : ");
			try {
				String msg = br.readLine();
				System.out.println("�Է��Ͻ� ���ڿ��� " + msg + "�Դϴ�.");
				
				/*
				if (msg == "bye") {	// ���ڿ��� �� �����ڸ� ����� �� ����.
					System.out.println("���� �Ǿ����ϴ�.");
					break;
				}
				*/
				
				/*
				if (msg.compareTo("bye") == 0) {
					System.out.println("���� �Ǿ����ϴ�.");
					break;
				}
				*/
				
				/*
				if (msg.equals("bye")) {
					System.out.println("���� �Ǿ����ϴ�.");
					break;
				}
				*/
				
				if (msg.equalsIgnoreCase("bye")) {
					System.out.println("���� �Ǿ����ϴ�.");
					break;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	} // main()
} // class