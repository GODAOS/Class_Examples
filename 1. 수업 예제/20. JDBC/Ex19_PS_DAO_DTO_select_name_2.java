import java.util.ArrayList;
import java.util.Scanner;

import com.hanul.member.MemberDAO;
import com.hanul.member.MemberDTO;

public class Ex19_PS_DAO_DTO_select_name_2 {
	public static void main(String[] args) {
		// �˻��� �̸��� �Է� : ��ü ȸ������ �� ������ �� �� ���� �� ArrayList<>
		// memberSearchName(list, searchName) ȣ�� : �˻� ����� ���
		Scanner scanner = new Scanner(System.in);
		System.out.print("�˻��� �̸��� �Է��ϼ���> ");
		String searchName = scanner.nextLine();
		scanner.close();
		
		ArrayList<MemberDTO> list = new ArrayList<>();
		MemberDAO dao = new MemberDAO();
		dao.memberSearchName(list, searchName);
	} // main()
} // class