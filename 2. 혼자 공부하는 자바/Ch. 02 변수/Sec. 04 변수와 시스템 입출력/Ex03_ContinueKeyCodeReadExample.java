package sec04;

public class Ex03_ContinueKeyCodeReadExample {
	public static void main(String[] args) throws Exception {
		int keyCode;
		
		while(true) { // �ݺ� ����
			keyCode = System.in.read();
			System.out.println("keyCode : " + keyCode);
		} // while
	} // main()
} // class