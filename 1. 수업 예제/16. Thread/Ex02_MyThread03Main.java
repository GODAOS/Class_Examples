public class Ex02_MyThread03Main {
	public static void main(String[] args) {
		// �ϳ��� �۾�(MyThread03. java)�� ���ÿ� ����ǰ� ����.
		// Thread Class�� �ϳ��� �����, ��ü�� ������ �����ؼ� �����ϸ� �ȴ�
		Ex02_MyThread03 thread0 = new Ex02_MyThread03();
		Ex02_MyThread03 thread1 = new Ex02_MyThread03();
		Ex02_MyThread03 thread2 = new Ex02_MyThread03();
		
		//�������� ������ start() �޼ҵ�� ȣ��
		thread0.start();
		thread1.start();
		thread2.start();
	} // main()
} // class