public class Ex01_MouseMain {
	public static void main(String[] args) {
		System.out.println("Mouse Class");
		Ex01_Mouse m = new Ex01_Mouse();	// Ex01_Mouse ��ü ����
		m.clickLeft();
		m.clickRight();
		System.out.println("============");
		
		System.out.println("WheelMouse Class");
		Ex01_WheelMouse wm = new Ex01_WheelMouse();	// Ex01_WheelMouse ��ü ����
		wm.clickLeft();		// ��� ���� ���� Ŭ����(Ex01_Mouse)�� �޼ҵ�
		wm.clickRight();	// ��� ���� ���� Ŭ����(Ex01_Mouse)�� �޼ҵ�
		wm.scroll();		// ���� Ŭ����(Ex01_WheelMouse)�� �޼ҵ�
		System.out.println("============");
		
		System.out.println("OpticalMouse Class");
		Ex01_OpticalMouse om = new Ex01_OpticalMouse();	// Ex01_OpticalMouse ��ü ����
		om.clickLeft();
		om.clickRight();
		om.scroll();
	} // main()
} // class