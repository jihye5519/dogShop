package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserDAO;

@WebServlet("/user/login")
public class UserLogin extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		PrintWriter script = response.getWriter();
		
		if(userId == null || userId.equals("")) {
			script.println("<script>");	
			script.println("alert('아이디를 입력해주세요.');");
			script.println("history.back()");
			script.println("</script>");
			script.close();
		}
		if(userPwd == null || userPwd.equals("")) {
			script.println("<script>");	
			script.println("alert('패스워드를 입력해주세요.');");
			script.println("history.back()");
			script.println("</script>");
			script.close();
		}
				
		int result = new UserDAO().login(userId, userPwd);
		
		if(result == 1) { 
			script.println("<script>");	
			script.println("alert('로그인 성공');");
			script.println("</script>");
			script.close();
			
			String userIdSession = null;
			HttpSession session = request.getSession(true);		
			if (session.getAttribute("userId") != null){
				userIdSession = (String) session.getAttribute("userId");
			}			
			request.setAttribute("userIdSession", "userIdSession");
			request.getRequestDispatcher("main.jsp").forward(request, response);
		}else if(result == -1) {
			script.println("<script>");	
			script.println("alert('존재하지 않는 회원입니다.');");
			script.println("history.back()");
			script.println("</script>");
			script.close();
		}else if(result == 0) {
			script.println("<script>");	
			script.println("alert('비밀번호가 틀렸습니다');");
			script.println("history.back()");
			script.println("</script>");
			script.close();
		}		
		

	}
}