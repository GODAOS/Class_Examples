import java.util.Scanner;

import com.hanul.member.MemberDAO;

public class Ex19_PS_DAO_DTO_select_name_1 {
	public static void main(String[] args) {
		// �˻��� �̸��� �Է� �� memberSearchName() ȣ�� : �˻� ����� ���
		Scanner scanner = new Scanner(System.in);
		System.out.print("�˻��� �̸��� �Է��ϼ���> ");
		String searchName = scanner.nextLine();
		scanner.close();
		
		MemberDAO dao = new MemberDAO();
		dao.memberSearchName(searchName);
		// �˻� ����� ������ �ƹ� �޽����� ��µ��� ������ ���� ����Ⱑ ���ŷӴ�.
	} // main()
} // class