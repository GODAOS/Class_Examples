import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Ex08_delete_name {
	public static void main(String[] args) {
		// �̸�(name)�� �������� ȸ���� ����
		// delete from tblMember where name = '������';
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
			String user = "hanul";
			String password = "0000";
			Connection conn = DriverManager.getConnection(url, user, password);
			System.out.println("���� ����");
			
			String name = "������";
			
//			String sql = "delete from tblMember where name = '������'";
			String sql = "delete from tblMember where name = '" + name + "'";
			Statement st = conn.createStatement();
			
			int succ = st.executeUpdate(sql);
			System.out.println("succ : " + succ);
			
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