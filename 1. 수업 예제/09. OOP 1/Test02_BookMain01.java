public class Test02_BookMain01 {
	public static void main(String[] args) {
		// ��ü�� �����ϰ� ���� �Ҵ��� �� ���
		// book1	JAVA	24000��	�Ѻ��̵��		�ſ��
		// book2	View	28000��	���̵��		������
		// book3	Android	40000��	�������ۺ���	�����
		Test02_Book book1 = new Test02_Book();
		book1.title = "JAVA";
		book1.price = 24000;
		book1.company = "�Ѻ��̵��";
		book1.name = "�ſ��";
		
		Test02_Book book2 = new Test02_Book();
		book2.title = "View";
		book2.price = 28000;
		book2.company = "���̵��";
		book2.name = "������";
		
		Test02_Book book3 = new Test02_Book();
		book3.title = "Android";
		book3.price = 40000;
		book3.company = "�������ۺ���";
		book3.name = "�����";
		
		// ���
		book1.display();
		book2.display();
		book3.display();
	} // main()
} // class