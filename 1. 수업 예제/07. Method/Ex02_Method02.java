public class Ex02_Method02 {
	// getSum() �޼ҵ忡 10�� 20�� �Ű� ������ ������ ȣ�⹮ �ۼ�
	// ��, return �Ͻÿ� �� getSum() ��� �� �� main() ����
	public static void main(String[] args) {
		int a = 10, b = 20;
		int sum = getSum(a, b);	// getSum() �޼ҵ带 ȣ�⹮ �� ���μ�
		System.out.println("ù ��° �μ� : " + a);
		System.out.println("�� ��° �μ� : " + b);
		System.out.println("�� �μ��� �� : " + sum);
	} // main()
	
	// 2���� ������ �Ű� ������ �޾� ��(sum)�� ���Ͽ� �����ϴ� �޼ҵ�(getSum())�� ����
	public static int getSum(int a, int b) {	// getSum() �޼ҵ带 ���� �� ���μ�
		int sum = a + b;
		return sum;		// return : ���� Ÿ�� ���� �� void �� int
	} // getSum()
} // class