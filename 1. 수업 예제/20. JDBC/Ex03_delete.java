import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Ex03_delete {
	public static void main(String[] args) {
		// ��ȣ(num)�� 5���� ȸ��(������)�� �����Ͻÿ�. : delete
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
			String user = "hanul";
			String password = "0000";
			Connection conn = DriverManager.getConnection(url, user, password);
			System.out.println("���� ����");
			
			Statement st = conn.createStatement();
			
			String sql = "delete from tblMember where num = 5";
			
			int succ = st.executeUpdate(sql);
			System.out.println("succ : " + succ);
			
			if(succ > 0) {
				System.out.println("���� ����");
			} else {
				System.out.println("���� ����"); // ���޾� �����Ѵٸ�, ������ �����Ͱ� ���� ������ ���� ���а� ���´�.
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class