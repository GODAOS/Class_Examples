package sec02;

public class Ex09_LogicalOperatorExample {
	public static void main(String[] args) {
		// �� ������
		int charCode = 'A';
		
		if( (charCode >= 65) & (charCode <= 90) ) {
			System.out.println("�빮�ڱ���");
		} // if
		
		if( (charCode >= 97) && (charCode <= 122) ) {
			System.out.println("�ҹ��ڱ���");
		} // if
		
		if( (charCode >= 48) && (charCode <= 57) ) {
			System.out.println("0 ~ 9 ���ڱ���");
		} // if
		
		int value = 6;
		
		if( (value % 2 == 0) | (value % 3 == 0) ) {
			System.out.println("2 �Ǵ� 3�� �������");
		} // if
		
		if( (value % 2 == 0) || (value % 3 == 0) ) {
			System.out.println("2 �Ǵ� 3�� �������");
		} // if
	} // main()
} // class