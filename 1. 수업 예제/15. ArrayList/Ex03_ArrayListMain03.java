import java.util.ArrayList;

public class Ex03_ArrayListMain03 {
	public static void main(String[] args) {
		// ArrayList<> list�� ���� 10, 20, 30, 40, 50�� ����(add())�ϰ� ���(get())
//		ArrayList<Object> list = new ArrayList<>();		// Object : ��½� Casting �ʿ�
		ArrayList<Integer> list = new ArrayList<>(); 	// Integer ���� : Casting ���ʿ�
		
		list.add(new Integer(10));	// �������� ���� ���
		list.add(new Integer(20));	// new Ű����(������)�� ��üȭ(��ü ����)
		list.add(30);				// int �� Integer �� AutoBoxing
		list.add(40);				// �����Ϸ�(JVM)�� �ڵ����� ó������
		list.add(50);				// 
		
		System.out.println((Integer)list.get(0));	// Casting
		System.out.println((Integer)list.get(1));
		System.out.println(list.get(2));	// ���� Ÿ������ ��ȯ �� AutoUnBoxing
		System.out.println(list.get(3));
		System.out.println(list.get(4));
	} // main()
} // class