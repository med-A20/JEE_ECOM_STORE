package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Models.UserBusiness;
import beans.User;

/**
 * Servlet implementation class userLogin
 */
public class userLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String logout = request.getParameter("logout");
		HttpSession sess = request.getSession();
		if(logout.equals("true")) {
			sess.removeAttribute("loged");
			response.sendRedirect(request.getContextPath());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession sess = request.getSession();
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			User user = UserBusiness.SignIn(email, password);
			if(user != null) {
				sess.setAttribute("loged", email);
				sess.setAttribute("user", user);
				response.sendRedirect(request.getContextPath());
				
			}else {
				sess.setAttribute("logError",true);
				RequestDispatcher req = request.getRequestDispatcher("/");
				req.forward(request, response);
			}
		
	}

}
