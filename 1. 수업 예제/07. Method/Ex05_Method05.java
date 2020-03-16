public class Ex05_Method05 {
	public static void main(String[] args) {
		getSum(10, 20);			// getSum(int, int) �޼ҵ� ȣ��
		System.out.println("==============");
		getSum(10, 20, 30);		// getSum(int, int, int) �޼ҵ� ȣ��
		System.out.println("==============");
		getSum(10.5, 20.3);		// getSum(double, double) �޼ҵ� ȣ��
		System.out.println("==============");
		getSum(10, 10.5);		// getSum(double, double) �޼ҵ� ȣ��
	} // main()
	
	public static void getSum(int x, int y) {	//getSum(int, int) �޼ҵ� ����
		System.out.println("ù ��° �μ� : " + x);
		System.out.println("�� ��° �μ� : " + y);
		System.out.println("�� �μ��� �� : " + (x + y));
	} // getSum()
	
	public static void getSum(int x, int y, int z) {	// getSum(int, int, int) �޼ҵ� ȣ��
		System.out.println("ù ��° �μ� : " + x);
		System.out.println("�� ��° �μ� : " + y);
		System.out.println("�� ��° �μ� : " + z);
		System.out.println("�� �μ��� �� : " + (x + y + z));
	} // getSum()
	
	public static void getSum(double x, double y) {		// getSum(double, double) �޼ҵ� ����
		System.out.println("ù ��° �μ� : " + x);
		System.out.println("�� ��° �μ� : " + y);
		System.out.println("�� �μ��� �� : " + (x + y));
	} // getSum()
} // class

/*
�� �޼ҵ� �����ε�(OverLoading)
	- Ŭ���� �ȿ� ���� �̸��� ������ �ִ� �޼ҵ带 ���� �� ����(����)
	- �Ű� ������ ������ �޶�� �Ѵ�.
	- �Ű� ������ ���� ��쿡�� �Ű� ���� ������ Ÿ���� �޶�� �Ѵ�.
*/