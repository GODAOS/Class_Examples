public class Ex14_break {
	public static void main(String[] args) {
		// break : �ݺ����� Ż���ϴ� ��ɾ�
		for(int i = 1; true; i++) {		// ���� ����
			System.out.println("i�� �� : " + i);
			if(i == 10) {
				System.out.println("i�� ���� 10�̹Ƿ� �ݺ����� �����մϴ�.");
				break;
			} // if
		} // for
	} // main()
} // class