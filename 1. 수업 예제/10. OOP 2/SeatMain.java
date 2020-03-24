import com.hanul.seat.SeatDAO;
import com.hanul.seat.SeatDTO;

public class SeatMain {
/*
 - ��� ���� ����
 ���(1 ~ 8)	����		�̸�	
 int		char		String	
 */
	public static void main(String[] args) {
		// ���������� �迭�� �����ϰ� �ʱ�ȭ
		SeatDTO[] seat = new SeatDTO[16];
		seat[0] = new SeatDTO(1, 'M', "�л�1");
		seat[1] = new SeatDTO(1, 'F', "�л�2");
		seat[2] = new SeatDTO(1, 'F', "�л�3");
		
		seat[3] = new SeatDTO(2, 'F', "�л�4");
		
		seat[4] = new SeatDTO(3, 'F', "�л�5");
		seat[5] = new SeatDTO(3, 'M', "�л�6");
		seat[6] = new SeatDTO(3, 'F', "�л�7");
		
		seat[7] = new SeatDTO(4, 'M', "�л�8");
		seat[8] = new SeatDTO(4, 'M', "�л�9");
				
		seat[9] = new SeatDTO(5, 'F', "�л�10");
		seat[10] = new SeatDTO(5, 'F', "�л�11");
		
		seat[11] = new SeatDTO(6, 'M', "�л�12");
		seat[12] = new SeatDTO(6, 'M', "�л�13");
		
		seat[13] = new SeatDTO(7, 'M', "�л�14");
		seat[14] = new SeatDTO(7, 'M', "�л�15");
		
		seat[15] = new SeatDTO(8, 'M', "�л�16");
		
		// DAO�� �޼ҵ� ȣ��
		// ���� ��ҿ� ���� ����鳢���� ���� ���̺� ��ġ �ȵ�
		// ��������, �������� ���� �� �ȵ�
		SeatDAO dao = new SeatDAO(seat);
		dao.divStudent();
		dao.display();
	} // main()
} // class