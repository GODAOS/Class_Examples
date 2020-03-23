import com.hanul.fruit.FruitDAO;
import com.hanul.fruit.FruitDTO;

public class Test01_FruitMain {
/*
�� Test01_FruitMain.java �� default package
	- 5������ ���� �ֹ� ��Ȳ�� ������ ��ü(FruitDTO) �迭(fruit[]) �����ϰ� ���� �Ҵ�
		[�ٳ���,	3800, 3]
		[����, 2000, 6]
		[����, 4000, 16]
		[õ����, 3200, 20]
		[���, 1000, 20]
	- FruitDAO ��ü ���� �� ��ü ������ �� ��ü�迭(fruit[])�� �Ű� ������ ����
		# ���ݰ��
		# ������ �������� ����
		# ���

�� ���� ����(FruitDTO.java) : com.hanul.fruit package
	- ��� ���� ����
	name	cost	quantity	price
	String	int		int			int
	- ����Ʈ ������ �޼ҵ�
	- ������ �޼ҵ� �ʱ�ȭ
	- Getters and Setters �޼ҵ�

�� ���� ����(FruitDAO.java) : com.hanul.fruit package
	- getPrice() : ���ݰ�� �޼ҵ�
	- priceDescSort() : ������ �������� ���� �޼ҵ�
	- display() : ��� �޼ҵ�
*/
	public static void main(String[] args) {
		// ���� 5�� ��ü �迭 ���� �ʱ�ȭ
		FruitDTO[] fruit = new FruitDTO[5];
		fruit[0] = new FruitDTO("�ٳ���", 3800, 3);
		fruit[1] = new FruitDTO("����", 2000, 6);
		fruit[2] = new FruitDTO("����", 4000, 16);
		fruit[3] = new FruitDTO("õ����", 3200, 20);
		fruit[4] = new FruitDTO("���", 1000, 20);
		
		FruitDAO dao = new FruitDAO(fruit);
		dao.getPrice();
		dao.priceDescSort();
		dao.display();
	} // main()
} // class