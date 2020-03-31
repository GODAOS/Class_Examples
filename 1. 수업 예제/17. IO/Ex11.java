import java.io.FileReader;

public class Ex11 {
	// ����(�ؽ�Ʈ ����, �����ڵ�)���� ���� ������ ������ϴ� ��Ʈ��
	// FileReader, FileWriter
	// �ѱ��� ���Ե� ����(member.txt)���� �����͸� �о ȭ�鿡 ���
	// member.txt ���� ���� : IO Project > ��Ŭ�� > New > file > ���ϸ�.Ȯ����
	// ���� �ۼ� �� �׸� ������ �ݵ�� TABŰ�� Ȱ���Ѵ�.
	public static void main(String[] args) {
		try {
			FileReader fr = new FileReader("member.txt");	// ���� ����
			
			int data, cnt = 0;
			while((data = fr.read()) != -1) {
				cnt++;
				System.out.println(data);		// �����ڵ尡 ���
				System.out.println((char)data);	// �����ڵ忡 �ش��ϴ� ���ڰ� ���
			}
			fr.close();
			System.out.println("���� Ƚ�� : " + cnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class