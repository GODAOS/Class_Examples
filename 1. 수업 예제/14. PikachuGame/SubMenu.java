import java.util.Scanner;

public class SubMenu {
	public void playGame(Character character) {
		Scanner scanner = new Scanner(System.in);
		
		while(true) {
			System.out.println("������ �ұ��?");
			System.out.print("1. ���� �ֱ�\t2. �� ����\t3. ����ֱ�\t4. �Ʒý�Ű��\t5. ���� �� ");
			int menu = Integer.parseInt(scanner.nextLine());
			
			if(menu == 1) {
				character.eat();
			} else if(menu == 2) {
				character.sleep();
			} else if(menu == 3) {
				character.play();
				if(!character.checkEnergy()) {	// ! : ����(true �� false, false �� true)
					System.out.println("�������� �����ؼ� ĳ���Ͱ� ����߽��ϴ�!");
					break;
				}
				character.levelUp();
			} else if(menu == 4) {
				character.train();
				if(!character.checkEnergy()) {	// ! : ����(true �� false, false �� true)
					System.out.println("�������� �����ؼ� ĳ���Ͱ� ����߽��ϴ�!");
					break;
				}
				character.levelUp();
			} else if(menu == 5) {
				System.out.println("������ �����մϴ�!");
				break;
			} else {
				System.out.println("�߸� �Է��ϼ̽��ϴ�!");
				continue;
			} // if
			character.printInfo();
		} // while
		scanner.close();
	} // playGame()
} // class