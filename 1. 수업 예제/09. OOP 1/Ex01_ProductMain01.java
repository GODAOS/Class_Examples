public class Ex01_ProductMain01 {
	public static void main(String[] args) {
		Ex01_Product p1;			// Ex01_Product Type�� ���� ���� p1�� ���� : �ν��Ͻ�(instance), ���۷���(reference)
		p1 = new Ex01_Product();	// p1�� ����� �޸𸮸� new Ű����� �Ҵ�ް�, ������ �޼ҵ带 ȣ��
//		Ex01_Product p1 = new Ex01_Product();	// Ex01_Product Class�� Ȱ���ϱ� ���� ��ü p1�� ����
		p1.num = 1;			// p1�� ������� num�� 1�� �Ҵ� : ��������.��������� ����
		p1.name = "��ǻ��";	// p1�� ������� name�� ��ǻ�͸� �Ҵ�

		Ex01_Product p2 = new Ex01_Product();
		p2.num = 2;
		p2.name = "��Ʈ��";
		
		Ex01_Product p3 = new Ex01_Product();
		p3.num = 3;
		p3.name = "������";
		
		System.out.println("��ü p1�� ����");
		System.out.println("num : " + p1.num);
		System.out.println("name : " + p1.name);
		System.out.println("====================");
		
		System.out.println("��ü p2�� ����");
		System.out.println("num : " + p2.num);
		System.out.println("name : " + p2.name);
		System.out.println("====================");

		System.out.println("��ü p3�� ����");
		System.out.println("num : " + p3.num);
		System.out.println("name : " + p3.name);
		System.out.println("====================");
	} // main()
} // class