import java.io.InputStream;

public class Ex02 {
	// Ű���忡�� ������ 1���ڸ� �Է� �޾� ���
	public static void main(String[] args) {
		InputStream is = System.in;
		System.out.print("������ 1���ڸ� �Է��ϼ��� : ");
		
		try {
			int data = is.read();
			System.out.println(data);		// ��� �� : 65
			System.out.println((char)data);	// ��� �� : A
			
			data = is.read();
			System.out.println(data);		// ��� �� : 13 
			System.out.println((char)data);	// ��� �� : ���� 
			
			data = is.read();				
			System.out.println(data);		// ��� �� : 10
			System.out.println((char)data);	// ��� �� : ����
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class

/*
 - ����ڰ� �����ڸ� �Է� �� Enter �Է�
 - Enter�� �Է��ϴ� ���� ���α׷��� ����(Terminate : Ctrl + C, Break)�� �ƴϴ�
 - CR(Carriage Return) : Ŀ���� ���� �� ������ �̵� �� ASCII Code : 13
 - LF(Line Feed) : Ŀ���� �� �� �Ʒ��� �̵� �� ASCII Code : 10
 - ��) A Enter �� 65 13 10
*/