import java.net.ServerSocket;
import java.net.Socket;

public class Ex02_ChatServer {
	public static void main(String[] args) {
		ServerSocket ss = null;
		Socket socket = null;
		try {
			ss = new ServerSocket(9999);
			System.out.println("������ �������Դϴ�.");
			socket = ss.accept();	// ������ socket�� �̸� ������ �������� ss���� �����´�.
			
			// ������ �޽����� �޴� �۾�(����, �Է�) �� ChatReceiverThread
			Thread rt = new Ex02_ChatReceiverThread(socket);
			rt.start();
			
			// �޽����� �Է� �޾� ������ �۾�(�۽�, ���) �� ChatSenderThread
			Thread st = new Ex02_ChatSenderThread(socket); // ������ ip�� ��Ʈ�� �𸣸� �۽��Ҽ��� �����Ƿ� socket�� �Ű������� �־��ش�.
			st.start();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Chat Server Exception!!!");
		} finally {
			try {
//				socket.close();	// ������ �������� ���� �ʿ䰡 �����Ƿ� �����ش�.
				ss.close();
			} catch (Exception e) {
				e.printStackTrace();
			} // try catch
		} // try catch finally
	} // main()
} // class