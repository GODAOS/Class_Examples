public class Ex04_PersonDAO {
	// ��� �޼ҵ�
	public void display(Ex04_PersonDTO[] person) {
		System.out.println("�̸�\t����\tŰ\tü��\t����");
		System.out.println("===================================");
		for (int i = 0; i < person.length; i++) {
			System.out.print(person[i].getName() + "\t");
			System.out.print(person[i].getAge() + "\t");
			System.out.print(person[i].getHeight() + "\t");
			System.out.print(person[i].getWeight() + "\t");
			System.out.print(person[i].getGender() + "\n");
			System.out.println("===================================");
		} // for
	} // display()

	// ������ �������� ����
	public void ageAscSort(Ex04_PersonDTO[] person) {
		for (int i = 0; i < person.length; i++) {
			for (int j = i + 1; j < person.length; j++) {
				if(person[i].getAge() > person[j].getAge()) {	// ��������
					Ex04_PersonDTO temp = person[i];
					person[i] = person[j];
					person[j] = temp;
				} // if
			} // for j
		} // for i
	} // ageAscSort

	// ������ �������� ����
	public void heightDescSort(Ex04_PersonDTO[] person) {
		for (int i = 0; i < person.length; i++) {
			for (int j = i + 1; j < person.length; j++) {
				if(person[i].getHeight() < person[j].getHeight()) {	// ��������
					Ex04_PersonDTO temp = person[i];
					person[i] = person[j];
					person[j] = temp;
				} // if
			} // for j
		} // for i
	} // heightDescSort
} // class
