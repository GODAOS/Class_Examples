import java.util.Arrays;
import java.util.Random;

public class LottoGame {
	public static void main(String[] args) {
		Random random = new Random();	// ���� ��ü ����
		int[] lotto = new int[6];		// ��ȣ�� ����� �迭 ����
		
		for (int i = 0; i < lotto.length; i++) {
			lotto[i] = random.nextInt(45) + 1;	// 1 ~ 45 ���� ���� ��ȣ�� �Ҵ�
			for (int j = 0; j < i; j++) {		// ��ȣ �ߺ� �˻�
				if (lotto[i] == lotto[j]) {
					i = i - 1; // i -= 1;
					break;
				} // if
			} // for j
		} // for i
		
		Arrays.sort(lotto);
//		System.out.println(Arrays.toString(lotto));
		for (int i = 0; i < lotto.length; i++) {
			if (lotto[i] < 10) {
				System.out.print("0" + lotto[i] + "\t");
			} else {
				System.out.print(lotto[i] + "\t");
			}
		}
	} // main()
} // class