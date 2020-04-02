import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;

// EchoServer : ������ ����(Response, ����)
// TCP : ���� �˻� ����, �ӵ��� �������� �ŷڼ��� ����.
/*
Client	Socket	Server
�۽�		------	����
(���)			(�Է�)
Hello			Hello
 */
public class Ex01_EchoServer {
	public static void main(String[] args) {
		ServerSocket ss = null;
		Socket socket = null;
		try {
			// ServerSocket ���� : Port ��ȣ �Ҵ�
			ss = new ServerSocket(9999);
			System.out.println("������ �������Դϴ�.");
			
			// Socket ���� : Ŭ���̾�Ʈ�� ������ ����ִ� Socket
			// socket = new Socket(); �� Client�� Socket
			socket = ss.accept();	// �������κ��� ���� ��û�� ����
			
			// Ŭ���̾�Ʈ�� ���� �޼����� ����(�Է�)�ޱ� ���� �غ� �ܰ�
			InputStream is = socket.getInputStream();	// �������κ��� �Է��� �޴´�. (��� ��Ʈ��, byte�� �ڷ�)
			InputStreamReader isr = new InputStreamReader(is);	// ���ڸ� �޴´�. (�긴�� ��Ʈ��, ������ �ڷ�)
			BufferedReader br = new BufferedReader(isr);	// �ӵ� ����� ���� ���۸� ����Ͽ� �޴´�.
			// socket�� system.in���� �ٲٸ� ��ĳ�� Ŭ������ ������ �Ѵ�.
			
			// Ŭ���̾�Ʈ�� ���� ����(IP�ּ�)�� ��������
			InetAddress addr = socket.getInetAddress();
			String ip = addr.getHostAddress();
			
			// Ŭ���̾�Ʈ�� ���� �޼����� ���Ź޾� ȭ�鿡 �������
			String msg = br.readLine();
			System.out.println(ip + "> Ŭ���̾�Ʈ�κ��� ���� �޽��� : " + msg);
			
			// �ٽ� Ŭ���̾�Ʈ���� ���� �޼����� �۽�(���)����
			OutputStream os = socket.getOutputStream();		// �������� �����ؼ� ��� (��� ��Ʈ��)
//			OutputStreamWriter osw = new OutputStreamWriter(os); // ���ڷ� ��� (�긴�� ��Ʈ��)
//			BufferedWriter bw = new BufferedWriter(osw);	// �ӵ��� ���� ���۸� ���
			PrintWriter pw = new PrintWriter(os);			// ���� �� ��Ʈ�� ����� ���ÿ� ��� ����
			pw.println(msg);
			pw.flush();
			pw.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				socket.close();
				ss.close();
			} catch (Exception e) {
				e.printStackTrace();
			} // try catch
		} // try catch finally
	} // main()
} // class