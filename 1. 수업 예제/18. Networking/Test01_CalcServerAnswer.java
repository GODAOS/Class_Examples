import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

import com.hanul.calc.CalcDAO;
import com.hanul.calc.CalcDTO;

public class Test01_CalcServerAnswer {
	public static void main(String[] args) {
		ServerSocket ss = null;
		Socket socket = null;
		try {
			// �� ServerSocket, Socket ����
			ss = new ServerSocket(9999);
			System.out.println("������ �������Դϴ�.");
			socket = ss.accept();
			
			// �� Ŭ���̾�Ʈ���� ������ ��ü(DTO)�� ����(�Է�)
			// InputStream �� InputStreamReader �� BufferedReader (X)
			// OutputStream �� ObjectInputStream : ��ü �Է�
			InputStream is = socket.getInputStream();
			ObjectInputStream ois = new ObjectInputStream(is);
			CalcDTO dto = (CalcDTO) ois.readObject();	// ��ü�� ������ȭ
			
			// �� ���Ź��� DTO ��ü�� ��������� �̿��Ͽ�, ��Ģ������ �����ϴ� �޼��� ȣ��
			CalcDAO dao = new CalcDAO();
			int result = dao.getResult(dto);
			
			// �� ����� ������ ȭ�鿡 ���
			System.out.println("ù ��° ���� : " + dto.getNum1());
			System.out.println("�� ��° ���� : " + dto.getNum2());
			System.out.println("������ : " + dto.getOpcode());
			System.out.println("��� : " + result);
			
			// �� ��� ���� Ŭ���̾�Ʈ���� �۽�(���)
			OutputStream os = socket.getOutputStream();
			PrintWriter pw = new PrintWriter(os);
			pw.println(result);
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
			}
		}
	} // main()
} // class