public class Ex03_static01 {
	public static void main(String[] args) {
		display1();
//		display2();	// non-static : ���� �Ұ���
		
		Ex03_static01 ex03 = new Ex03_static01();
		ex03.display2();
		ex03.display1();
	} // main()
	
	public static void display1() {
		System.out.println("Display1");
	} // display1()
	
	public void display2() {
		System.out.println("Display2");
	} // display2()
	
	static {
		System.out.println("static �ʱ�ȭ ���");
	} // static
} // class

// static : ���α׷� �������� ���� �޸𸮿� �Ҵ�, ���α׷� ���� �� �Ҹ�
// �ʱ�ȭ ��� : static { ~~~ } �� ���� ���� ����Ǵ� ���