import java.util.Scanner;

import com.hanul.member.MemberDAO;
import com.hanul.member.MemberDTO;

public class Ex17_PS_DAO_DTO_update {
	public static void main(String[] args) {
		// ������ ȸ�� ������ �Է� �� memberUpdate() ȣ�� �� �ش� ��ȣ�� ���ڵ带 ����(����)
		Scanner scanner = new Scanner(System.in);
		System.out.print("������ ȸ�� ��ȣ�� �Է��ϼ���> ");
		int num = Integer.parseInt(scanner.nextLine());
		System.out.print("������ ȸ���� �̸��� �Է��ϼ���> ");
		String name = scanner.nextLine();
		System.out.print("������ ȸ���� ���̸� �Է��ϼ���> ");
		int age = Integer.parseInt(scanner.nextLine());
		System.out.print("������ ȸ���� �ּҸ� �Է��ϼ���> ");
		String addr = scanner.nextLine();
		System.out.print("������ ȸ���� ��ȭ��ȣ�� �Է��ϼ���> ");
		String tel = scanner.nextLine();
		scanner.close();
		
		MemberDTO dto = new MemberDTO(num, name, age, addr, tel);
		MemberDAO dao = new MemberDAO();
		int succ = dao.memberUpdate(dto);
		if (succ > 0) {
			System.out.println(num + "�� ȸ�� ������ ���ŵǾ����ϴ�.");
		} else {
			System.out.println(num + "�� ȸ�� ������ �����ϴ�.");
		}
	} // main()
} // class