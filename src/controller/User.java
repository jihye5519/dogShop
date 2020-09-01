//package controller;
//
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import model.userDTO;
//import util.DatabaseUtil;
//
//@WebServlet("/user/login")
//public class User extends HttpServlet {
//
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		reqPro(request, response);
//	}
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		reqPro(request, response);
//	}
//
//	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//
//		request.setCharacterEncoding("UTF-8");
//		
//		userDTO bean = new userDTO();
//		
//		bean.setId(request.getParameter("id"));
//		String pass1 = (request.getParameter("pass1"));
//		String pass2 =(request.getParameter("pass2"));
//		bean.setPass1(pass1);
//		bean.setPass2(pass2);
//		bean.setEmail(request.getParameter("email"));
//		bean.setTel(request.getParameter("tel"));
//		String [] arry = request.getParameterValues("hobby");
//		String data= "";
//		for (String string : arry) {
//				data += string+" "; //�ϳ��� ��Ʈ������ ������ ����
//		}
//		bean.setHobby(data);
//		bean.setJob(request.getParameter("job"));
//		bean.setAge(request.getParameter("age"));
//		bean.setInfo(request.getParameter("info"));
//				
//
//		if(pass1.equals(pass2)) {
//
//			MemberDAO mdao = new MemberDAO();
//			mdao.insertMember(bean);
//			
//	
//			RequestDispatcher dis = request.getRequestDispatcher("MemberlistCon.do");		
//			dis.forward(request, response);
//
//			
//		}else {
//			request.setAttribute("msg", "�н����尡 ��ġ���� �ʽ��ϴ�.");
//			RequestDispatcher dis = request.getRequestDispatcher("LoginError.jsp");		
//			dis.forward(request, response);
//		}
//		
//		
//		
//		
//	}
//	
//	@Override
//	//protected void doPost(HttpServletRequest request, HttpServletResponse resonse) throws ServletException, IOException {
//		public int login(String userID, String userPassword) {
//			String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
//			Connection conn = null;		
//			PreparedStatement pstmt = null;
//			ResultSet rs = null;
//			
//			try {
//				conn = DatabaseUtil.getConnection();
//				pstmt = conn.prepareStatement(SQL);
//				pstmt.setString(1, userID);
//				rs =pstmt.executeQuery();
//				if(rs.next()) {
//					if(rs.getString(1).equals(userPassword)) {
//						return 1; //로그인성공
//					} else {
//						return 0; //비밀번호 틀림
//					}
//				}
//				return -1; //아이디 없음
//			}catch(Exception e) {
//				e.printStackTrace();
//			}finally {
//				try{	if(conn != null ) conn.close();	}catch (Exception e){ e.printStackTrace();	}
//				try{	if(pstmt != null ) pstmt.close();	}catch (Exception e){ e.printStackTrace();	}
//				try{	if(rs != null ) rs.close();	}catch (Exception e){ e.printStackTrace();	}
//				
//			}
//			return -2; //데이터베이스 오류
//		
//			//forward
//			request.getRequestDispatcher("/notice/detail.jsp").forward(request, response);
//	}
//}
