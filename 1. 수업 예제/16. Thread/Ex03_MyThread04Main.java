public class Ex03_MyThread04Main {
	public static void main(String[] args) {
		// ��ü ����
		Ex03_MyThread04 run1 = new Ex03_MyThread04();
		Ex03_MyThread05 run2 = new Ex03_MyThread05();
		
		// Rnnable Interface�� ��ӹ޾� ������ Thread�� ��¥ �����尡 �ƴϴ�.
		// Thread ��ü�� �����ϰ�, Runnable�� �Ű� ������ �����Ѵ�.
		Thread thread1 = new Thread(run1);
		Thread thread2 = new Thread(run2);
//		Thread thread = new Thread(new Ex03_MyThread04());
		
		// Thread�� ������ start() �޼��带 ȣ��
		thread1.start();
		thread2.start();
	} // main()
} // class