public abstract class Character {	// �߻� Ŭ����
	// ��� ���� ����
	protected int exp;		// ����ġ
	protected int energy;	// ������
	protected int level;	// ����
	
	// �߻� �޼ҵ�
	public abstract void eat();
	public abstract void sleep();
	public abstract boolean play();		// play(), train() �� �������� �����ϱ� ������ ���� üũ�� �ؾ��ؼ� boolean Ÿ��
	public abstract boolean train();
	public abstract void levelUp();
	
	// ������ üũ
	public boolean checkEnergy() {
		if(energy > 0) {
			return true;
		} else {
			return false;
		}
	} // checkEnergy()
	
	// ���� ĳ������ ���¸� ���
	public void printInfo() {
		System.out.println("================================");
		System.out.println("���� ĳ������ ������ ����մϴ�.");
		System.out.println("����ġ : " + exp);
		System.out.println("������ : " + energy);
		System.out.println("���� : " + level);
		System.out.println("================================");
	} // printInfo()
} // class