public class Ex01_MyThread01Main {
	public static void main(String[] args) {
		// ��ü ����
		Ex01_MyThread01 thread01 = new Ex01_MyThread01();
		Ex01_MyThread02 thread02 = new Ex01_MyThread02();
		
		// thread01, thread02�� run() �޼��� ȣ��
//		thread01.run();	// 1 ~ 30 ���
//		thread02.run(); // a ~ z ���
		// thread01, thread02�� run() �޼��尡 ���ÿ� ����� �� �ֵ��� ȣ��
		thread01.start();
		thread02.start();
	} // main()
} // class