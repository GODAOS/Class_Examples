import java.io.FileInputStream;
import java.io.FileNotFoundException;

public class Ex03_Exception03 {
	public static void main(String[] args) {
		try {
			int result = 10 / 2;		// ArithmeticException : ��Ȯ�� ����
			System.out.println(result);
		
			int[] arr = new int[3];		// ArrayIndexOutOf
			arr[0] = 10;
			System.out.println(arr[0]);
			
			String str = "100a";
			int pstr = Integer.parseInt(str);	// NumberFormatException : ��Ȯ�� ����
			System.out.println(pstr);
			
			FileInputStream fis = new FileInputStream("abc.txt"); // FileNotFoundException : Ȯ�� ���� 
			} catch (ArithmeticException e) {
				System.out.println("�Է� ���� �߸� �Ǿ����ϴ�.");
			} catch (ArrayIndexOutOfBoundsException e) {
				System.out.println("�迭�� index�� �߸� �Ǿ����ϴ�.");
			} catch (FileNotFoundException e) {
				System.out.println("�ش� ������ �������� �ʽ��ϴ�.");
			} catch (Exception e) {		// ��� ���� Ŭ������ ���� Ŭ����
				e.printStackTrace();	// ���� �߻��� ������ �޸𸮿��� �����Ͽ� ���ϰ� ���
		} // try catch
	} // main()
} // class