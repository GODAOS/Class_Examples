public class Ex02_StudentMain {
	// Student Class ��ü�� �����ϰ� ��(�̸�(name), ����(kor), ����(eng), ����(mat))�� �Է� �� ��� ����
	// ���� ���(sum()), ��� ���(avg()), ����� ���(display()) �� ��� �޼ҵ�
	public static void main(String[] args) {
		Ex02_Student s1 = new Ex02_Student();
		s1.name = "ȫ�浿";
		s1.kor = 90;
		s1.eng = 65;
		s1.mat = 100;
		s1.getSum();
		s1.getavg();
		s1.display();
		
		Ex02_Student s2 = new Ex02_Student();
		s2.name = "������";
		s2.kor = 80;
		s2.eng = 95;
		s2.mat = 90;
		s2.getSum();
		s2.getavg();
		s2.display();
	} // main()
} // class