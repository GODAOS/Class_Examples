public class Ex01_OpticalMouse extends Ex01_WheelMouse {
	// ���� Ŭ������ Ex01_WheelMouse Class�� ���� Ŭ������ Ex01_OpticalMouse Class�� ��ӹ޾Ҵ�.
	// �������̵�(Override) : �ڽ� Ŭ�������� �θ� Ŭ�����κ��� ��� ���� �޼ҵ带 ������
	
	// ��� 1. �ϵ� �ڵ� �� @Override Annotation���̱�
	@Override
	public void clickLeft() {
		System.out.println("�����콺 ���� ��ư Ŭ��");
	}

	// ��� 2. Source - Override/Implement Methods �� ����
	@Override
	public void clickRight() {
		System.out.println("�����콺 ������ ��ư Ŭ��");
	}
	
	// ��� 3. �ڵ� �ϼ� ���(Ctrl + Space) ��� �� ����
	@Override
	public void scroll() {
		System.out.println("�����콺 ��ũ�� ���");
	}
	
} // class