import com.hanul.study.FinalTestDAO;

public class Test16_FinalTestMain {
	// �� �䱸���� �� ��� ����
	// ���� ó�� �� �л� ���� �Է��ϼ��� : x
	
	// n�� �л��� �̸��� �Է��ϼ��� : xxx
	
	// n�� �л��� ���� ������ �Է��ϼ��� : xx
	// ���� ������ �Է� ������ 0~ 100���� �Դϴ�!
	// n�� �л��� ���� ������ �Է��ϼ��� : xx
	
	// n�� �л��� ���� ������ �Է��ϼ��� : xx
	// ���� ������ �Է� ������ 0 ~ 100���� �Դϴ�!
	// n�� �л��� ���� ������ �Է��ϼ��� : xx

	// n�� �л��� ���� ������ �Է��ϼ��� : xx
	// ���� ������ �Է� ������ 0 ~ 100���� �Դϴ�!
	// n�� �л��� ���� ������ �Է��ϼ��� : xx
	
	// �Է��� �Ϸ��Ͽ����ϴ�!
	// ��ȣ	�̸�	����	���� 	����
	//	1	xxx	xx	xx	xx
	//	2	xxx	xx	xx	xx
	//	3	xxx	xx	xx	xx
	// ====================> SungjukInput.txt ����
	
	// SungjukInput.txt ������ ������ ���� ������ ���� ��
	// ������ ����� ���ϰ� ����� ������������ ���� ��
	// SungjukOutput.txt ����
	// ��ȣ	�̸�	����	���� 	����	����	���
	//	x	xxx	xx	xx	xx	xxx	xx.x
	//	x	xxx	xx	xx	xx	xxx	xx.x
	//	x	xxx	xx	xx	xx	xxx	xx.x
	// =============================
	// FinalTestMain.java	�� default package
	// FinalTestDTO.java	�� com.hanul.study package
	// FinalTestDAO.java	�� com.hanul.study package
	public static void main(String[] args) {
		FinalTestDAO dao = new FinalTestDAO();
		dao.getScore();
		dao.inputSave();
		dao.readFile();
		dao.getSumAvg();
		dao.AvgDescSort();
		dao.outputSave();
	} // main()
} // class