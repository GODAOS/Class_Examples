import com.hanul.poly03.Ex03_Radio;
import com.hanul.poly03.Ex03_RemoCon;
import com.hanul.poly03.Ex03_TV;

public class Ex03_Poly03Main01 {
	//RemoCon Interface�� TV, Radio �Ҹ��� �ø��� ���� �� ���ͳ� ����
	public static void main(String[] args) {
		// �� UpCasting
		Ex03_RemoCon remoCon = new Ex03_TV();
		remoCon.volUp();
		remoCon.volDown();
		remoCon.internet();
		
		remoCon = new Ex03_Radio();
		remoCon.volUp();
		remoCon.volDown();
		remoCon.internet();
		
		System.out.println("===============================");
		
		Ex03_TV tv = new Ex03_TV();
		Ex03_Radio radio = new Ex03_Radio();
		
		// �� ������ �μ�
		play(tv);
		play(radio);
		
		System.out.println("===============================");

		// �� ������ �迭
		Ex03_RemoCon[] remoCons = {tv, radio};
		for (int i = 0; i < remoCons.length; i++) {
			remoCons[i].volUp();
			remoCons[i].volDown();
			remoCons[i].internet();
		}
	} // main()

	public static void play(Ex03_RemoCon remoCon) {
		remoCon.volUp();
		remoCon.volDown();
		remoCon.internet();
	} // play()
} // class