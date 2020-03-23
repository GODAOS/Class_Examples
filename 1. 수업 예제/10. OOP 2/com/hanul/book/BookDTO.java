package com.hanul.book;

public class BookDTO {
	// �� ��� ���� ����
	private String title;	// ����
	private String name;	// ����
	private String company;	// ���ǻ�
	private int	cost;		// �ܰ�
	private int	quantity;	// ����
	private	int price;		// ����
	
	// �� �⺻ ������ �޼ҵ�
	public BookDTO() {}
	
	// �� ������ �޼ҵ� �ʱ�ȭ : price�� �Է��ϴ°� �ƴ϶� 5���� �ʱ�ȭ ��
	public BookDTO(String title, String name, String company, int cost, int quantity) {
		super();
		this.title = title;
		this.name = name;
		this.company = company;
		this.cost = cost;
		this.quantity = quantity;
	}

	// �� Getters & Setters �޼ҵ�
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	
	
}
