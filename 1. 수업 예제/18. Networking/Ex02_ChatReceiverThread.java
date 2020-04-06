import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.Socket;

// �޴� Thread : �޽����� ����(�Է�) �� BufferedReader
public class Ex02_ChatReceiverThread extends Thread {	// Thread Class ���
	private Socket socket;
	public Ex02_ChatReceiverThread(Socket socket) {
		this.socket = socket;
	}
	
	// Thread�� ������ �ݵ�� run() �޼��忡�� ������(Override)
	@Override
		public void run() {
		try {
			InputStream is = socket.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			
			InetAddress addr = socket.getInetAddress();
			String name = addr.getHostName(); // ȣ��Ʈ �̸� �����´�.
			
			while(true) {
				String msg = br.readLine();
				if(msg == null) {
					break;
				} // if
				System.out.println(name + ">���� �޽��� : " + msg);
			} // while
		} catch (Exception e) {
//			e.printStackTrace();
//			System.out.println("ChatReceiverThread Exception!!!");
			System.out.println("����Ǿ����ϴ�.");
			System.exit(0);
		} finally {
			try {
				socket.close();
			} catch (Exception e) {
				e.printStackTrace();
			} // try catch
		} // try catch finally
	} // run()
} // class