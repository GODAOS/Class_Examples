public class Ex01_ProductMain02 {
	public static void main(String[] args) {
		Ex01_Product p1 = new Ex01_Product();
		p1.num = 1;			
		p1.name = "��ǻ��";	

		Ex01_Product p2 = new Ex01_Product();
		p2.num = 2;
		p2.name = "��Ʈ��";
		
		Ex01_Product p3 = new Ex01_Product();
		p3.num = 3;
		p3.name = "������";
		
		System.out.println("��ü p1�� ����");
		p1.display();
		System.out.println("====================");
		
		System.out.println("��ü p2�� ����");
		p2.display();
		System.out.println("====================");

		System.out.println("��ü p3�� ����");
		p3.display();
		System.out.println("====================");
	} // main()
} // class