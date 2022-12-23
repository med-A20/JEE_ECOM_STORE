package controllers;

import java.io.IOException;

import javax.security.auth.message.callback.SecretKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Models.UserBusiness;

/**
 * Servlet implementation class registerUser
 */
public class registerUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registerUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		if(UserBusiness.SignUp(firstName, lastName, email, password)) {
			RequestDispatcher rd = request.getRequestDispatcher("/");
			rd.forward(request, response);
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("error", "error");
			RequestDispatcher rd = request.getRequestDispatcher(request.getContextPath()+"/SignUp.jsp");
			rd.forward(request, response);
		}
		doGet(request, response);
	}

}
