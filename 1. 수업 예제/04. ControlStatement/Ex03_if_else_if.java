public class Ex03_if_else_if {
	public static void main(String[] args) {
		int score = 87;
		
		if(score >= 90) {
			System.out.println("A����");
		} else if(score >= 80) {
			System.out.println("B����");
		} else if(score >= 70) {
			System.out.println("C����");
		} else if(score >= 60) {
			System.out.println("D����");
		} else {
			System.out.println("F����");
		} // if
	} // main()
} // class

/*
�� ���� if�� : ���� ���� ������ �Ǵ��Ͽ�, �ش� ������ ������ ��� ����

if(���ǽ�1){
	���ǽ�1�� ���϶� ����Ǵ� ����;
} else if(���ǽ�2){
	���ǽ�2�� ���϶� ����Ǵ� ����;
} else if(���ǽ�N){
	���ǽ�N�� ���϶� ����Ǵ� ����;
} else {
	�����϶� ����Ǵ� ����;
}
*/