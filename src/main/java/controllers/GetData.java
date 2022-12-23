package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Models.ProductBusiness;
import beans.Product;

/**
 * Servlet implementation class GetData
 */
public class GetData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetData() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Product pro = ProductBusiness.getProductById(5);
		String employeeJsonString = new Gson().toJson(pro);
		
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		Float rate = Float.parseFloat(request.getParameter("rate"));
		Float price = Float.parseFloat(request.getParameter("price"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
		if(ProductBusiness.createProduct(name, rate, price, 7, 1, quantity)) {
			response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
		    response.setStatus(200);
		    response.getWriter().write("added");
		}else {
			response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
		    response.setStatus(301);
		    response.getWriter().write("not added");
			
		}
		
	}

}
