import java.util.Arrays;

public class Test02_String02 {
	// @�� �������� ���ڿ��� �и��ϰ� �����ϴ� �޼ҵ�(strSplit()) ȣ��
	// ����ϴ� �޼ҵ�(display()) ȣ��
	// ��ǰ ���� ������������ �����ϴ� �޼ҵ�(nameDescSort())
	// ����ϴ� �޼ҵ�(display()) ȣ��
	
	// [������, ����, ��, ����, ������]
	
	// [����, ������, ����, ������, ��]
	public static void main(String[] args) {
		String str = "������@����@��@����@������";
		String[] strs = strSplit(str);
		display(strs);
		nameDescSort(strs);
		display(strs);
	} // main()
	
	// ���ڿ��� �и��ϰ� �����ϴ� �޼ҵ� ����
	public static String[] strSplit(String str) {
		return str.split("@"); 
	} // strSplit()
	
	// ��� �޼ҵ� ����
	public static void display(String[] strs) {
		System.out.println(Arrays.toString(strs));
	} // display()
	
	// ��ǰ���� �������� �����ϴ� �޼ҵ� ����
	public static void nameDescSort(String[] strs) {
		for (int i = 0; i < strs.length; i++) {
			for (int j = i + 1; j < strs.length; j++) {
				if(strs[i].compareTo(strs[j]) < 0) {
					String temp = strs[i];
					strs[i] = strs[j];
					strs[j] = temp;
				} // if
			} // for j
		} // for i
	} // nameDescSort()
} // class