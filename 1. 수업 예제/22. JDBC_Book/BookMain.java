import java.util.Scanner;

public class BookMain {
	public static void menuPrint() {
		System.out.println("\n=====���� ����====");
		System.out.println("���� ���� ��� : I");
		System.out.println("���� ��� ���� : A");
		System.out.println("���� ���� �˻� : S");
		System.out.println("���� ���� ���� : D");
		System.out.println("���� ���� ���� : U");
		System.out.println("���� �ֹ� ��û : O");
		System.out.println("���� ���� ���� : E");
		System.out.println("==================\n");
	}
	
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
				
		while(true) {
			menuPrint();
			System.out.print("�޴��� �Է��ϼ���> ");
			String menu = scanner.nextLine();
			BookInput input = new BookInput(scanner);
			
			if(menu.equalsIgnoreCase("i")) {
				input.bookInsertInput();
			} else if (menu.equalsIgnoreCase("a")) {
				input.bookSearchAllInput();
			} else if (menu.equalsIgnoreCase("d")) {
				input.bookDeleteInput();
			} else if (menu.equalsIgnoreCase("u")) {
				input.bookUpdateInput();
			} else if (menu.equalsIgnoreCase("s")) {
				input.bookSearchTitleInput();
			} else if (menu.equalsIgnoreCase("o")) {
				input.bookOrderInput();
			} else if(menu.equalsIgnoreCase("e")) {
				System.out.print("���� �����Ͻðڽ��ϱ�(Y/N)> ");
				String isExit = scanner.nextLine();
				if(isExit.equalsIgnoreCase("y")) {
					System.out.println("���� ���� ���α׷��� �����մϴ�.");
					BookDAO dao = new BookDAO();
					dao.dbClose();
					System.exit(0);
					break;
				} else if (isExit.equalsIgnoreCase("n")) {
					System.out.println("����ϼ̽��ϴ�.");
					continue;
				} else {
					System.out.println("�߸� �Է��ϼ̽��ϴ�.");
					continue;
				} // if, else if, else
			} else {
				System.out.println("�߸� �Է��ϼ̽��ϴ�.");
				continue;
			} // if else
		} // while()
	} // main()
} // class