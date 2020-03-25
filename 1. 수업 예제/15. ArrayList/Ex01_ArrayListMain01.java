import java.util.ArrayList;
import java.util.Arrays;

import com.hanul.array.Ex01_Test;

public class Ex01_ArrayListMain01 {
	public static void main(String[] args) {
		// 3���� ũ��(����)�� ���� ������ �迭(arr[])�� ���� �� �����Ͻÿ�.
		int[] arr = new int[3];
		
		// �迭(arr[])�� 10, 20, 30�� �Ҵ��Ͻÿ�.
		arr[0] = 10;
		arr[1] = 20;
		arr[2] = 30;
		for (int i = 0; i < arr.length; i++) {
			arr[i] = (i + 1) * 10;
		}
		
		// �迭(arr[])�� ������ ����Ͻÿ�.
		for (int i = 0; i < arr.length; i++) {
			System.out.println("arr[" + i + "]�� �� : " + arr[i]);
		}
		System.out.println("arr[]�� ���� : " + Arrays.toString(arr));
		
		System.out.println("================================");
		
		// Ex01_Test.java Ÿ�� 5���� ������ �� �ִ� �迭 ���� : com.hanul.array package
		Ex01_Test[] test = new Ex01_Test[5];	// �迭 ���� : ũ��(����) ����
		for (int i = 0; i < test.length; i++) {
			test[i] = new Ex01_Test();
		}
		for (int i = 0; i < test.length; i++) {
			test[i].display();
		}
		System.out.println("================================");
		
		// ���̿� ������ ���� ���� �迭�� ���� �� ArrayList<>
		ArrayList<Object> list = new ArrayList<Object>();
		list.add(new Ex01_Test());		// add() : ����(�߰�)
		list.add(new Ex01_Test());
		list.add(new Ex01_Test());
		list.add(new Ex01_Test());
		list.add(new Ex01_Test());
		
		for (int i = 0; i < list.size(); i++) {	// size() : ArrayList<>�� ũ��(����)
			((Ex01_Test)(list.get(i))).display();	// get() : ���(�����´�)
		}
		
//		System.out.println(Arrays.toString(list));
	} // main()
} // class

/*
�� Array[] : �迭
	- ������(index)���� � �ڷḦ �����Ѵ�.
	- �ڷ��� Ÿ���� �����ؾ� �Ѵ�.
	- �迭�� ũ��(����)�� ���� �����ؾ� �Ѵ�.
	- �迭 ���� �� ��üȭ(��ü����)�Ǿ�� �Ѵ�. �� new int[3];
	- �߿��� �޼��� : length �� ũ��(����)

�� ArrayList<> : ���� �迭
	- ������(index)���� � �ڷḦ �����Ѵ�.
	- �ڷ��� Ÿ���� �޶� �ȴ�(��, Ŭ���� Ÿ�Ը� ����)
	- �迭�� ũ��(����)�� �������� �ʴ´� : ���� ����
	- �迭 ���� �� ��üȭ(��ü����)�Ǿ�� �Ѵ� �� new ArrayList<>();
	- �߿��� �޼��� : size() �� ũ��, add() �� ����, get() �� ���, set() �� ����, remove() �� ����
*/