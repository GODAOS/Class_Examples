import java.text.DecimalFormat;

public class Ex02_Student {
	// ������� ����
	String name;
	int kor, eng, mat, sum;
	float avg;
	
	// ������ ����ϴ� ����޼ҵ� ����
	public void getSum() {
		sum = kor + eng + mat;
		
	} // getSum()
	
	// ����� ����ϴ� ����޼ҵ� ����
	public void getavg() {
		avg = (float) sum / 3;
	} // getAvg()
	
	// ����� ����ϴ� ����޼ҵ� ����
	public void display() {
		System.out.println("�̸� : " + name);
		System.out.println("���� : " + kor);
		System.out.println("���� : " + eng);
		System.out.println("���� : " + mat);
		System.out.println("���� : " + sum);
		DecimalFormat df = new DecimalFormat("0.00");
		System.out.println("��� : " + df.format(avg));
		System.out.println("===========");
	} // display()
} // class