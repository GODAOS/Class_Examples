import java.util.Scanner;

import com.hanul.member.MemberDAO;
import com.hanul.member.MenuInput;

public class MemberMain {
	public static void menuPrint() {
		System.out.println("=====ȸ�� ����=====");
		System.out.println("ȸ�� ���� �Է� : I");
		System.out.println("ȸ�� ���� ���� : U");
		System.out.println("ȸ�� ���� ���� : D");
//		System.out.println("ȸ�� ���� �˻� : S");	// searchAllInput()		��	memberSearchAll()
//		System.out.println("ȸ�� �̸� �˻� : N");	// searchNameInput()	��	memberSearchName()
//		System.out.println("ȸ�� �ּ� �˻� : A");	// searchAddrInput()	��	memberSearchAddr()
//		System.out.println("ȸ�� ���� �˻� : T");	// searchTelInput()		��	memberSearchTel()
		System.out.println("ȸ�� ���� ���� : E");
		System.out.println("===================");
	} // menuPrint()
	
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		MenuInput input = new MenuInput(scanner);
		
		while(true) {
			menuPrint();
			System.out.print("�޴��� �Է��ϼ���> ");
			String menu = scanner.nextLine();
			
			if(menu.equalsIgnoreCase("i")) {
//				System.out.println("�ű� ȸ�� ��� ȭ��");
				input.insertInput();	// ȸ�� ���� �Է� �� ��� ���� ȭ��
			} else if (menu.equalsIgnoreCase("u")) {
				input.updateInput();	// ȸ�� ���� �����ϴ� ���� ȭ��
			} else if (menu.equalsIgnoreCase("d")) {	
				input.deleteInput();	// ȸ�� ���� �����ϴ� ���� ȭ��
			} else if(menu.equalsIgnoreCase("e")) {
				System.out.print("���� �����Ͻðڽ��ϱ�? (Y/N)> ");
				String exit = scanner.nextLine();
				if (exit.equalsIgnoreCase("y")) {
					System.out.println("ȸ�� ���� ���α׷��� �����մϴ�.");
					MemberDAO dao = new MemberDAO();
					dao.dbClose();
					System.exit(0);
					break;
				} else if(exit.equalsIgnoreCase("n")) {
					continue;
				} else {
					System.out.println("�޴��� �߸� �Է��ϼ̽��ϴ�!");
					continue;
				}
			} else {
				System.out.println("�޴��� �߸� �Է��ϼ̽��ϴ�!");
				continue;
			}
		}
		scanner.close();
	} // main()
} // class