import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Test08_BufferedReaderWhile {
	public static void main(String[] args) {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		try {
			String msg;
			System.out.print("���� ���ڸ� �Է��ϼ��� : ");
			while ((msg = br.readLine()).compareToIgnoreCase("exit") != 0) {
				System.out.println("�Է� �Ͻ� ���ڴ� : " + msg + "�Դϴ�.");
			}
			System.out.println("���� �Ǿ����ϴ�.");
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class