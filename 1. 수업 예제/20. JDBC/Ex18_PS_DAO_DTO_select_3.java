import java.util.ArrayList;

import com.hanul.member.MemberDAO;
import com.hanul.member.MemberDTO;

public class Ex18_PS_DAO_DTO_select_3 {
	public static void main(String[] args) {
		// ��ü ȸ�� ����� �˻� �� ��� : ��ü ȸ������ �� ������ �� �� ���� �� ArrayList<>
		// memberSearchAll(list) ȣ�� �� ����� return �޾� ���
		ArrayList<MemberDTO> list = new ArrayList<>();
		MemberDAO dao = new MemberDAO();
		list = dao.memberSearchAll3(list);
		
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