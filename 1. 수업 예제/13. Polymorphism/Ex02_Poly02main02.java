import com.hanul.poly02.Ex02_Animal;
import com.hanul.poly02.Ex02_Cat;
import com.hanul.poly02.Ex02_Dog;

public class Ex02_Poly02main02 {
	public static void main(String[] args) {
		Ex02_Dog dog = new Ex02_Dog();
		Ex02_Cat cat = new Ex02_Cat();
		
		display(dog);	// ���μ�
		display(cat);
	} // main()
	
//	public static void display(Ex02_Cat cat) {}	��	Ex02_Dog �� Ex02_Animal 
//	public static void display(Ex02_Dog dog) {}	��	Ex02_Cat �� Ex02_Animal
	public static void display(Ex02_Animal animal) {	// ���μ� : ������ �μ�
//	���μ��� ���μ��� Ÿ���� �ٸ����� ���μ��� �ڽ�, ���μ��� �θ�� �۵��ȴ�.
		animal.cry();
//		animal.night();	// ���� : Ex02_Animal Ŭ�������� night() �޼ҵ尡 ����
//		((Ex02_Cat)animal).night();		// DonwCasting : ���� �߻�
		
//		Ex02_Cat Class Type���� �μ����� ���޵� ��쿡�� night() �޼ҵ尡 ����
		if(animal instanceof Ex02_Cat) {	// instanceof : Ÿ��(Ŭ����)�� ��Ȯ�ϰ� �˾ƺ���
			((Ex02_Cat)animal).night();
		} // if
	} // display()
} // class