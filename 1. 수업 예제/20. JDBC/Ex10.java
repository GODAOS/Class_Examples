import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Ex10 {
	public static void main(String[] args) {
		// ����(age)�� 30�� �̻��� ȸ���� ��� ���
		// : select ~~ where ~~ �� executeQuery() �� ResultSet
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
			String user = "hanul";
			String password = "0000";
			Connection conn = DriverManager.getConnection(url, user, password);
			System.out.println("���� ����");
			
			// ���� ��ü ���� �� ���ڵ��� ������ �ľ��ϱ� ���� �Ű� ������ �Է�
			Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			
//			String sql = "select * from tblMember where age >= 30";
			int age = 30;
			String sql = "select * from tblMember where age >=" + age;
			
			ResultSet rs = st.executeQuery(sql);
			
			// ResultSet(��� ��ü)�� ���ڵ� ���� ���ϱ�
			rs.last(); // �����͸� ���������� �̵�
			int rowCount = rs.getRow(); // ������ �� ��ȣ�� �����´�
//			System.out.println(rowCount);
			
			/* if�� ���� �� �ϳ��� ����� ���´�.
			if(rs.next() == true) {
				int num = rs.getInt("num");
				String name = rs.getString("name");
				age = rs.getInt("age");
				String addr = rs.getString("addr");
				String tel = rs.getString("tel");
				System.out.println(num + "\t" + name + "\t" + age + "\t" + addr + "\t" + tel);
			} else {
				System.out.println("�˻� ����� �����ϴ�.");
			}
			*/
			if(rowCount > 0) {	// �˻� ����� �ִ�
				rs.beforeFirst(); // �����͸� �� ó�� �������� �̵�
				while(rs.next()) {
					int num = rs.getInt("num");
					String name = rs.getString("name");
					age = rs.getInt("age");
					String addr = rs.getString("addr");
					String tel = rs.getString("tel");
					System.out.println(num + "\t" + name + "\t" + age + "\t" + addr + "\t" + tel);
				} // while
			} else {
				System.out.println("�˻� ����� �����ϴ�.");
			} // if else
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class 