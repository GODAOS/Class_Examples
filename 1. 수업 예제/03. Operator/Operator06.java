public class Operator06 {
	public static void main(String[] args) {
		// ���Կ����� (=) : =(equal)�� ���ٶ�� �ǹ̰� �ƴ϶� ����(�Ҵ�)�� �ǹ�
		// L-Value = R-Value : R-Value�� ��(������)�� L-Value�� ����(�Ҵ�)
		int a = 10;	// ������ ���� a�� �����ϰ�, ��(10)�� �Ҵ� �� �ʱ�ȭ
		System.out.println("���� a�� �� : " + a);
		
		int b = a;	// ������ ���� b�� �����ϰ�, ��(���� a�� ��)�� �Ҵ� �� �ʱ�ȭ
		System.out.println("���� b�� �� : " + b);
		
		b = a + a;	// ���Ҵ�
		System.out.println("���� b�� �� : " + b);
		
		a = a + a;	// ���Ҵ�
		System.out.println("���� a�� �� : " + a);
		
		// ���մ��Կ����� : R-Value���� ���Ǵ� ������ L-Value�� ����(�Ҵ�)�Ǵ� ������ ������ �� ���
		a += a;		// a = a + a;
		System.out.println("���� a�� �� : " + a);
		
		int x = 10;
		x = x + 100;
		System.out.println("���� x�� �� : " + x);
		
		int y = 10;
		y += 100;
		System.out.println("���� y�� �� : " + y);
		
		int z = 100;
		z -= 50;
		System.out.println("���� z�� �� : " + z); 
	} // main()
} // class