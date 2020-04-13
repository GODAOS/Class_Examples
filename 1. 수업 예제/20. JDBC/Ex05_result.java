import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Ex05_result {
	public static void main(String[] args) {
		// ��ü ȸ���� ����� �˻� : Select �� executeQuery() �� ResultSet(��� ��ü)
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
			String user = "hanul";
			String password = "0000";
			Connection conn = DriverManager.getConnection(url, user, password);
			System.out.println("���� ����");
			Statement st = conn.createStatement();
			String sql = "select * from tblMember";
			
			// Statement ��ü�� SQL ������ ���� �� ResultSet ��ü
			ResultSet rs = st.executeQuery(sql); // Statement ��ü�� SQL ������ ���� , select�� ��⶧���� executeQuery�� ���
			
			while(rs.next()) {		// next() : ��� ��ü�� ����Ű�� �����Ͱ� ������ true
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