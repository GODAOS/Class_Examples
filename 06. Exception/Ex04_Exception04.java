public class Ex04_Exception04 {
	public static void main(String[] args) {
		// 1���� 100������ ������(sum)�� ���Ͻÿ�.
		// ��, �������� 777 �̻��� �Ǹ�, �ݺ��� ����(break)�ϰ� �׶������� ��� ���� ���
		int sum = 0, cnt = 0;
		for(int i = 1; i < 101; i++) {
			sum += i;
			cnt++;
			if(sum >= 777) {
				System.out.println("���� ���� 777 �̻��� �Ǿ����ϴ�!");
				break;
			} // if
		} // for
		System.out.println(sum);
		System.out.println(cnt);
		
		//��, try ~~ catch ����� �̿��Ͽ� ����ó�� �Ͻÿ� : throw
		sum = 0;
		cnt = 0;
		try {
			for(int i = 1; i < 101; i++) {
				sum += i;
				cnt++;
				if(sum >= 777) {
					throw new Exception("���� ���� 777 �̻��� �Ǿ����ϴ�!");
					// ���ܸ� ������ �߻����� catch ������� ����
				} // if
			} // for
		} catch (Exception e) {
//			e.printStackTrace();
			System.out.println(e.getMessage());
		} // try
		System.out.println(sum);
		System.out.println(cnt);
	} // main()
} // class

// throw : ������ ���ܸ� �߻���Ų�� �� catch ������ ���Ǹ� ������ ���, �� �Ⱦ���