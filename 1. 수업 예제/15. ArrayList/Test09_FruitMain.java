import java.util.ArrayList;

import com.hanul.fruit.FruitDAO;
import com.hanul.fruit.FruitDTO;

public class Test09_FruitMain {
	/*
	�� ���� ���� ����
	1. FruitMain.java 
		- ���� ������ ���� �� ���� �迭 : ArrayList<>
			# ���ϸ�	�ܰ�		����	 
			# name	cost 	quantity	�� ��� ����(�ʵ�) �� FruitDTO.java :com.hanul.fruit package
		- ���� ������ �Է� : new FruitDTO(~~, ~~, ~~, ~~);
		- �ֹ� ������ ��� : getPrice() �� ��� �޼���(���) �� FruitDAO.java : com.hanul.fruit package
		- ������ �������� ���� �� ��� : priceDescSort(), display()
		- ���� ������ ��� : display() 

	2. FruitDTO.java : com.hanul.fruit package
		- ��� ���� ���� : private
		- ����Ʈ ������ �޼���
		- ������ �޼��� �ʱ�ȭ : ��� ������ �ϳ��� ���´�. �� ��üȭ(��ü ����)
		- Getters & Setters �޼���
	3. FruitDAO.java : com.hanul.fruit package
		- �ֹ� ���� ��� �޼��� : getPrice()
		- ������ �������� ���� �޼��� : priceDescSort()
		- ��� �޼��� : display()
	*/
	public static void main(String[] args) {
		ArrayList<FruitDTO> list = new ArrayList<>();
		list.add(new FruitDTO("���", 1500, 32));
		list.add(new FruitDTO("������", 2000, 16));
		list.add(new FruitDTO("��", 6000, 6));
		list.add(new FruitDTO("�丶��", 500, 48));
		list.add(new FruitDTO("����", 5000, 16));
		list.add(new FruitDTO("����", 3000, 10));
		
		FruitDAO dao = new FruitDAO(list);
		dao.getPrice();
		dao.priceDescSort();
		dao.display();
	} // main()
} // class