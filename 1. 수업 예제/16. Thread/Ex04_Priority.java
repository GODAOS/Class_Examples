// ������� �켱 ����(Priority)�� ������ �� �ִ�
// 1(�ּ�, MIN_PRIORITY) ~ 10(�ִ�, MAX_PRIORITY)���� ����
// ���ڰ� �������� �켱 ������ ����.
// �⺻ ��(NORM_PRIORITY)�� 5�� ����
// getPriority() �޼���� �켱 ������ Ȯ�� : ��¹�
// setPriority() �޼���� �켱 ������ ���� : ���๮
public class Ex04_Priority extends Thread {
	@Override
	public void run() {
		for(int i = 1; i <= 10; i++) {
			System.out.println(getName() + "�켱���� : " + getPriority() + ", Hello" + i);
		}
	}
}
