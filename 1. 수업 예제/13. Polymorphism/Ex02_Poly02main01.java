import com.hanul.poly02.Ex02_Animal;
import com.hanul.poly02.Ex02_Cat;
import com.hanul.poly02.Ex02_Dog;

public class Ex02_Poly02main01 {
	public static void main(String[] args) {
		// Ex02_Dog ��ü�� ���� : UpCasting
		Ex02_Animal animal = new Ex02_Dog();
		animal.cry();
		
		// Ex02_Cat ��ü�� ���� : UpCasting
		animal = new Ex02_Cat();
		animal.cry();
	} // main()
} // class