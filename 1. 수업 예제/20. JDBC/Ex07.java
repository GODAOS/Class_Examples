import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Ex07 {
	public static void main(String[] args) {
		// JAVA���� �Է� ������ �̿��� JDBC Ȱ��
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
			String user = "hanul";
			String password = "0000";
			Connection conn = DriverManager.getConnection(url, user, password);
			System.out.println("���� ����");
			
			Statement st = conn.createStatement();
			
			int num = 5;
			String name = "������";
			int age = 40;
			String addr = "����� ������ û�㵿";
			String tel = "010-5555-5555";
			
//			String sql = "insert into tblMember values";
//			sql += "(5, '������', 40, '����� ������ û�㵿', '010-5555-5555')";
			
//			String sql = "insert into tblMember values"; 
//			sql += "(num, 'name', age, 'addr', 'tel')"; // ���� ���� ���ڿ��� �νĵǼ� ���� �߻�
			
			String sql = "insert into tblMember values";
			sql += "("+num+", '"+name+"', "+age+", '"+addr+"', '"+tel+"')"; // ���� �� �տ� "+, �ڿ� +" �����ش�.
			int succ = st.executeUpdate(sql);
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