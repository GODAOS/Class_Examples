public class Ex02_AnimalMain {
	public static void main(String[] args) {
		Ex02_Dog dog = new Ex02_Dog("�۸���", 3);	// Dog ��ü�� �����ϰ� �ʱ�ȭ
		Ex02_Cat cat = new Ex02_Cat("�߿���", 2);	// Cat ��ü�� �����ϰ� �ʱ�ȭ
		
		System.out.println("������ �̸� : " + dog.getName() + "\t���� : " + dog.getAge());
		System.out.println("����� �̸� : " + cat.getName() + "\t���� : " + cat.getAge());
		
		dog.setName("�����");
		dog.setAge(4);
		System.out.println("������ �̸� : " + dog.getName() + "\t���� : " + dog.getAge());

		cat.setName("�޺���");
		cat.setAge(4);
		System.out.println("����� �̸� : " + cat.getName() + "\t���� : " + cat.getAge());
	} // main()
} // class