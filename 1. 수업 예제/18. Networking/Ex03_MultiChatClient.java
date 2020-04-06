import java.net.Socket;

public class Ex03_MultiChatClient {
	public static void main(String[] args) {
		Socket socket = null;
		try {
			socket = new Socket("192.168.0.20", 9999);
			
			// MultiChatClient ���α׷� ���� �� ��ȭ���� ���Է� �Ǿ�����,
			// ������ �ȳ��ϴ� �޽��� ���
			if(args.length != 1) {
				System.out.println("���α׷� ���� �� ��ȭ���� �Է��� �ּ���!");
				System.out.println("���� �� : java MultiChatClient ��ȭ��");
			}
			
			// �޽����� �Է¹޾� ������ ������ �۾�(�۽�, ���) : MultiChatSenderThread
			Thread st = new Ex03_MultiChatSenderThread(socket, args[0]);
			st.start();
			
			// �޽����� ���Ź޾� ȭ�鿡 ���
			Thread rt = new Ex03_MultiChatReceiverThread(socket);
			rt.start();
		} catch (Exception e) {
//			e.printStackTrace();
//			System.out.println("Client Exception!!!");
			System.out.println("����Ǿ����ϴ�!");
		} /* finally {
			try {
				socket.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} */
	} // main()
} // class