import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

public class Ex07 {
	// Ű���忡�� �ѱ� ���� ���ڸ� �Է¹޾� ��� : ����(Buffer)�� Ȱ��
	public static void main(String[] args) {
		InputStream is = System.in;	// ����Ʈ ��Ʈ�� : ���۵Ǵ� �����Ͱ� ����Ʈ���� �ڷ�, ��� ��Ʈ��(���� ���� ���� ����)
		InputStreamReader isr = new InputStreamReader(is);	// ���� ��Ʈ��, �긴�� ��Ʈ��
		BufferedReader br = new BufferedReader(isr);	// ���۸� Ȱ���� ��Ʈ��, �긴�� ��Ʈ��
//		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		System.out.print("�ѱ� ���� ���ڸ� �Է��ϼ��� : ");
		try {
			String msg = br.readLine();	// readLine() : Enter �ձ����� ��� ���ڸ� �ѹ��� �Է�
			System.out.println("�Է��Ͻ� ���ڴ� " + msg + "�Դϴ�.");
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class

/*
�� ����(Buffer)�� �ʿ伺
	- �Ϲ����� ������� ���� ���ڸ� �Է��Ѵ� �ϴ���,
		���� ó���� ������ �� ���ھ� ����µȴ�.
	- �Էµ� ������ ������ŭ ������ �̷������. �� �ӵ� ������ ����
	- ���� ���� ��ȿ������ �����ϰ��� ���� ���ڸ� �Է� �ϴ���,
		����(Buffer)�� �̿��Ͽ� �Է��� ���ڸ� �� ���� ����� �� �� �ֵ��� �������ش�
	- ������ �⺻ ũ�� : 1024Byte
	- BufferedReader Class �� readLine() Method 
	
CPU(��������)	�ѤѤѤѤѤ�	�ֱ��(RAM)
			ĳ���޸�(SRAM)
	|						|
	|ä��					����	|
	|						|
	�ѤѤѤѤѤ�����¤ѤѤѤѤѤѤѤѤ�
*/