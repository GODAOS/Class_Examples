import java.util.ArrayList;

import com.hanul.array.Ex01_Test;

public class Ex02_ArrayListMain02 {
	public static void main(String[] args) {
		// ArrayList<> ��ü ����(list) �� Object : ��� ��ü(Ŭ����)
		ArrayList<Object> list1 = new ArrayList<Object>();
		list1.add(new Integer(100));	// Element (���)�� �ݵ�� ��ü(Ŭ���� Ÿ��)
		list1.add(new String("Apple"));
		list1.add(new Ex01_Test());
		
		for (int i = 0; i < list1.size(); i++) {
			Object obj = list1.get(i);				//list1�� i��° index ���� �����´� �� Object Type
			if(obj instanceof Integer) {			// obj�� Ÿ���� Integer Ÿ���̸�
				System.out.println((Integer)obj);	// Integer Ÿ������ Casting �� ���
			} else if(obj instanceof String) {		// obj�� Ÿ���� String Ÿ���̸�
				System.out.println((String)obj);	// String Ÿ������ Casting �� ���
			} else if(obj instanceof Ex01_Test) {	// obj�� Ÿ���� Ex01_Test Ÿ���̸�
				((Ex01_Test)obj).display();			// Ex01_Test Ÿ������ Casting �� ���
			} // if else if
		} // for
		
		System.out.println("===============================");
		
		// ArrayList<> ��ü ����(list2) : Ư�� Ŭ����(Ex01_Test.java)�� �����ϱ� ���� Ÿ�� ����
		ArrayList<Ex01_Test> list2 = new ArrayList<>();
		list2.add(new Ex01_Test());
//		list2.add(new Integer(100));	// ����
		
		list2.get(0).display();
		
	} // main()
} // class