public class Bulbasaur extends Character {
	public Bulbasaur() {
		exp = 20;
		energy = 30;
		level = 0;
		System.out.println("�̻��ؾ� ĳ���Ͱ� �����Ǿ����ϴ�.");
		printInfo();
	} // Bulbasaur()

	@Override
	public void eat() {
		energy += 5;
	}

	@Override
	public void sleep() {
		energy += 20;
	}

	@Override
	public boolean play() {
		energy -= 10;
		exp += 15;
		return checkEnergy();
	}

	@Override
	public boolean train() {
		energy -= 10;
		exp += 25;
		return checkEnergy();
	}

	@Override
	public void levelUp() {
		if(exp >= 35) {
			level++;
			exp -= 35;
			System.out.println("������ �Ǿ����ϴ�.");
		}
	}
} // class