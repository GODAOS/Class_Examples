import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.Socket;
import java.util.ArrayList;

/*
 - ���ӵ� �ټ��� Ŭ���̾�Ʈ���� ���۵Ǵ� ������
 - ���ӵ� ��� Ŭ���̾�Ʈ�� ���� ������ �����ϰ�,
 	���ӵ� Ŭ���̾�Ʈ���� �޽����� ����(�۽�, ���)�� �� �ֵ���
 	Ŭ���̾�Ʈ�� ����� ������ ���� �迭�� �����Ͽ� ����
 - MultiChatServer Class�� main() �޼���� ���� ���� : static
 */
public class Ex03_MultiChatPersonThread extends Thread {
	static ArrayList<PrintWriter> list = new ArrayList<>();	
	// ������ Ŭ���̾�Ʈ�� ��� ������ ArrayList�� ������ Element�� PrintWriter�� �־ �����Ѵ�
	
	private Socket socket;
	private PrintWriter pw;
	public Ex03_MultiChatPersonThread(Socket socket) {
		this.socket = socket;
		try {
			OutputStream os = socket.getOutputStream();
			pw = new PrintWriter(os);
			list.add(pw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void run() {
		String name = null;
		InetAddress addr = socket.getInetAddress();
		String comName = addr.getHostName();
		try {
			InputStream is = socket.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			
			// Ŭ���̾�Ʈ���� ���� ���� �Էµ� �޽���(��ȭ��)�� ���
			// ���ӵ� �ٸ� Ŭ���̾�Ʈ ȭ�鿡 ��� : sendAll()
			name = br.readLine();
			sendAll("#" + name + "(" + comName + ")���� �����ϼ̽��ϴ�!");
			// #ȫ�浿(302-XX)���� �����ϼ̽��ϴ�!
			
			while(true) {
				String msg = br.readLine();
				if(msg == null) {
					break;
				}
				sendAll(name + "(" + comName + ") : " + msg);
				// ȫ�浿(302-XX) : �ȳ�
			}
		} catch (Exception e) {
//			e.printStackTrace();
//			System.out.println("Person Exception!!!");
//			System.out.println("����Ǿ����ϴ�!");
		} finally {
			try {
				list.remove(pw);
				sendAll("#" + name + "(" + comName + ")���� �����ϼ̽��ϴ�!");
				// #ȫ�浿(302-XX)���� �����ϼ̽��ϴ�!
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	} // run()
	
	public void sendAll(String msg) {
		for (PrintWriter pw : list) {
			pw.println(msg);
			pw.flush();
		}
	} // sendAll()
} // class