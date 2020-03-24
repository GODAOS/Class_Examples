public class Pikachu extends Character {	// ��� : Pikachu �� Character
	public Pikachu() {	// ����Ʈ ������ �޼ҵ� : ����ġ, ������, ���� �ʱ�ȭ
		exp = 30;
		energy = 50;
		level = 0;
		System.out.println("��ī�� ĳ���Ͱ� �����Ǿ����ϴ�.");
		printInfo();
	} // Pikachu()

	@Override
	public void eat() {
		energy += 10;
	}

	@Override
	public void sleep() {
		energy += 5;
	}

	@Override
	public boolean play() {
		energy -= 20;
		exp += 5;
		return checkEnergy();
	}

	@Override
	public boolean train() {
		energy -= 10;
		exp += 15;
		return checkEnergy();
	}

	@Override
	public void levelUp() {
		if(exp >= 40) {
			level++;
			exp -= 40;
			System.out.println("������ �Ǿ����ϴ�.");
		}
	}
} // class