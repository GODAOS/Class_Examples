import java.util.ArrayList;

import com.hanul.product.ProductDAO;
import com.hanul.product.ProductDTO;

public class Test09_ProductMain {
	/*
	�� ��ǰ ����
	1. ProductMain.java 
		- ��ǰ ������ ���� �� ���� �迭 : ArrayList<>
			# ��ǰ��	�ܰ�		����	 
			# name	cost 	quantity	�� ��� ����(�ʵ�) �� ProductDTO.java :com.hanul.product package
		- ��ǰ ������ �Է� : new ProductDTO(~~, ~~, ~~, ~~);
		- �ֹ� ������ ��� : getPrice() �� ��� �޼���(���) �� ProductDAO.java : com.hanul.product package
		- ��ǰ ������ ��� : display() 
		- ������ �������� ���� �� ��� : priceDescSort(), display()
		- ��ǰ���� �������� ���� �� ��� : nameAscSort(), display()
	2. ProductDTO.java : com.hanul.product package
		- ��� ���� ���� : private
		- ����Ʈ ������ �޼���
		- ������ �޼��� �ʱ�ȭ : ��� ������ �ϳ��� ���´�. �� ��üȭ(��ü ����)
		- Getters & Setters �޼���
	3. ProductDAO.java : com.hanul.product package
		- �ֹ� ���� ��� �޼��� : getPrice()
		- ��� �޼��� : display()
		- ������ �������� ���� �޼��� : priceDescSort()
		- ��ǰ���� �������� ���� �޼��� : nameAscSort()
		
	* ������ �޼ҵ忡 list�� �Ű� ������ ����
	* ���ݿ��� õ ���� ���� ��ȣ�� ��ȭ�� ǥ��
	*/
	public static void main(String[] args) {
		ArrayList<ProductDTO> list = new ArrayList<>();
		list.add(new ProductDTO("��ǻ��", 500000, 5));
		list.add(new ProductDTO("������", 100000, 7));
		list.add(new ProductDTO("��Ʈ��", 300000, 5));
		list.add(new ProductDTO("�����", 300000, 5));
		list.add(new ProductDTO("Ű����", 100000, 8));
		
		ProductDAO dao = new ProductDAO(list);
		dao.getPrice();
		dao.display();
		dao.priceDescSort();
		dao.display();
		dao.nameAscSort();
		dao.display();
	} // main()
} // class