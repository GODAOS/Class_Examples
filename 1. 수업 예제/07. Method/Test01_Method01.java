public class Test01_Method01 {
	public static void main(String[] args) {
/*		// 1���� 50������ ������ :  a ~ b
		int a = 1, b = 50, sum = 0;
		for(int i = a; i <= b; i++) {
			sum += i;
		}
		System.out.println(a + "���� " + b + "������ ������ : " + sum);
		
		// 51���� 100������ ������ : c ~ d
		int c = 51, d = 100;
		sum = 0;
		for(int i = c; i <= d; i++) {
			sum += i;
		}
		System.out.println(c + "���� " + d + "������ ������ : " + sum);*/
		
		int a = 1, b = 50, c= 51, d = 100; // �μ� ���� �ʱ�ȭ
		getSum(a, b);	// 1 ~ 50 �������� ���ϴ� �޼ҵ�(getSum())�� ȣ�� �� ���μ�
		getSum(c, d);	// 51 ~ 100 �������� ���ϴ� �޼ҵ�(getSum())�� ȣ�� �� ���μ�
		getSum(a, d);	// 1 ~ 100 �������� ���ϴ� �޼ҵ�(getSum())�� ȣ�� �� ���μ�
		getSum(10, 30);
	} // main()
	
	// �� ���� ������ ���޹޾� ������(sum)�� ���ϴ� �޼ҵ�(getSum())�� ����
	public static void getSum(int x, int y) {	// getSum() �޼ҵ带 ���� �� ���μ�
		int sum = 0;
		for(int i = x; i <= y; i++) {
			sum += i;
		}
		System.out.println(x + "���� " + y + "������ ������ : " + sum);
	} // getSum()
} // class