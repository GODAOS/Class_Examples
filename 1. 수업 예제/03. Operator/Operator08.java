public class Operator08 {
	public static void main(String[] args) {
		// ���α׷����� ���Ǵ� Ư����ȣ����(Escape Sequence) : ��¹��� ���� ���
		// ��������(\)�� ���� �Է��ϰ� ����Ѵ�.
		System.out.println("1. HelloWorld");
		System.out.println("2. Hello" + "\t" + "World"); // \t : �� ����(8ĭ ����)
		System.out.println("3. Hello\tWorld"); // ���ڿ� ó�� : ��¹� �ȿ� �����ؼ� ��� ����
		System.out.println("4. Hello" + "\n" + "World"); // \n : �ٹٲ�
		System.out.println("5. Hello" + "\b" + "World"); // \b ; �齺������
		System.out.println("6. Hello" + "\r" + "World"); // \r : Carriage Return (���� ó������ Ŀ���� �̵� ��Ų��.
		System.out.println("7. Hello" + "\'" + "World"); // \' : ��������ǥ�� ǥ��
		System.out.println("8. Hello" + "\"" + "World"); // \" : �ε���ǥ�� ǥ��
		System.out.println("9. Hello" + "\\" + "World"); // \\ : \(��������) ǥ��
		
		System.out.println("��ȣ" + "\t" + "�̸�" + "\t" + "�ּ�");
		System.out.println("001" + "\t" + "ȫ�浿" + "\t" + "���ֽ� ���� �󼺵�");
		System.out.println("1234" + "\t" + "�达" + "\t" + "����?");
		System.out.println("12345\t�ڹ���\t���ֽ� ���� �濭��\n");
		System.out.println("1\t�������\t����� �߱� ��ȭ����.");
	} // main()
} // class