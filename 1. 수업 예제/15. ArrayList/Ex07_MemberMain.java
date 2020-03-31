import java.util.ArrayList;

import com.hanul.member.MemberDAO;
import com.hanul.member.MemberDTO;

public class Ex07_MemberMain {
/*
�� ȸ�� ����
1. MemberMain.java 
	- ȸ�� ������ ���� �� ���� �迭 : ArrayList<>
		# �̸�	����	�ּ�		��ȭ��ȣ 
		# name	age	addr	tel		�� ��� ����(�ʵ�) �� MemberDTO.java :com.hanul.member package
	- ȸ�� ������ �Է� : new MemberDTO(~~, ~~, ~~, ~~);
	- ȸ�� ������ ��� : display() �� ��� �޼���(���) �� MemberDAO.java : com.hanul.member package
	- ������ �������� ���� �� ��� : ageAscSort(), display()
2. MemberDTO.java : com.hanul.member package
	- ��� ���� ����
	- ����Ʈ ������ �޼���
	- ������ �޼��� �ʱ�ȭ : ��� ������ �ϳ��� ���´�. �� ��üȭ(��ü ����)
	- Getters & Setters �޼���
3. MemberDAO.java : com.hanul.member package
	- ��� �޼��� : display()
	- ������ �������� ���� �޼ҵ� : ageAscSort()
*/
	public static void main(String[] args) {
		// ȸ�� ����(MemberDTO)�� ArrayList<>�� �����Ͻÿ�.
		ArrayList<MemberDTO> list = new ArrayList<>();
		list.add(new MemberDTO("ȫ�浿", 27, "���ֽ� ���� �󼺵�", "010-1111-1111"));
		list.add(new MemberDTO("��浿", 29, "���ֽ� ���� ���̵�", "010-2222-2222"));
		list.add(new MemberDTO("���浿", 25, "���ֽ� ���� ������", "010-3333-3333"));
		
		// ȸ�� ����(ArrayList<>)�� ��� : display() �� MemberDAO.java
		MemberDAO dao = new MemberDAO();
		dao.display(list);
		
		// ȸ�� ����(ArrayList<>)�� ������ ������ ������������ ���� �� ���
		dao.ageAscSort(list);
		dao.display(list);
		
		// ������ �������� ���� �� ���
		dao.nameDescSort(list);
		dao.display(list);
	} // main()
} // class