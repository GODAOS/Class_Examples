import java.net.ServerSocket;
import java.net.Socket;

public class Ex03_MultiChatServer {
	public static void main(String[] args) {
		ServerSocket ss = null;		
		try {
			ss = new ServerSocket(9999);
			System.out.println("������ �������Դϴ�.");
			while(true) {
				Socket socket = ss.accept();
				Thread pt = new Ex03_MultiChatPersonThread(socket);
				pt.start();
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Server Exception!!!");
		} /* finally { // ������ ��� �����ǰ� ������ ������ �ȵǹǷ� �ݾ��� �ʿ䰡 ����.
			try {
				socket.close();
				ss.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} */
	} // main()
} // class