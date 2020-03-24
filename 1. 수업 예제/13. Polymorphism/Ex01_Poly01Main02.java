import com.hanul.poly01.Ex01_Animal;
import com.hanul.poly01.Ex01_Cat;
import com.hanul.poly01.Ex01_Dog;

public class Ex01_Poly01Main02 {
	public static void main(String[] args) {
		Ex01_Dog dog = new Ex01_Dog();	// �Ϲ����� ��ü ���� ��� : A a = new A();
		dog.cry();
		
		Ex01_Animal animal = new Ex01_Cat();	// ��ĳ����(UpCasting) �� ������
		animal.cry();							// �θ� Ŭ������ ������ ��Ų��
//		animal.night();		// ���� �߻� : Ex01_Animal Ŭ�������� night() �޼ҵ尡 ����.
		
		Ex01_Cat cat = (Ex01_Cat)animal;		// �ٿ�ĳ����(DownCasting)
		cat.night();
		((Ex01_Cat)animal).night();
	} // main()
} // class

/*
�� ��ü�� �����ϴ� ���
	- Dog dog = new Dog();			�� �Ϲ����� ���
	- Animal animal = new Dog();	�� ��ĳ����(UpCasting) �� ������
	
�� �������� ���� ����
	- ��� ���� :public class �ڽ� Ŭ����(B) extends �θ� Ŭ����(A) �� B �� A
	- Override �ʼ� : �ڽ� Ŭ����(B)������ �θ� Ŭ����(A)�� ���(�޼ҵ�)�� ������ �ʼ�
	- UpCasting���� ��ü�� ����(�θ� Ŭ���� �������Ҵ��Ѵ�) : A a = new B();
*/