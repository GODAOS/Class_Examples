package com.hanul.member;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Scanner;

public class MenuInput {	// ȸ�� ���� ���� ȭ��
	private Scanner scanner;
	public MenuInput (Scanner scanner) {
		this.scanner = scanner;
	}
	
	// ȸ�� ���� �Է� �� ��� ���� ȭ��
	public void insertInput() {
		System.out.println("�ű� ȸ�� ���� ���ȭ���Դϴ�.");
		System.out.print("��ȣ�� �Է��ϼ���> ");
		int num = Integer.parseInt(scanner.nextLine());
		
		// MemberDAO ��ü���� DB�� ������ �� ������ ��ȣ�� �ߺ� �˻縦 ����
		MemberDAO dao = new MemberDAO();
		ResultSet rs = dao.checkNum(num);
		try {
			if(rs.next() == true) { // �˻� ����� �ִ� �� �ߺ��� ��ȣ�� �ִ�.
				System.out.println("�Է��Ͻ� " + num + "�� �ڷ�� �̹� �����մϴ�!");
			} else { // �ߺ��� ��ȣ�� ���� �� �ű� ȸ�� ����� ���� 
				System.out.print("�̸��� �Է��ϼ���> ");
				String name = scanner.nextLine();
				System.out.print("���̸� �Է��ϼ���> ");
				int age = Integer.parseInt(scanner.nextLine());
				System.out.print("�ּҸ� �Է��ϼ���> ");
				String addr = scanner.nextLine();
				System.out.print("��ȭ��ȣ�� �Է��ϼ���> ");
				String tel = scanner.nextLine();
				
//				System.out.println("num : " + num);
//				System.out.println("name : " + name);
//				System.out.println("age : " + age);
//				System.out.println("addr : " + addr);
//				System.out.println("tel : " + tel);
				MemberDTO dto = new MemberDTO(num, name, age, addr, tel);
				int succ = dao.memberInsert(dto);
				if(succ > 0) {
					System.out.println(num + "�� ȸ������ ������ ��ϵǾ����ϴ�.");
				} else {
					System.out.println(num + "�� ȸ������ ������ ��ϵ��� �ʾҽ��ϴ�.");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertInput() Exception!!!");
		}
	} // insertInput()
	
	// ȸ�� ���� �����ϴ� ���� ȭ��
	public void updateInput() {
		System.out.println("ȸ�� ���� ���� ȭ���Դϴ�.");
		System.out.print("������ ȸ�� ��ȣ�� �Է��ϼ���> ");
		int num = Integer.parseInt(scanner.nextLine());
		// MemberDAO ��ü���� DB�� ������ �� ������ ��ȣ�� ������ �˻�
		MemberDAO dao = new MemberDAO();
		ResultSet rs = dao.checkNum(num);
		try {
			if(rs.next() != true) { // rs.next() == false
				System.out.println("�Է��Ͻ� " + num + "�� �ڷ�� �����ϴ�!");
			} else {
				System.out.print(num + "�� ȸ������ ������ �̸��� �Է��ϼ���> ");
				String name = scanner.nextLine();
				System.out.print(num + "�� ȸ������ ������ ���̸� �Է��ϼ���> ");
				int age = Integer.parseInt(scanner.nextLine());
				System.out.print(num + "�� ȸ������ ������ �ּҸ� �Է��ϼ���> ");
				String addr = scanner.nextLine();
				System.out.print(num + "�� ȸ������ ������ ��ȭ��ȣ�� �Է��ϼ���> ");
				String tel = scanner.nextLine();
				
				MemberDTO dto = new MemberDTO(num, name, age, addr, tel);
				int succ = dao.memberUpdate(dto);
				if(succ > 0) {
					System.out.println(num + "�� ȸ������ ������ �����Ǿ����ϴ�.");
				} else {
					System.out.println(num + "�� ȸ������ ������ ������ �����߽��ϴ�.");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateInput() Exception!!!");
		}
	} // updateInput()
	
	// ȸ�� ���� �����ϴ� ���� ȭ��
	public void deleteInput() {
		System.out.println("ȸ�� ���� ���� ȭ���Դϴ�.");
		System.out.print("������ ȸ�� ��ȣ�� �Է��ϼ���> ");
		int num = Integer.parseInt(scanner.nextLine());
		
		// MemberDAO ��ü���� DB�� ������ �� ������ ��ȣ�� ������ �˻�
		MemberDAO dao = new MemberDAO();
		ResultSet rs = dao.checkNum(num);
		try {
			if(rs.next() != true) { // rs.next() == false
				System.out.println("�Է��Ͻ� " + num + "�� �ڷ�� �����ϴ�!");
			} else {
				System.out.print("���� �����Ͻðڽ��ϱ�? (Y/N)> ");
				String isDelete = scanner.nextLine();
				if(isDelete.equalsIgnoreCase("y")) {
					int succ = dao.memberDelete(num);
					if(succ > 0) {
						System.out.println(num + "�� ȸ�� ������ �����Ǿ����ϴ�.");
					} else {
						System.out.println(num + "�� ȸ�� ������ ������ �����߽��ϴ�.");
					}
				} else if(isDelete.equalsIgnoreCase("n")) {
					System.out.println("��ҵǾ����ϴ�.");
				} else {
					System.out.println("�߸� �Է��ϼ̽��ϴ�.");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("deleteInput() Exception!!!");
		}
	} // deleteInput()
	
	// ȸ�� ���� ����ϴ� ���� ȭ��
	public void searchAllInput() {
		System.out.println("ȸ�� ���� ��� ȭ���Դϴ�.");
		MemberDAO dao = new MemberDAO();
		dao.memberSearchAll();
	} // searchAllInput()
	
	// ȸ�� �̸� �˻��ϴ� ���� ȭ��
	public void searchNameInput() {
		System.out.println("ȸ�� �̸� �˻� ȭ���Դϴ�.");
		System.out.print("�˻��� ȸ�� �̸��� �Է��ϼ���> ");
		String searchName = scanner.nextLine();
		
		ArrayList<MemberDTO> list = new ArrayList<>();
		MemberDAO dao = new MemberDAO();
		dao.memberSearchName(list, searchName);
	} // searchNameInput()
	
	// ȸ�� �ּ� �˻��ϴ� ���� ȭ��
	public void searchAddrInput() {
		System.out.println("ȸ�� �ּ� �˻� ȭ���Դϴ�.");
		System.out.print("�˻��� ȸ�� �ּҸ� �Է��ϼ���> ");
		String searchAddr = scanner.nextLine();
		
		ArrayList<MemberDTO> list = new ArrayList<>();
		MemberDAO dao = new MemberDAO();
		dao.memberSearchAddr(list, searchAddr);
	} // searchAddrInput()
	
	// ȸ�� ��ȭ��ȣ �˻��ϴ� ���� ȭ��
	public void searchTelInput() {
		System.out.println("ȸ�� ��ȭ��ȣ �˻� ȭ���Դϴ�.");
		System.out.print("�˻��� ȸ�� �ּҸ� �Է��ϼ���> ");
		String searchTel = scanner.nextLine();
		
		ArrayList<MemberDTO> list = new ArrayList<>();
		MemberDAO dao = new MemberDAO();
		dao.memberSearchTel(list, searchTel);
	} // searchTelInput()
} // class