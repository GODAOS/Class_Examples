package sec02;

public class Ex05_ThrowsExample {
	public static void main(String[] args) {
		try {
			findClass();
		} catch(ClassNotFoundException e) {
			System.out.println("Ŭ������ �������� �ʽ��ϴ�.");
		}
	} // main()

	public static void findClass() throws ClassNotFoundException {
		Class clazz = Class.forName("java.lang.String2");
	} // findClass()
} // class