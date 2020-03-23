import com.hanul.book.BookDAO;
import com.hanul.book.BookDTO;

public class Ex01_BookMain {
	/*
	�� ��������(Ex01_BookMain.java) : default package
		- 3���� ���� ������ ������ ��ü �迭 �����ϰ� ���� �Ҵ� �� BookDTO.java
			[JAVA, �ſ��, �Ѻ�, 24000, 16]
			[View, ������, ���, 28000, 18]
			[Android, �����, ����, 40000, 11]
		- BookDAO.java	��	��ü ���� �� ��ü�迭(book[])�� �Ű� ������ ����
			# ���� ���
			# ���
	�� ��������(BookDTO.java) : com.hanul.book package
		- ��� ���� ����
			title	name	company	cost	quantity	price
			String	String	String	int		int			int
		- ����Ʈ ������ �޼ҵ�
		- ������ �޼ҵ� �ʱ�ȭ
		- Getters and Setters �޼ҵ�
	�� ��������(BookDAO.java) : com.hanul.book package
		- getPrice() : ��¸޼ҵ�
		- display() : ��¸޼ҵ�
	*/
	
	public static void main(String[] args) {
		// å 3���� ������ ��ü(BookDTO) �迭(book[])�� �����ϰ� �ʱ�ȭ
		BookDTO[] book = new BookDTO[3];	// import ���� ������ ���� Ctrl + Shift + O�� ������ import ���� �߰��ȴ�.
		book[0]	= new BookDTO("JAVA", "�ſ��", "�Ѻ�", 24000, 16);
		book[1] = new BookDTO("View", "������", "���", 28000, 18);
		book[2] = new BookDTO("Android", "�����", "����", 40000, 11);
		
		// BookDAO.java�� �޼ҵ带 ȣ��
		// BookDAO ��ü ���� �� ��ü�迭(book[])�� �Ű� ������ ��������
		BookDAO dao = new BookDAO(book);
		dao.getPrice();	// ���ݰ��
		dao.display();	// ���
	} // main()
} // class