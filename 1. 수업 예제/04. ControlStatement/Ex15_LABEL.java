public class Ex15_LABEL {
	public static void main(String[] args) {
		LABEL:
		for(char upper = 'A'; upper <= 'Z'; upper++) {
			for(char lower = 'a'; lower <= 'z'; lower++){
					System.out.println(upper + "-" + lower);
					if(lower == 'g') {
						break LABEL;	// ��ü ���ǹ��� ������������ �Ҷ� LABEL�� ����Ѵ�.
					} // if
			} // for
		} // for
	} // main()
} // class