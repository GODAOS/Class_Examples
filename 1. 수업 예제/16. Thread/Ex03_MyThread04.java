// �ڹٴ� ���� ����� �Ұ���
// �̹� �ٸ� Ŭ������ ��ӹ��� ���¿��� Thread ���� �� ������ �߻�
// �̷��� �������� �ذ��ϱ� ���� Runnable Interface ����
public class Ex03_MyThread04 implements Runnable {
	@Override
	public void run() {
		for (int i = 1; i < 31; i++) {
			System.out.print(i + ", ");
		}
		System.out.println();
	} // run()
} // class

class Ex03_MyThread05 implements Runnable {
	@Override
	public void run() {
		for (char i = 'a'; i <= 'z'; i++) {
			System.out.print(i + ", ");
		}
		System.out.println();
	} // run()
} // class