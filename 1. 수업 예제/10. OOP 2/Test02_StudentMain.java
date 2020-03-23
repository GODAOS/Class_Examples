import com.hanul.student.StudentDAO;
import com.hanul.student.StudentDTO;

public class Test02_StudentMain {
/*
�� StudentMain.Java �� default package
	- �л� 3���� ������ ó���� ��ü(StudentDTO) �迭(student[])�� �����ϰ� ���� �Ҵ�
 		[ȫ�浿, 2020001, �İ���, 95.4, 90.3]
 		[��浿, 2020002, �����, 80.7, 85.6]
 		[���浿, 2020003, �����, 85, 97.8]
 	- StudentDAO ��ü ���� �� ��ü ���� �� ��ü�迭(student[])�� �Ű������� ����
 	 # ���� ���	# ��� ���		# ������ ������������ ����	# ���
 	 # �̸��� ������������ ����	#���
�� ��������(StudentDTO.java) : com.hanul.student package
	- ������� ����
	name	num		major	cpp		java
	String	int		String	float	float
	- ����Ʈ ������ �޼ҵ�
	- ������ �޼ҵ� �ʱ�ȭ
	- Getters and Setters �޼ҵ�
�� ��������(StudentDAO.java) : com.hanul.student package
	- getSum() : ���� ��� �޼ҵ�
	- getAvg() : ��� ��� �޼ҵ�
	- sumDescSort() : ������ �������� ����
	- display() : ��� �޼ҵ� �� ��, ����� �Ҽ� ù°�ڸ����� ǥ���Ѵ�
	- nameAscSort() : �̸��� �������� ���� �� compareTo() ���
�� ��� ����
�̸�		�й�		�а�		C++		JAVA	����		���
====================================================
XXX		XXX		XXX		XX.X	XX.X	XX.X	XX.X
*/	
	public static void main(String[] args) {
		StudentDTO[] stdnt = new StudentDTO[3];
		stdnt[0] = new StudentDTO(2020001, "ȫ�浿", "�İ���", 95.4F, 90.3F);
		stdnt[1] = new StudentDTO(2020002, "��浿", "�����", 80.7F, 85.6F);
		stdnt[2] = new StudentDTO(2020003, "���浿", "�����", 85F, 97.8F);
		
		StudentDAO dao = new StudentDAO(stdnt);
		dao.getSum();
		dao.getAvg();
		dao.sumDescSort();
		dao.display();
		dao.nameAscSort();
		dao.display();
	} // main()
} // class