package com.hanul.book;

public class BookDAO {

/*	private BookDTO[] book;	// ��� ���� : ������ �޼ҵ�� ���� Ŭ���� ���ο����� ���
	public BookDAO() {}		// ����Ʈ ������ �޼ҵ�(���� ����)
	public BookDAO(BookDTO[] book) {	// ��ü �迭(book[])�� �Ű� ������ ���� �޴� ������ �޼ҵ带 �ʱ�ȭ
		super();			// ��� ��� ����, ���� ����
		this.book = book;
	}*/
		
	private BookDTO[] book;	// ��� ���� : ������ �޼ҵ�� ���� Ŭ���� ���ο����� ���
	public BookDAO(BookDTO[] book) {
		this.book = book;
	}
	
	// ���� ���
	public void getPrice() {
		for (int i = 0; i < book.length; i++) {
//			int price = book[i].getPrice() * book[i].getQuantity();
//			book[i].setPrice(price);
			book[i].setPrice(book[i].getCost() * book[i].getQuantity());
		} // for
	} // getPrice()

	// ���
	public void display() {
		System.out.println("����\t����\t���ǻ�\t�ܰ�\t����\t����");
		System.out.println("==============================================");
		for (int i = 0; i < book.length; i++) {
			System.out.print(book[i].getTitle() + "\t");
			System.out.print(book[i].getName() + "\t");
			System.out.print(book[i].getCompany() + "\t");
			System.out.print(book[i].getCost() + "\t");
			System.out.print(book[i].getQuantity() + "\t");
			System.out.print(book[i].getPrice() + "\n");
		} // for
	} // display()	
} // class