// ��������(�������, �ʵ�)�� �����ϴ� Class
// ���� �ٸ� Ÿ���� �����͸� �ϳ��� ���� ���� ����
public class Ex03_BookDTO {
	// �� ������� ���� �� ��������(ĸ��ȭ) : private
	private String title;	// ����
	private int price;		// ����
	private String company;	// ���ǻ�
	private String name;	// ����
	
	// �� �⺻ ������ �޼ҵ�(Default Constructor Method)
	// Ŭ������ �̸��� �޼ҵ��� �̸��� ����, ���� Ÿ���� ����.
	// ���޵Ǵ� �Ű� ������ ������(body{})�� ����. : �� ����
	// ���� ���� �� JVM�� �ڵ����� ���� �� ��, DTO(VO) Class ���� �� �ݵ�� ����� ����!
	public Ex03_BookDTO() {}

	// �� ����� ��� ������ ���� �Ҵ��ϱ� ����, ���޵Ǵ� �Ű� ������ �ʱ�ȭ�ϴ� ������ �޼ҵ� ����
	// ��Ŭ�������� �ڵ����� ���� : ��� �޴� �� Source or ��Ŭ�� Source �� Generate Constructor using Fields
	public Ex03_BookDTO(String title, int price, String company, String name) {
		super();				// �θ�(����) Ŭ������ ȣ�� : JAVA�� ��� Ŭ������ Object Class ������ ���
		this.title = title;		// ���� = �Ű� ���� �� �Ķ��� = ��� ������ �ְڴ�.
		this.price = price;		// �Ű� ������ ��� ������ �����ϱ� ���� ��� ���� �տ� this Ű����
		this.company = company;	// ��� ���� : ���� Ŭ���� �ȿ����� ���Ǵ� ����, �Ű� ���� : �޼ҵ忡�� ���޵Ǵ� ����
		this.name = name;
	}

	// �� �Է�(Setter), ���(Getter) �޼ҵ带 ���� : ��� ������ ����
	// ��Ŭ�������� �ڵ����� ���� : Source �� Generate Setters and Getters
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
} // class