import java.util.ArrayList;

public class Ex04_ArrayListMain04 {
	public static void main(String[] args) {
		//ArrayList<> list�� ���� 10, 20, 30, 40, 50�� ����(add())�ϰ� ���(get())
		ArrayList<Integer> list = new ArrayList<>();
		
		// �ܼ� for�� ���
		for(int i = 1; i <= 5; i++) {
			list.add(i * 10);
		}
		
		for (int i = 0; i < list.size(); i++) {
			System.out.println("list[" + i + "] : " + list.get(i));
		}

		// ���� for�� ���
		for (Integer integer : list) {
			System.out.println(integer);
		}

		// Boxing�� list ���
		System.out.println(list);
	} // main()
} // class