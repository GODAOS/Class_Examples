package sec02;

public class Ex09_BreakOutterExample {
	public static void main(String[] args) {
		// �ٱ��� �ݺ��� ����
		Outter :
		for(char upper = 'A'; upper <= 'Z'; upper++) {
			for(char lower = 'a'; lower <= 'z'; lower++) {
				System.out.println(upper + "_" + lower);
				if(lower == 'g') {
					break Outter;
				} // if
			} // for a
		} // for A
	System.out.println("���α׷� ���� ����");
	} // main()
} // class