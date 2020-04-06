import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Scanner;

// ������ Thread : �޽����� �۽�(���) �� PrintWriter
public class Ex02_ChatSenderThread extends Thread {
	private Socket socket;
	public Ex02_ChatSenderThread(Socket socket) {
		this.socket = socket;
	}
	
	// Thread ������ �ݵ�� run() �޼��忡�� ������(Override)
		@Override
		public void run() {
			try {
				OutputStream os = socket.getOutputStream();
				PrintWriter pw = new PrintWriter(os);
				
				Scanner scanner = new Scanner(System.in);
				while(true) {
					System.out.print("������ �޽����� �Է��ϼ��� : ");
					String msg = scanner.nextLine();
					if(msg.equalsIgnoreCase("bye")) {
						System.out.println("����Ǿ����ϴ�.");
						System.exit(0);		// break�� �ݺ����� ���������� System.exit�� ���α׷��� ������ �����Ų��.
						break;
					} // if
					pw.println(msg);
					pw.flush();
				} // while
				scanner.close();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("ChatSenderThread Exception!!!");
			} finally {
				try {
					socket.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			} // try catch finally
		} // run()
} // class