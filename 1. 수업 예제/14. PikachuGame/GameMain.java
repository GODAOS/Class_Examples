import java.util.Scanner;

public class GameMain {
	public static void main(String[] args) {
		Character character = null;
		SubMenu sm = new SubMenu();
		
		Scanner scanner = new Scanner(System.in);
		System.out.println("���ϴ� ĳ���͸� �����ϼ���!");
		System.out.print("1. ��ī��\t2. �̻��ؾ�\t3. ���α� �� ");
		
		int c = Integer.parseInt(scanner.nextLine());
		if(c == 1) {
			character = new Pikachu();
			sm.playGame(character);
		} else if(c == 2) {
			character = new Bulbasaur();
			sm.playGame(character);
		} else if(c == 3) {
			character = new Squirtle();
			sm.playGame(character);
		} else {
			System.out.println("�߸� �Է��ϼ̽��ϴ�!");
		}
		
		scanner.close();
	} // main()
} // class