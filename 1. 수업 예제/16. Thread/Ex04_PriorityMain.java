public class Ex04_PriorityMain {
	public static void main(String[] args) {
		// ��ü ����
		Ex04_Priority priority1 = new Ex04_Priority(); 
		Ex04_Priority priority2 = new Ex04_Priority(); 
		Ex04_Priority priority3 = new Ex04_Priority();
		
		// �켱 ���� ����, �켱 ������ ���� ���� CPU ���� �ð��� �����
		priority1.setPriority(1);
		priority2.setPriority(5);
		priority3.setPriority(10);
		
		// ������ ����
		priority1.start();
		priority2.start();
		priority3.start();
	} // main()
} // class