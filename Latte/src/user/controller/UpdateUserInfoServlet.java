package user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.model.exception.UpdateUserInfoFailException;
import user.model.service.UserServiceImpl;
import user.model.vo.UserInfo;

/**
 * Servlet implementation class UpdateUserInfoServlet
 */
@WebServlet("/UpdateUserInfoServlet")
public class UpdateUserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserInfo user = new UserInfo();
		String userId = request.getParameter("userId");
		user.setUserId(userId);
		String userName = request.getParameter("userName");
		user.setUserName(userName);
		String userPwd = request.getParameter("userPwd1");
		user.setUserPwd(userPwd);
		
		try {
			new UserServiceImpl().updateUserInfo(user);
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			request.getRequestDispatcher("/views/common/mainPage.jsp").forward(request, response);
		} catch (UpdateUserInfoFailException e) {			
			PrintWriter out = response.getWriter();
			out.println("<script> alert('"+e.getMessage()+"'); location.href='/views/common/mainPage.jsp'; </script>");
			out.flush();
			out.close();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
