package sec02;

public class Q04_Array_for {
	public static void main(String[] args) {
		// for���� �̿��ؼ� �迭�� �׸񿡼� �ִ밪 ���ϱ�
		int max = 0;
		int[] array = {1, 5, 3, 8, 2};
		
		//�ۼ� ��ġ
		for (int i = 0; i < array.length; i++) {
			if(array[i] > max) {
				max = array[i];
			} // if
		} // for i

		System.out.println("max : " + max);
	} // main()
} // class