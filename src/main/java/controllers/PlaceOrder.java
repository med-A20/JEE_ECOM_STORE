package controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.connecteToDb;

/**
 * Servlet implementation class PlaceOrder
 */
public class PlaceOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		Float total = Float.parseFloat(request.getParameter("total"));
		String userEmail = request.getParameter("email");
		String itemsDesc = request.getParameter("desc");
		
		Connection con = connecteToDb.getConnection();
		try {
			PreparedStatement pr = con.prepareStatement("INSERT INTO command values (?, ?, ?, ?)");
			pr.setInt(1, orderId);
			pr.setFloat(2, total);
			pr.setString(3, userEmail);
			pr.setString(4, itemsDesc);
			
			int rs = pr.executeUpdate();
			if(rs != 0) {
				response.sendRedirect(request.getContextPath()+"/secc.jsp");
			}else {
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
