package com.hanul.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	private Connection conn;		//����
	private PreparedStatement ps;	//����
	private ResultSet rs;			//���
	
	// MemberDAO ��ü ������ �� DB ����
	public MemberDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
			String user = "hanul";
			String password = "0000";
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB���� Exception!!!");
		}
	}
	
	// ��ȣ �˻� �޼���
	public ResultSet checkNum(int num) {
		try {
			String sql = "select * from tblMember where num = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("checkNum");
		}
		return rs;
	} // checkNum()
	
		// ȸ�� ���� ���� �޼���
		public int memberInsert(MemberDTO dto) {
			int succ = 0;
			try {
				String sql = "insert into tblMember values(?, ?, ?, ?, ?)";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, dto.getNum());
				ps.setString(2, dto.getName());
				ps.setInt(3, dto.getAge());
				ps.setString(4, dto.getAddr());
				ps.setString(5, dto.getTel());
				succ = ps.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return succ;
		} // memberInsert
		
		// ȸ�� ���� ����
		public int memberDelete(int num) {
			int succ = 0;
			try {
				String sql = "delete from tblMember where num = ?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, num);
				succ = ps.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return succ;
		} // memberDelete
		
		// ȸ�� ���� ����
		public int memberUpdate(MemberDTO dto) {
			int succ = 0;
			try {
				String sql = "update tblMember set name = ?, age = ?, addr = ?, tel = ? where num = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, dto.getName());
				ps.setInt(2, dto.getAge());
				ps.setString(3, dto.getAddr());
				ps.setString(4, dto.getTel());
				ps.setInt(5, dto.getNum());
				succ = ps.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return succ;
		} // memberUpdate()
		
		// DB Close
		public void dbClose() {
			try {
				if(rs != null) {
					rs.close();
				}
				
				if(ps != null) {
					ps.close();
				}
				
				if(conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} // dbClose()
} // class