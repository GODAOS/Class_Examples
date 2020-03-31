import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;

import com.hanul.study.FruitDAO;
import com.hanul.study.FruitDTO;

public class Test13_Fruit {
	/*
	�� Fruit.txt �� IO Project
	���		3000	17
	�ٳ���	3500	10
	����		5000	8
	����		20000	3
	������	2000	10
	========================================		
	
	�� FruitResult.txt �� IO Project
	��ǰ��	�ܰ�		����	����
	XXX		��X,XXX	XX	��X,XXX
	XXX		��X,XXX	XX	��X,XXX
	========================================
	
	�� FruitMain.java �� default package
		- Fruit.txt ������ ������ ���� ������ �о
		- FruitResult.txt ���Ͽ� ����Ͻÿ�.
		- �� ������ �׸��� TAB("\t")���� ���еǾ� �ִ�.
		- ������ ����Ͻÿ�(�ܰ� * ����)
		- ������ ������������ ������ �� ���(����)�Ͻÿ�.
		- �ʿ� �� ȭ�鿡 ����Ͻÿ�.
		- FileReader, BufferedReader
		- FileWriter, BufferedWriter
		- FruitDTO, ArrayList<FruitDTO>
		
		- ������ �Է��� ���� �غ� �ܰ�
		- ������ ������ ������ �о�(readLine())�� ������ ������ �ʱ�ȭ
		- TAB���� split()�� ��, FruitDTO ��ü ����
		- ArrayList(<FruitDTO> ��ü ����
	
	�� FruitDTO.java �� com.hanul.study package
		- ��� ���� ����(name, cost, quantity, price)
		- ����Ʈ ������ �޼���
		- ������ �޼��� �ʱ�ȭ
		- Getter & Setters �޼���
	
	�� FruitDAO.java �� com.hanul.study package
		- ArrayList<>�� �Ű� ������ ���� �޴� ������
		- ���� ��� : getPrice()
		- ȭ�� ��� : display()
		- ������ �������� ���� : priceDescSort()
		- ���� ���(����) : fileSave()
	 */
	public static void main(String[] args) {
		try {
			String inputPath = "D:\\Study_Java\\workspace\\17. IO\\Fruit.txt";
			FileReader fr = new FileReader(inputPath);
			BufferedReader br = new BufferedReader(fr);
			
			String line = null;
			FruitDTO dto = null;
			ArrayList<FruitDTO> list = new ArrayList<>();
			
			while((line = br.readLine()) != null) {
				String[] sp = line.split("\t");
				dto = new FruitDTO(sp[0], Integer.parseInt(sp[1]), Integer.parseInt(sp[2]));
				list.add(dto);
			}
			
			FruitDAO dao = new FruitDAO(list);
			dao.getPrice();
			dao.display();
			dao.priceDescSort();
			dao.display();
			dao.fileSave();
			
			br.close();
			fr.close();
		} catch (Exception e) {
			e.printStackTrace();
		} // try catch
	} // main()
} // class