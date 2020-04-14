import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

// �� PreparedStatement ��ü�� Ȱ�� 
// �� JDBC Driver ���� �ε� : opjdbc6.jar
// �� JDBC API import �� �ڵ� ����


public class Ex11_PreparedStatement {
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
			
			// �� SQL ���� �ۼ�
			String sql = "insert into tblMember values(?, ?, ?, ?, ?)";
			
			// �� PreparedStatement ��ü ����
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, 5);
			ps.setString(2, "������");
			ps.setInt(3, 40);
			ps.setString(4, "����� ������ û�㵿");
			ps.setString(5, "010-5555-5555");
			
			// �� PreparedStatement ��ü ����(����)
			int succ = ps.executeUpdate();
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