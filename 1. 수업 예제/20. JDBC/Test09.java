import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Test09 {
	public static void main(String[] args) {
		// ��ȣ(num)�� 1���� ȸ��(ȫ�浿)�� ����(age)�� 29�� ����,
		// ��ȭ��ȣ(tel)�� 010-1111-1111�� ����
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
			String user = "hanul";
			String password = "0000";
			Connection conn = DriverManager.getConnection(url, user, password);
			System.out.println("���� ����");
			
			Statement st = conn.createStatement();
			
			int num = 1;
			int age = 29;
			String tel = "010-1111-1111";
			
//			String sql = "update tblMember set age = 29, tel = '010-1111-1111' where num = 1";
			String sql = "update tblMember set age = " + age + " , tel = '" + tel + "' where num = " + num;
					
			int succ = st.executeUpdate(sql);
			if (succ > 0) {
				System.out.println("���� ����");
			} else {
				System.out.println("���� ����");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class