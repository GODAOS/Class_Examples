import java.sql.Connection;
import java.sql.DriverManager;

public class SingleConn {	// SingleTon Class : Ư�� ���� �ϳ��� �����ϴ� Ŭ����
	// ���� ��ü ����
	private static Connection conn;
	
	// �ʱ�ȭ ��(static ��) : ���� ���� �޸𸮿� �ε� �� ����
	static {
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		String user = "hanul";
		String password = "0000";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB Connection Exception!!!");
		}
	}

	//getConn() ����
	public static Connection getConn() {
		return conn;
	}
} // class