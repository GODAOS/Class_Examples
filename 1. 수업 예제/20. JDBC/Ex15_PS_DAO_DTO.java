import java.util.Scanner;

import com.hanul.member.MemberDAO;
import com.hanul.member.MemberDTO;

public class Ex15_PS_DAO_DTO {
	public static void main(String[] args) {
		// PreparedStatement(���� ��ü)�� MemberDTO ����
		// main() : ȸ�� ������ �Է¹޴´� �� memberInsert() ȣ�� �� DB�Է�(����)
		Scanner scanner = new Scanner(System.in);
		System.out.print("ȸ�� ��ȣ�� �Է��ϼ���> ");
		int num = Integer.parseInt(scanner.nextLine());
		
		System.out.print("�̸��� �Է��ϼ���> ");
		String name = scanner.nextLine();
		
		System.out.print("���̸� �Է��ϼ���> ");
		int age = Integer.parseInt(scanner.nextLine());
		
		System.out.print("�ּҸ� �Է��ϼ���> ");
		String addr = scanner.nextLine();
		
		System.out.print("��ȭ��ȣ�� �Է��ϼ���> ");
		String tel = scanner.nextLine();
		scanner.close();
//		System.out.println(num + "\t" + name + "\t" + age + "\t" + addr + "\t" + tel);
		
		MemberDTO dto = new MemberDTO(num, name, age, addr, tel);
		MemberDAO dao = new MemberDAO();
		int succ = dao.memberInsert(dto);
		if (succ > 0) {
			System.out.println("���� ����");
		} else {
			System.out.println("���� ����");
		}
	} // main()
} // class