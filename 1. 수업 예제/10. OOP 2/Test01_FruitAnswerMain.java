import com.hanul.fruit.FruitDAOAnswer;
import com.hanul.fruit.FruitDTO;

public class Test01_FruitAnswerMain {
	public static void main(String[] args) {
		FruitDTO[] fruit = new FruitDTO[5];
		fruit[0] = new FruitDTO("�ٳ���", 3800, 3);
		fruit[1] = new FruitDTO("����", 2000, 6);
		fruit[2] = new FruitDTO("����", 4000, 16);
		fruit[3] = new FruitDTO("õ����", 3200, 20);
		fruit[4] = new FruitDTO("���", 1000, 20);
		
		FruitDAOAnswer dao = new FruitDAOAnswer(fruit);
		dao.getPrice();
		dao.priceDescSort();
		dao.display();
	} // main()
} // class