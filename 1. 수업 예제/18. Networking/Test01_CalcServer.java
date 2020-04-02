import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;

import com.hanul.calc.CalcDAO;
import com.hanul.calc.CalcDTO;

/*
�� CalcServer.java
	��
 - ServerSocket, Socket ����
 
 	��
 - Ŭ���̾�Ʈ���� ������ ��ü(DTO)�� ����(�Է�)
 - InputStream �� InputStreamReader �� BufferedReader (X)
 - InputStream �� ObjectInputStream(������ȭ)
 
 	��
 - ���Ź��� DTO��ü�� ��������� �̿��Ͽ� ��Ģ������ �����ϴ� �޼���(getResult)�� ȣ��(CalcDAO)
 
 	��
 - ����� ������ ȭ�鿡 ���
 	ù ��° ���� : XX
 	�� ��° ���� : XX
 	������ : X
 	��� : XX
 
 	��
 - ������� Ŭ���̾�Ʈ���� �۽�(���)
 */
public class Test01_CalcServer {
	public static void main(String[] args) {
		ServerSocket ss = null;
		Socket socket = null;
		
		try {
			ss = new ServerSocket(9999);
			System.out.println("������ �������Դϴ�.");
			socket = ss.accept();
			
			CalcDTO dto = new CalcDTO();
			InputStream is = socket.getInputStream();
			ObjectInputStream ois = new ObjectInputStream(is);
			dto = (CalcDTO) ois.readObject();
			
			CalcDAO dao = new CalcDAO();
			dao.getResultDTO(dto);
			
			System.out.println("ù ��° ���� : " + dto.getNum1());
			System.out.println("�� ��° ���� : " + dto.getNum2());
			System.out.println("������ : " + dto.getOpcode());
			System.out.println("��� : " + dto.getResult());
			
			OutputStream os = socket.getOutputStream();
			ObjectOutputStream oos = new ObjectOutputStream(os);
			oos.writeObject(dto);
			
			ois.close();
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