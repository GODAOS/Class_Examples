import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class Ex10 {
	// ���۸� �̿��� �̹��� ���� ����(������� ȿ��ȭ)
	// BufferedInputStream, BufferedOutputStream
	// FileInputStream �� BufferedInputStream
	// FileOutputStream �� BufferedOutputStream
	// ������ �⺻ ũ�� : 1024Byte
	// ������ ���ۿ��� �⺻ ũ�⺸�� ���� �뷮�� ���ۿ� ���� �ִ�.
	// ������ ���ۿ� ���� �ִ� ������ ���� ����(flush())�Ŀ� ����(close())
	public static void main(String[] args) {
		try {
			String inputPath = "D:\\Study_Java\\workspace\\17. IO\\pic.jpg";	// ���� ����
			String outputPath = "D:\\Study_Java\\workspace\\17. IO\\copy2.jpg";	// �纻 ����
			
			FileInputStream fis = new FileInputStream(inputPath);				// ���� ����
			FileOutputStream fos = new FileOutputStream(outputPath);			// �纻 ����
			
			BufferedInputStream bis = new BufferedInputStream(fis);				// �Է� ����
			BufferedOutputStream bos = new BufferedOutputStream(fos);			// ��� ����
			
			int data, cnt = 0;
			while((data = bis.read()) != -1) {
				cnt++;
				System.out.println(data);
				bos.write(data);
			}
			bos.flush();	// ������ ���ۿ� ���� �ִ� ���� ���� �� ���, ���� ����Ҷ��� �ʼ��� ���ٰ�
			bos.close();	// ����� ��������
			bis.close();
			fos.close();
			fis.close();
			System.out.println("���� Ƚ�� : " + cnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	} // main()
} // class