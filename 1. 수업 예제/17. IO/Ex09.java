import java.io.FileInputStream;
import java.io.FileOutputStream;

public class Ex09 {
	// ����(�׸�, ����, ����)���� ����Ʈ ������ ������ϴ� ��Ʈ��
	// FileInputStream, FileOutputStream
	// �̹��� ������ �о �����ϴ� ���α׷�(Copy & Paste)
	// ���� �̹��� �غ� : �̹����� ������ �� IO Project�� �ٿ��ֱ� �� pic.jpg
	// ��� ������ ���� ������ ���� ������Ʈ���� �۾� �̷������.
	// ��� ������ �� ��쿡�� ���� ��η� ǥ��
	// �� D:\\Study_Java\\workspace\\17. IO\\pic.jpg
	// ���������� ������ �Ϸ�Ǹ� ������Ʈ�� ���ΰ�ħ(Refresh, F5)
	public static void main(String[] args) {
		try {
			FileInputStream fis = new FileInputStream("pic.jpg");		// ���� ����
			FileOutputStream fos = new FileOutputStream("copy1.jpg");	// �纻 ����
			
			int data, cnt = 0;
			while((data = fis.read()) != -1) {	// End Of File : ����
				cnt++;						// ���� Ƚ��(������ ũ��)
				System.out.println(data);	// �̹����� �ȼ� �� (RGB)
				fos.write(data);			// data ���� �������� ���Ͽ� ���
			}
			fos.close();
			fis.close();
			System.out.println("���� Ƚ�� : " + cnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class