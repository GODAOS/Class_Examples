public class Ex04_PersonDTO {	// �������� ����Ǵ�Ŭ����
	// �� �������(�ʵ�) ���� : �������� �� private
	private String name;	// �̸�
	private int age;		// ����
	private float height;	// Ű
	private float weight; 	// ������
	private char gender;	// ����
	
	// �� ����Ʈ ������ �޼ҵ�
	public Ex04_PersonDTO() {}
	
	// �� ������ �޼ҵ� �ʱ�ȭ : �ڵ� �ϼ�
	public Ex04_PersonDTO(String name, int age, float height, float weight, char gender) {
		super();
		this.name = name;
		this.age = age;
		this.height = height;
		this.weight = weight;
		this.gender = gender;
	}
	
	// �� Getters & Setteers �޼ҵ� : �ڵ� �ϼ�
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public float getHeight() {
		return height;
	}

	public void setHeight(float height) {
		this.height = height;
	}

	public float getWeight() {
		return weight;
	}

	public void setWeight(float weight) {
		this.weight = weight;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}
} // class