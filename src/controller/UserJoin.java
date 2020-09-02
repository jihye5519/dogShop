package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import model.UserDAO;
import model.UserDTO;
import util.DatabaseUtil;

@WebServlet("/user/join")
public class UserJoin extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			
			String userType = request.getParameter("userType");
			String userNo = request.getParameter("userNo");
			String userId = request.getParameter("userId");
			String userPwd1 = request.getParameter("userPwd1");
			String userPwd2 = request.getParameter("userPwd2");
			String userNm = request.getParameter("userNm");
			String contact1 = request.getParameter("contact1");
			String contact = request.getParameter("contact");
			String email = request.getParameter("email");
			String gender = request.getParameter("gender");
			String birthDt = request.getParameter("birthDt");
			
			if(userType == null || userType.equals("") || userNo == null || userNo.equals("") || userId == null || userId.equals("")|| userPwd1 == null || userPwd1.equals("")||
					userPwd2 == null || userPwd2.equals("") || userNm == null || userNm.equals("")|| contact == null || contact.equals("")||contact1 == null || contact1.equals("")|| email == null || email.equals("")||
					gender == null || gender.equals("")|| birthDt == null || birthDt.equals("")) {
				request.getSession().setAttribute("messageType", "오류 메세지");
				request.getSession().setAttribute("messageContent", "모든 내용을 입력하세요");
				response.sendRedirect("/join.jsp");				
			}
			if(!userPwd1.equals(userPwd2)) {
				request.getSession().setAttribute("messageType", "오류 메세지");
				request.getSession().setAttribute("messageContent", "비밀번호가 서로 일치하지 않습니다.");
				response.sendRedirect("/join.jsp");			
			}
			int result = new UserDAO().join(userType, userNo, userId, userPwd1, birthDt, gender, email, contact1, contact, userNm);
			if(result == 1) {
				request.getSession().setAttribute("messageType", "성공 메세지");
				request.getSession().setAttribute("messageContent", "회원가입이 완료되었습니다.");
				response.sendRedirect("../main.jsp");						
			}else {
				request.getSession().setAttribute("messageType", "오류 메세지");
				request.getSession().setAttribute("messageContent", "이미 존재하는 회원입니다.");
				response.sendRedirect("../main.jsp");				
			}			
	}
}




