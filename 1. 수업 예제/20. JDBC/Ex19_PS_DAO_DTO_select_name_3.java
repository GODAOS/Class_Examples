import java.util.ArrayList;
import java.util.Scanner;

import com.hanul.member.MemberDAO;
import com.hanul.member.MemberDTO;

public class Ex19_PS_DAO_DTO_select_name_3 {
	public static void main(String[] args) {
		// �˻��� �̸��� �Է� : ��ü ȸ������ �� ������ �� �� ���� �� ArrayList<>
		// memberSearchName3(list, searchName) ȣ�� �� ����� return �޾� ���
		Scanner scanner = new Scanner(System.in);
		System.out.print("�˻��� �̸��� �Է��ϼ���> ");
		String searchName = scanner.nextLine();
		scanner.close();
		
		ArrayList<MemberDTO> list = new ArrayList<>();
		MemberDAO dao = new MemberDAO();
		list = dao.memberSearchName3(list, searchName);
		
		// list�� ������ ���
		if (list.size() == 0) {
			System.out.println("�˻��� ����� �����ϴ�.");
		} else {
			for (MemberDTO dto : list) {
				System.out.print(dto.getNum() + "\t");
				System.out.print(dto.getName() + "\t");
				System.out.print(dto.getAge() + "\t");
				System.out.print(dto.getAddr() + "\t");
				System.out.print(dto.getTel() + "\n");
			}
		}
	} // main()
} // class