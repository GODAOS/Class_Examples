import com.hanul.poly02.Ex02_Animal;
import com.hanul.poly02.Ex02_Cat;
import com.hanul.poly02.Ex02_Dog;

public class Ex02_Poly02main03 {
	public static void main(String[] args) {
		// Dog ��ü�� Cat ��ü�� ���� : �Ϲ����� ���
		Ex02_Dog dog = new Ex02_Dog();
		Ex02_Cat cat = new Ex02_Cat();
		
		// ������ ��ü�� �迭(animals[])�� �����Ͻÿ�. �� Ÿ��[] �ĺ��� = { ~~, ~~ }
		Ex02_Animal[] animals = {dog, cat};	// ������ �迭
		
		for (int i = 0; i < animals.length; i++) {
			animals[i].cry();
			if(animals[i] instanceof Ex02_Cat) {
				((Ex02_Cat)animals[i]).night();
			}
		}
	} // main()
} // class