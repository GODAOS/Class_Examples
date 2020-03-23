public class Ex04_PersonMain {
	/*
	�� ȸ������ 
		- 3���� ȸ�� ������ ������ ��ü�迭 �����ϰ� ���� �Ҵ� �� Ex04_PersonDTO.java
		[ȫ�浿, 33, 175.5, 75, M]
		[���浿, 30, 178, 66.5, M]
		[������, 28, 165, 48.5, F]
		- ��ü�迭�� ������ ��� �� Ex04_PersonDAO.java
	
	�� ��������(Ex04_PersonDTO.java)
	 - ��� ���� ����
	name	age		height	weight	gender
	String	int		float	float	char
	 - ����Ʈ ������ �޼ҵ�
	 - ������ �޼ҵ� �ʱ�ȭ
	 - Getters and Setters �޼ҵ�
	
	�� ��������(Ex04_PersonDAO.java)
	 - display() : ��� �޼ҵ�
	*/ 
	public static void main(String[] args) {
		// 3���� ȸ�� ������ ������ ��ü(Ex04_PersonDTO.java)�迭(person[]) �����ϰ� ���� �Ҵ�
		Ex04_PersonDTO[] person = new Ex04_PersonDTO[3];
		person[0] = new Ex04_PersonDTO("ȫ�浿", 33, 175.5F, 75F, 'M');
		person[1] = new Ex04_PersonDTO("���浿", 30, 178F, 66.5F, 'M');
		person[2] = new Ex04_PersonDTO("������", 28, 165F, 48.5F, 'F');
		
		// ��ü�迭�� ������ ���(display()) : Ex04_PersonDAO.java
		Ex04_PersonDAO dao = new Ex04_PersonDAO();
		dao.display(person);
		dao.ageAscSort(person); // ������ �������� ����
		dao.display(person);
		dao.heightDescSort(person);	// Ű�� �������� ����
		dao.display(person);
	} // main()
} // class