public class Ex06_ForEachMain01 {
	public static void main(String[] args) {
		int[] score = {95, 80, 83, 72, 91};
		
		// �迭�� ���� : for		�� �迭(Array) ����
		int sum = 0;
		for (int i = 0; i < score.length; i++) {
			sum += score[i];
		}
		System.out.println("�迭�� ���� : " + sum);
		
		// �迭�� ���� : forEach(���� for��)	�� ���ѹ迭(ArrayList) ����
		sum = 0;
		for (int i : score) {
			sum += i;
		} 
		System.out.println("�迭�� ���� : " + sum);
	} // main()
} // class