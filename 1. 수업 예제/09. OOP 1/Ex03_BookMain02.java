public class Ex03_BookMain02 {
	public static void main(String[] args) {
		// ���� ����(Ex03_BookDTO)�� ������ ��ü �迭(book[])�� ����
		Ex03_BookDTO[] book;
		// 3���� ���� ������ ����� ��ü�迭(book[])�� ����
		book = new Ex03_BookDTO[3];
//		Ex03_BookDTO[] book = new Ex03_BookDTO[3];	// ��ü �迭�� ���� �� ����
		
		// Ex03_BookDTO.java�� ������ �޼ҵ带 �̿��Ͽ� �ʱ�ȭ : ���� ������ ����(��)�� �Է�
		book[0] = new Ex03_BookDTO("JAVA", 24000, "�Ѻ��̵��", "�ſ��"); // �� Ű�� �� �׸� �̵� ����
		book[1] = new Ex03_BookDTO("View", 28000, "���̵��", "������");
		
		// ����Ʈ ������ �޼ҵ带 �̿��Ͽ� ���� �Ҵ�
		Ex03_BookDTO dto = new Ex03_BookDTO();
		dto.setTitle("Android");
		dto.setPrice(40000);
		dto.setCompany("�������ۺ���");
		dto.setName("�����");
		book[2] = dto;

		// ���� ����(book[])�� ������ ��� : Ex03_BookDAO.java �� display() �޼ҵ� ȣ��
		Ex03_BookDAO dao = new Ex03_BookDAO();
		dao.display(book);
	} // main()
} // class