package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import util.DatabaseUtil;

public class UserDAO {

	public int login(String userId, String userPwd) {
	
		String SQL = "SELECT USER_PWD FROM EMP_SHOP WHERE USER_ID=?";
		Connection conn = null;		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userId);
			rs =pstmt.executeQuery();		
			System.out.println(SQL);		
			if(rs.next()) {
				if(rs.getString(1).equals(userPwd)) {
					return 1; //로그인성공
				} else {
					return 0; //비밀번호 틀림
				}
			}
			return -1; //아이디 없음
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{	if(conn != null ) conn.close();	}catch (Exception e){ e.printStackTrace();	}
			try{	if(pstmt != null ) pstmt.close();	}catch (Exception e){ e.printStackTrace();	}
			try{	if(rs != null ) rs.close();	}catch (Exception e){ e.printStackTrace();	}
			
		}
		return -2; //데이터베이스 오류
	}
	
	public int registerCheck(String userId) {

		Connection conn = null;		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "SELECT * FROM EMP_SHOP WHERE USER_ID='"+userId+"'";	
		
		try {
			pstmt = conn.prepareStatement(SQL);
//			pstmt.setString(1, userId);
			rs = pstmt.executeQuery(); 
			System.out.println(SQL);
			if(rs.next()) {
				System.out.println("가입노노!!");
				return 0; //이미 존재하는 회원
			}else {
				System.out.println("가입가능!!");
				return 1; //가입 가능한 회원
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{	if(conn != null ) conn.close();	}catch (Exception e){ e.printStackTrace();	}
			try{	if(pstmt != null ) pstmt.close();	}catch (Exception e){ e.printStackTrace();	}
			try{	if(rs != null ) rs.close();	}catch (Exception e){ e.printStackTrace();	}
			
		}
		return -1; //db 오류
	}
	
	//회원가입
	public int join(String userType, String userNo, String userId, String userPwd1, String birthDt, String gender, String email, String contact1, String contact, String userNm) {
		Connection conn = null;		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "INSERT INTO EMP_SHOP VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, null, ?)";		
		
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
//		DATE date = new DATE();
		Date date = new Date();
		String time = format.format(date);
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userType);
			pstmt.setString(2, userNo);
			pstmt.setString(3, userId);
			pstmt.setString(4, userPwd1);
			pstmt.setString(5, birthDt);
			pstmt.setString(6, gender);
			pstmt.setString(7, email);
			pstmt.setString(8, contact1+contact);
			pstmt.setString(9, time); //가입날짜
			pstmt.setString(10, userNm);
			
			return pstmt.executeUpdate(); 
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{	if(conn != null ) conn.close();	}catch (Exception e){ e.printStackTrace();	}
			try{	if(pstmt != null ) pstmt.close();	}catch (Exception e){ e.printStackTrace();	}
			try{	if(rs != null ) rs.close();	}catch (Exception e){ e.printStackTrace();	}
			
		}
		return -1;  //회원가입 실패
	}
}
