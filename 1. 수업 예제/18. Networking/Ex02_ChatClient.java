import java.net.Socket;

public class Ex02_ChatClient {
	public static void main(String[] args) {
		Socket socket = null;
		try {
			socket = new Socket("192.168.0.20", 9999);
			
			// �޽����� �Է� �޾� ������ �۾�(�۽�, ���) �� ChatSenderThread
			Thread st = new Ex02_ChatSenderThread(socket); // ������ ip�� ��Ʈ�� �𸣸� �۽��Ҽ��� �����Ƿ� socket�� �Ű������� �־��ش�.
			st.start();
			
			// ������ �޽����� �޴� �۾�(����, �Է�) �� ChatReceiverThread
			Thread rt = new Ex02_ChatReceiverThread(socket);
			rt.start();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Chat Client Exception!!!");
		} /* finally { // ������ Ŭ���̾�Ʈ���� �ݾ��� �ʿ䰡 �����Ƿ� �����.
			try {
				socket.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} */
	} // main()
} // class