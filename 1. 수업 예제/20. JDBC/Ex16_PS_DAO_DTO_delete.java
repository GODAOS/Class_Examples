import java.util.Scanner;

import com.hanul.member.MemberDAO;

public class Ex16_PS_DAO_DTO_delete {
	public static void main(String[] args) {
		// main() : ȸ�� ��ȣ�� �Է� �� memberDelete() ȣ�� ��  �ش� ��ȣ�� ���ڵ带 ����
		Scanner scanner = new Scanner(System.in);
		System.out.print("������ ȸ�� ��ȣ�� �Է��ϼ��� : ");
		int num = Integer.parseInt(scanner.nextLine());
		scanner.close();
		
		MemberDAO dao = new MemberDAO();
		int succ = dao.memberDelete(num);
		if(succ > 0) {
			System.out.println(num + "�� ȸ�� ������ �����Ǿ����ϴ�.");
		} else {
			System.out.println(num + "�� ȸ�� ������ �����ϴ�.");
		}
	} // main()
} // class