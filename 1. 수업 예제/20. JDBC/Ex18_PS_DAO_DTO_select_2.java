import java.util.ArrayList;

import com.hanul.member.MemberDAO;
import com.hanul.member.MemberDTO;

public class Ex18_PS_DAO_DTO_select_2 {
	public static void main(String[] args) {
		// ��ü ȸ�� ����� �˻� �� ��� : ��ü ȸ������ �� ������ �� �� ���� �� ArrayList<>
		// memberSearchAll(list) ȣ��
		ArrayList<MemberDTO> list = new ArrayList<>();
		MemberDAO dao = new MemberDAO();
		dao.memberSearchAll2(list);
	} // main()
} // class