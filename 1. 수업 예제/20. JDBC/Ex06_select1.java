import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Ex06_select1 {
	public static void main(String[] args) {
		// ��ȣ�� 1���� ȸ���� ������ ����Ͻÿ� : ���� �˻�(select ~~ where ~~)
		// Ư�� ���ڵ常 ����ϰ��� �� ��쿡�� if���� ����Ѵ�.
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
			String user = "hanul";
			String password = "0000";
			Connection conn = DriverManager.getConnection(url, user, password);
			System.out.println("���� ����");
			
			Statement st = conn.createStatement();
			String sql = "select * from tblMember where num = 1";
			ResultSet rs = st.executeQuery(sql);
			
			if(rs.next() == true) {
				int num = rs.getInt("num");
				String name = rs.getString("name");
				int age = rs.getInt("age");
				String addr = rs.getString("addr");
				String tel = rs.getString("tel");
				System.out.println(num + "\t" + name + "\t" + age + "\t" + addr + "\t" + tel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class