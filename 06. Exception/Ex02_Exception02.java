public class Ex02_Exception02 {
	public static void main(String[] args) {
		//�������� �Ҵ� �� �丮���� �� �丮�� �� �������� ��ٴ� �� ����
		try {
			System.out.println("�������� �Ҵ�");
			System.out.println("�丮����");
			int a = 10 / 0;	//���ܹ߻�
			System.out.println("�丮��");
//			System.out.println("�������� ��ٴ�");
//			System.out.println("����");
		} catch (Exception e) {
			System.out.println("���ܹ߻�");
//			System.out.println("�������� ��ٴ�");
//			System.out.println("����");
		} finally {
			System.out.println("�������� ��ٴ�");
			System.out.println("����");
		}
	} // main ()
} // class