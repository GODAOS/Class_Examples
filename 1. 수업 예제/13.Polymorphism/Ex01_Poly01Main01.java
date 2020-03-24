import com.hanul.poly01.Ex01_Animal;
import com.hanul.poly01.Ex01_Cat;
import com.hanul.poly01.Ex01_Dog;

public class Ex01_Poly01Main01 {
	// Ex01_Dog ��ü�� �����ϰ� cry() �޼ҵ带 ȣ���Ͻÿ�.
	public static void main(String[] args) {
		// ��Ȳ 1 : Ex01_Dog Ŭ������ �ڽ��� ���� �������.
		// Ex01_Dog Ŭ���� �ȿ� ���� ������ �ְ�, �� ������ ��� ���� �Ǵ��� �˰� �ִ�.
		Ex01_Dog dog = new Ex01_Dog();
		dog.cry();
		
		// ��Ȳ 2 : Ex01_Dog Ŭ������ �ٸ� ����� ���� ������ �־���(Ex01_Dog.class)
		// Ex01_Dog Ŭ���� �ȿ� ���� ������ �ְ�, ��� ���� �Ǵ��� �� ���� ����.
		
		// ��Ȳ 3 : Ex01_Dog Ŭ������ Ex01_Animal Ŭ������ ������ �־���.
		// Ex01_Animal Ŭ������ ���� Ŭ�����̰� cry() �޼ҵ带 �����߰�,
		// Ex01_Dog Ŭ������ ���� Ŭ������� cry() �޼ҵ带 ������(Override)�ߴٰ� �˷���
		// ��ü ���� : �θ� Ŭ���� ������ ��ü ���� �� ��ĳ����(UpCasting) : �������� �߻�
		Ex01_Animal animal = new Ex01_Dog();
		animal.cry();
		
		animal = new Ex01_Cat();
		animal.cry();
//		animal.night();	// ���۵��� �ʴ´� : �θ� Ŭ����(Ex01_Animal)�� night() �޼ҵ尡 ����.
		
		Ex01_Cat cat = new Ex01_Cat();
		cat.night();
		
		// A a = new A(); �Ϲ����� ��ü ����
		// A a = new B(); ������(UpCasting) : B(����) �� A(����)
		
	} // main()
} // class