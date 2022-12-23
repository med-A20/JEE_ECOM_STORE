package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Models.ProductBusiness;
import beans.Product;
import beans.ShoppingCart;

/**
 * Servlet implementation class addToCart
 */
public class addToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addToCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		
		// get Product
		Product pro = ProductBusiness.getProductById(id);
		
		// GET session
		HttpSession session = request.getSession();
	
		// get cart Object
		ShoppingCart cartSess = (ShoppingCart) session.getAttribute("panier");
		
		if (cartSess == null) {
			ShoppingCart cart = new ShoppingCart();
			cart.addItem(pro);
			session.setAttribute("panier", cart);
		} else {
			boolean index = cartSess.getProducts().contains(pro);
			if (!index) {
				cartSess.addItem(pro);
				System.out.println(cartSess.getTotalPrice());
			} else {
				System.out.println(cartSess.getTotalPrice());
			}
			session.setAttribute("panier", cartSess);
		}
		
		response.sendRedirect(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
