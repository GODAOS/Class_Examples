package sec02;

public class Q05 {
	public static void main(String[] args) {
		// ��ø for���� �̿��ؼ� �־��� �迭�� ��ü �׸��� �հ� ��հ��� ���Ͻÿ�.
		int[][] array = {
				{95, 86},
				{83, 92, 96},
				{78, 83, 93, 87, 88}
		}; // array
		
		int sum = 0;
		double avg = 0.0;
		
		// �ۼ� ��ġ
		double cnt = 0;
		for (int i = 0; i < array.length; i++) {
			for (int j = 0; j < array[i].length; j++) {
				sum += array[i][j];
				cnt++;
			} // for j
		} // for i
		avg = sum / cnt;
		
		System.out.println("sum : " + sum);
		System.out.println("avg : " + avg);
	} // main()
} // class