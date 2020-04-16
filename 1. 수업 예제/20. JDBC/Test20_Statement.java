import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

/*
[tblMember Table]
num	name	age	addr			tel
1	ȫ�浿	29	���ֽ� ���� �󼺵�		010-1234-5678
2	�ڹ���	25	���ֽ� ���� ������		010-5555-6666
3	�̸���	25	���ֽ� ���� ������		010-9999-8888
4	ȫ���	35	���ֽ� �ϱ� �����		010-7788-7788
5	������	33	���ֽ� ���걸 ��		010-8888-7788

[ó�� ����]
- tblMember Table�� ������ ���� ���� �Է�(����)�Ѵ�.
- �˻��� ��ȭ��ȣ�� �Ϻθ� �Է� �޴´�.
- �Է� ���� ��ȭ��ȣ�� �̿��Ͽ� tblMember ���̺�� �����Ͽ�,
	��ȭ��ȣ�� �˻��Ͽ� ����Ѵ�.
	
[��� ȭ��]
�˻��� ��ȭ��ȣ�� �Է��ϼ��� : 7788
4	ȫ���	35	���ֽ� �ϱ� �����		010-7788-7788
5	������	33	���ֽ� ���걸 ��		010-8888-7788

[Hint]
- Scanner Ȱ��, �Է� ������ �̿��� SQL �ۼ�, Like �����ڸ� Ȱ��
- String sql = "select * from tblMember where tel like '%' + searchTel + '%'";
- ���� ��ü�� Statement ��ü�� Ȱ��
*/
public class Test20_Statement {
	public static void main(String[] args) {
		try {
			// 0. DB�� ����
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
			String user = "hanul";
			String password = "0000";
			Connection conn = DriverManager.getConnection(url, user, password);
			System.out.println("���� ����");
			
			// 1. ���� ���̺��� ����
			Statement st = conn.createStatement();
			String sql = "delete from tblMember";
			int succ = st.executeUpdate(sql);
			if (succ > 0) {
				System.out.println("���� ����");
			} else {
				System.out.println("���� ����");
			}
			
			// 2. ���̺� �ۼ�
			sql = "insert into tblMember values (1, 'ȫ�浿', 29, '���ֽ� ���� �󼺵�', '010-1234-5678')";
			succ = st.executeUpdate(sql);
			sql = "insert into tblMember values (2, '�ڹ���', 25, '���ֽ� ���� ������', '010-5555-6666')";
			succ = st.executeUpdate(sql);
			sql = "insert into tblMember values (3, '�̸���', 29, '���ֽ� ���� ������', '010-9999-8888')";
			succ = st.executeUpdate(sql);
			sql = "insert into tblMember values (4, 'ȫ���', 35, '���ֽ� �ϱ� �����', '010-7788-7788')";
			succ = st.executeUpdate(sql);
			sql = "insert into tblMember values (5, '������', 33, '���ֽ� ���걸 ��', '010-8888-7788')";
			succ = st.executeUpdate(sql);
			if (succ > 0) {
				System.out.println("���� ����");
			} else {
				System.out.println("���� ����");
			}
			
			// 3. �˻��� ��ȭ��ȣ�� �Է¹޴´�.
			Scanner scanner = new Scanner(System.in);
			System.out.print("�˻��� ��ȭ��ȣ�� �Է��ϼ���> ");
			String searchTel = scanner.nextLine();
			scanner.close();
			
			// 4. �Է¹��� ��ȭ��ȣ�� ���̺��� �˻��ϰ� ����Ѵ�.
			st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			sql = "select * from tblMember where tel like '%" + searchTel + "%'";
			ResultSet rs = st.executeQuery(sql);
			
			rs.last();
			int rowCount = rs.getRow();
			
			if(rowCount > 0) {
				rs.beforeFirst();
				while(rs.next()) {
					int num = rs.getInt("num");
					String name = rs.getString("name");
					int age = rs.getInt("age");
					String addr = rs.getString("addr");
					String tel = rs.getString("tel");
					System.out.println(num + "\t" + name + "\t" + age + "\t" + addr + "\t" + tel);
				}
			} else {
				System.out.println("�˻� ����� ������ϴ�.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class