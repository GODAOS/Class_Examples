import java.util.ArrayList;

import com.hanul.member.MemberDTO;

public class Ex09_ForEachMain03 {
	public static void main(String[] args) {
		// ȸ�� ����(MemberDTO)�� ArrayList<>�� �����Ͻÿ�.
		ArrayList<MemberDTO> list = new ArrayList<>();
		list.add(new MemberDTO("ȫ�浿", 27, "���ֽ� ���� �󼺵�", "010-1111-1111"));
		list.add(new MemberDTO("��浿", 29, "���ֽ� ���� ���̵�", "010-2222-2222"));

		// ArrayList<> ���� ��� : ��ȯ ��
		for (MemberDTO dto : list) {
			System.out.print(dto.getName() + "\t");
			System.out.print(dto.getAge() + "\t");
			System.out.print(dto.getAddr() + "\t");
			System.out.print(dto.getTel() + "\n");
		}
		System.out.println("=============================================");
		
		// Swap : ���� �ڸ� �ٲ�(��ȯ) �� �ӽú���(temp), set()
		MemberDTO temp = list.get(0);
		list.set(0, list.get(1));
		list.set(1, temp);
		
		// ArrayList<> ���� ��� : ��ȯ ��
		for (MemberDTO dto : list) {
			System.out.print(dto.getName() + "\t");
			System.out.print(dto.getAge() + "\t");
			System.out.print(dto.getAddr() + "\t");
			System.out.print(dto.getTel() + "\n");
		}
		System.out.println("=============================================");
	} // main()
} // class