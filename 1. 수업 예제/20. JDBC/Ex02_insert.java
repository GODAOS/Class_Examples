// �� JDBC API import �� �ڵ� ����
// �� JDBC Driver ���� �ε� : ojdbc6.jar
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Ex02_insert {
	public static void main(String[] args) {
		try {
			// �� JDBC Driver Loading (���� �ε�)
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// �� Connection ��ü (���� ��ü)
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
			String user = "hanul";
			String password = "0000";
			Connection conn = DriverManager.getConnection(url, user, password);
			System.out.println("���� ����");
			
			// �� Statement ���� ��ü
			Statement st = conn.createStatement();
			
			// �� SQL ���� �ۼ�
			String sql = "insert into tblMember values";
			sql += "(5, '������', 40, '����� ������ û�㵿', '010-5555-5555')";
			// SQL ���� �������� ; ���� �ʴ´�.
			
			// �� Statement ��ü�� SQL ������ ����
			int succ = st.executeUpdate(sql);
			if(succ > 0) {
				System.out.println("���� ����");
			} else {
				System.out.println("���� ����");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class