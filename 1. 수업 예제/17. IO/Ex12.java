import java.io.BufferedReader;
import java.io.FileReader;

public class Ex12 {
	// ���۸� Ȱ���Ͽ� ���Ͽ��� ���� ������ ������ϴ� ��Ʈ��
	// BufferedReader, BufferedWriter
	// BufferedReader���� readLine() �޼��带 Ȱ���ϸ� �� �ٴ����� �Էµȴ�.
	public static void main(String[] args) {
		try {
			FileReader fr = new FileReader("member.txt");	// ���� ����
			BufferedReader br = new BufferedReader(fr);		// �Է� ����
			
			String line = null;
			int cnt = 0;
			while((line = br.readLine()) != null) {
				cnt++;
				System.out.println(line);
			}
			br.close();
			fr.close();
			System.out.println("���� Ƚ�� : " + cnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	} // main()
} // class