import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class Ex15 {
	// ��������� ��������(����)�� ��ȣȭ�Ͽ� game.data ���Ͽ� ����
	// ��ȣȭ : �⺻ ������ Ÿ��, String Ÿ���� ������ byte ���� �ڷ�� ��ȯ
	public static void main(String[] args) {
		try {
			String id = "hanul";
			String user = "�ѿ�";
			int level = 5;
			int money = 123450;
			double score = 4567.89;
			
			FileOutputStream fos = new FileOutputStream("game.data");
			DataOutputStream dos = new DataOutputStream(fos);
			
			dos.writeUTF(id);
			dos.writeUTF(user);
			dos.writeInt(level);
			dos.writeInt(money);
			dos.writeDouble(score);
			
			dos.close();
			fos.close();
			System.out.println("game.data ������ �����Ǿ����ϴ�.");
			
			FileInputStream fis = new FileInputStream("game.data");
			DataInputStream dis = new DataInputStream(fis);
			
			String i = dis.readUTF();
			String u = dis.readUTF();
			int l = dis.readInt();
			int m = dis.readInt();
			double s = dis.readDouble();
			
			dis.close();
			fis.close();
			
			System.out.println("id : " + i);
			System.out.println("user : " + u);
			System.out.println("level : " + l);
			System.out.println("money : " + m);
			System.out.println("score : " + s);
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class