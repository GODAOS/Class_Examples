import java.io.FileInputStream;
import java.io.FileNotFoundException;

public class Ex05_Exception05 {
	public static void main(String[] args) throws FileNotFoundException {
		FileInputStream fis = new FileInputStream("abc.txt");
	} // main()
} // class

// throws : ���ܸ� ó���ϴ� ��� �� ���� ȸ��(���� �̷��) �� �޼ҵ� ����ο��� ���
// ��) public void xxx() ( ~~body~~ ) �� public void xxx() throws XXXException ( ~~body~~ )