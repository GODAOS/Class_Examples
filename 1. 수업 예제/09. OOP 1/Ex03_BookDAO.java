public class Ex03_BookDAO { // ���� ����(���, ����)�� �����ϴ� Class �� �޼ҵ��� ����
	// ��� �޼ҵ�
	public void display(Ex03_BookDTO[] book) {
		for (int i = 0; i < book.length; i++) {
			System.out.println("���� : " + book[i].getTitle());
			System.out.println("���� : " + book[i].getPrice());
			System.out.println("���ǻ� : " + book[i].getCompany());
			System.out.println("���� : " + book[i].getName());
			System.out.println("================================");
		} // for
	} // display()
} // class