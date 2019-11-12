package user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.model.exception.RegisterFailException;
import user.model.service.UserServiceImpl;
import user.model.vo.UserInfo;

/**
 * Servlet implementation class registerUserServlet
 */
@WebServlet("/registerUserServlet")
public class registerUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registerUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("email1")+request.getParameter("email2");
		String userPwd = request.getParameter("userPwd1");
		String userName = request.getParameter("userName");
		String minihomeCode = request.getParameter("email1");
		
		UserInfo user = new UserInfo();
		user.setUserId(userId);
		user.setUserPwd(userPwd);
		user.setUserName(userName);
		user.setMinihomeCode(minihomeCode);
		try {
			int result = new UserServiceImpl().registerUser(user);
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			request.getRequestDispatcher("/views/common/mainPage.jsp").forward(request, response);
		} catch (RegisterFailException e) {
			request.setAttribute("message", e.getMessage());
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
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
