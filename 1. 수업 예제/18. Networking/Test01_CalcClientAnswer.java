import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.net.Socket;
import java.util.Scanner;

import com.hanul.calc.CalcDTO;

public class Test01_CalcClientAnswer {
	public static void main(String[] args) {
		Socket socket = null;
		try {
			// �� Socket ����
			socket = new Socket("192.168.0.20", 9999);
			
			// �� num1, num2, opcode�� �Է� �޴´�.
			Scanner scanner = new Scanner(System.in);
			System.out.print("ù ��° ������ �Է��ϼ���> ");
			int num1 = Integer.parseInt(scanner.nextLine());
			System.out.print("�� ��° ������ �Է��ϼ���> ");
			int num2 = Integer.parseInt(scanner.nextLine());
//			System.out.print("������(+, -, *, /, %)�� �Է��ϼ���> ");
//			String opcode = scanner.nextLine();

			
			// ��ȿ�� �˻� ����(�߰��� ���)
			String opcode = null;
			while(true) {
				System.out.print("������(+, -, *, /, %)�� �Է��ϼ���> ");
				opcode = scanner.nextLine();
				if ((opcode.equals("+")) || (opcode.equals("-")) || (opcode.equals("*")) || (opcode.equals("/")) || (opcode.equals("%"))) {
					break;
				} else {
					System.out.println("�ٽ� �Է��ϼ���!");
					continue;
				} // if else
			} // while
			
			scanner.close();
			// �� CalcDTO ��ü�� �����ϰ� ������ �۽�(���)
			// OutputStream �� OutPutStreamWrite �� BufferedWriter �� PrintWriter (X)
			// OutputStream �� ObjectOutputStream : ��ü���
			CalcDTO dto = new CalcDTO(num1, num2, opcode);
			OutputStream os = socket.getOutputStream();
			ObjectOutputStream oos = new ObjectOutputStream(os);
			oos.writeObject(dto);
			
			// �� �������� ���޵� ��� ���� ����(�Է�)�޾� ���
			// InputStream �� InputStreamReader �� BufferedReader
			InputStream is = socket.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			int result = Integer.parseInt(br.readLine());
			
			System.out.println("ù ��° ���� : " + num1);
			System.out.println("�� ��° ���� : " + num2);
			System.out.println("������ : " + opcode);
			System.out.println("��� : " + result);
			br.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				socket.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	} // main()
} // class