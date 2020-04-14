import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Ex13_PS_update {
	public static void main(String[] args) {
		// ��ȣ(num)�� 1���� ȸ��(ȫ�浿)�� ����(age)�� 31�� ����,
		// ��ȭ��ȣ(tel)�� 010-1111-1111�� ����
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
			String user = "hanul";
			String password = "0000";
			Connection conn = DriverManager.getConnection(url, user, password);
			System.out.println("���� ����");
			
			String sql = "update tblMember set age = ?, tel = ? where num = ?";
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, 31);	// ����ǥ ���� ��ȣ�� �տ� ���� �Է��� ���� �ڿ� �´�.
			ps.setString(2, "010-9876-1234");
			ps.setInt(3, 1);
			
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