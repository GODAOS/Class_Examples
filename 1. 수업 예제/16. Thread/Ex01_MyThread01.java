// �����۾� : ������(Thread) �� Thread Ŭ������ ��ӹ޾� run() �޼��忡 ����
public class Ex01_MyThread01 extends Thread {
	// 1 ~ 30 ����ϴ� �ڵ� ���� : run() �޼��忡�� ������(Override)
	@Override
	public void run() {
		for (int i = 1; i < 31; i++) {
			System.out.print(i + ", ");
		}
		System.out.println();
	} // run()
} // class

// ���� �����ڴ� ���ϸ�� �̸��� ���� Ŭ�������� �ٿ��ش�.
class Ex01_MyThread02 extends Thread {
	// a ~ z ����ϴ� �ڵ� ����
	@Override
	public void run() {
//		for (char i = 97; i <= 122; i++) {
		for (char i = 'a'; i <= 'z'; i++) {
			System.out.print(i + ", ");
		}
		System.out.println();
	}
} // class