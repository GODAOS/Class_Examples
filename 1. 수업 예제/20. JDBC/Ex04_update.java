import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Ex04_update {
	public static void main(String[] args) {
		// ��ȣ(num)�� 1���� ȸ��(ȫ�浿)�� ���� (age)�� 31�� ����,
		// ��ȭ ��ȣ(tel)�� 010-9876-1234�� ����
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
			String user = "hanul";
			String password = "0000";
			Connection conn = DriverManager.getConnection(url, user, password);
			System.out.println("���� ����");
			
			Statement st = conn.createStatement();
			
			String sql = "update tblMember set age = 31, tel = '010-9876-1234' "; // �� ������ �� ���ο� �� �� ���⸦ �ݵ�� �����Ѵ�.
			sql += "where num = 1";
			
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