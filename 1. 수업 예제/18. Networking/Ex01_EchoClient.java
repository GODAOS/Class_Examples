//import java.io.BufferedWriter;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
//import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Scanner;

// EchoClient : ������ ��û (Request, ����)
public class Ex01_EchoClient {
	public static void main(String[] args) {
		Socket socket = null;
		try {
			// ������ ������ �õ��Ͽ� ������ �����ϸ� Socket ����
			// Client Socket : ������ IP�ּ� + ������ Port ��ȣ
			socket = new Socket("192.168.0.20", 9999);
			
			// Ŭ���̾�Ʈ���� �۽�(���)�ϱ� ���� �غ�ܰ�
			OutputStream os = socket.getOutputStream();		// �������� �����ؼ� ��� (��� ��Ʈ��)
//			OutputStreamWriter osw = new OutputStreamWriter(os); // ���ڷ� ��� (�긴�� ��Ʈ��)
//			BufferedWriter bw = new BufferedWriter(osw);	// �ӵ��� ���� ���۸� ���
			PrintWriter pw = new PrintWriter(os);			// ���� �� ��Ʈ�� ����� ���ÿ� ��� ����
			
			// Ű���忡�� �޼����� �Է¹޾� ������ ������
			Scanner scanner = new Scanner(System.in);
			System.out.print("������ ���� �޽����� �Է��ϼ���> ");
			String msg = scanner.nextLine();
			scanner.close();
			
			pw.println(msg);	// PrintWriter�� println() �޼���� ����Ѵ�.
			pw.flush();			// ���� ����� ���� ������ flush() ������Ѵ�.
			
			// �������� ���� �޼����� ����(�Է�)�޾� ȭ�鿡 ���
			InputStream is = socket.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			String echoMsg = br.readLine();
			System.out.println("�����κ��� ���� �޽��� : " + echoMsg);
			br.close();
			pw.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				socket.close();
			} catch (Exception e) {
				e.printStackTrace();
			} // try catch
		} // try catch finally 
	} // main()
} // class