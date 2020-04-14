import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Ex14_PS_ {
	public static void main(String[] args) {
		// ��ü ȸ�� ����� ����Ͻÿ� : select �� executeQuery() �� ResultSet
		// ��, ȸ�� ��ȣ�� ������������ ����Ͻÿ� : order by
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
			String user = "hanul";
			String password = "0000";
			Connection conn = DriverManager.getConnection(url, user, password);
			System.out.println("���� ����");
			
			String sql = "select * from tblMember order by num asc";	// �Ű� ������ ����
			
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				int num = rs.getInt("num");
				String name = rs.getString("name");
				int age = rs.getInt("age");
				String addr = rs.getString("addr");
				String tel = rs.getString("tel");
				System.out.println(num + "\t" + name + "\t" + age + "\t" + addr + "\t" + tel);
			} // while
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class 