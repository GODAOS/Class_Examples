import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.util.Scanner;

import com.hanul.calc.CalcDTO;

/*
�� CalcClient.java
 	��
 - Socket ����
 
 	��
 - ù ��° ������ �Է� : num1
 - �� ��° ������ �Է� : num2
 - �����ڸ� �Է� : opcode
 - new CalcDTO(num1, num2, opcode);
 
 	��
 - ������ ��ü(DTO)�� ������ ����(���)
 - OutputStream �� [OutputStreamWriter �� BufferedWriter] �� PrintWriter (X) : ��ü�� �����ϱ⿡�� �������� �ʴ�.
 - OutputStream �� ObjectOutputStream(����ȭ) 

	��
 - �������� ���޵� ������� ����(�Է�)�޾� ���
  	ù ��° ���� : XX
 	�� ��° ���� : XX
 	������ : X
 	��� : XX
*/
public class Test01_CalcClient {
	public static void main(String[] args) {
		Socket socket = null;
		
		try {
			socket = new Socket("192.168.0.20", 9999);

			CalcDTO dto = new CalcDTO();
			Scanner scanner = new Scanner(System.in);
			System.out.print("ù ��° ������ �Է��ϼ���> ");
			int num1 = Integer.parseInt(scanner.nextLine());
			System.out.print("�� ��° ������ �Է��ϼ���> ");
			int num2 = Integer.parseInt(scanner.nextLine());
			System.out.print("�����ڸ� �Է��ϼ���> ");
			String opcode = scanner.nextLine();
			dto = new CalcDTO(num1, num2, opcode);
			scanner.close();
			
			OutputStream os = socket.getOutputStream();
			ObjectOutputStream oos = new ObjectOutputStream(os);
			oos.writeObject(dto);
			
			InputStream is = socket.getInputStream();
			ObjectInputStream ois = new ObjectInputStream(is);
			dto = (CalcDTO) ois.readObject();


			System.out.println("ù ��° ���� : " + dto.getNum1());
			System.out.println("�� ��° ���� : " + dto.getNum2());
			System.out.println("������ : " + dto.getOpcode());
			System.out.println("��� : " + dto.getResult());
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				socket.close();
			} catch (Exception e) {
				e.printStackTrace();
			} // try catch
		} // try catch finally 
	} // main()
} // class