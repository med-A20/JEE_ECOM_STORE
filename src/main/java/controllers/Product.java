package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.google.gson.Gson;

import Models.ProductBusiness;
import beans.FichTech;

/**
 * Servlet implementation class Product
 */
@MultipartConfig
public class Product extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Product() {
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
		String action = request.getParameter("action");
		PrintWriter out = response.getWriter();
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		// get Product
		if(action.equals("getProducts")) {
			ArrayList<beans.Product> products = ProductBusiness.getProducts();
			String productJson = new Gson().toJson(products);
			out.print(productJson);
			out.flush();
		}
		
		
		// create a product
		if(action.equals("create")) {
			// get part
			Part filePart = request.getPart("image");
			
			String imagePath = filePart.getSubmittedFileName();
			
			// create a fich tech
			// FichTech(String os, String display, String cam, String battery, String processor, String memory)
			String os = request.getParameter("os");
			String display = request.getParameter("display");
			String cam = request.getParameter("cam");
			String battery = request.getParameter("battery");
			String processor = request.getParameter("processor");
			String memory = request.getParameter("memory");
			
			FichTech fich = new FichTech(os,  display,  cam,  battery,  processor,  memory);
			// creata product
			String name = request.getParameter("name");
			Float price =  Float.parseFloat(request.getParameter("price"));
			int cat = Integer.parseInt(request.getParameter("cat"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			
			if(ProductBusiness.createProduct(name, 2.5f, price, fich, cat, "images/"+imagePath, quantity)) {
				response.setStatus(200);
				response.sendRedirect("http://localhost:3000");
			}else {
				response.setStatus(300);
				out.print("Error");
			}
			
			
		}
		
		if(action.equals("delete")) {
			int id = Integer.parseInt(request.getParameter("id"));
			
			if(ProductBusiness.deleteProductById(id)) {
				response.setStatus(200);
				response.sendRedirect("http://localhost:3000");
			}else {
				response.setStatus(300);
				out.print("Error");
			}
		}
		
		// update product
		if(action.equals("update")) {
			// get part
			String imagePath = "";
			try {
				Part filePart = request.getPart("image");	
				imagePath = filePart.getSubmittedFileName();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
			
			if(imagePath == null) {
				imagePath = request.getParameter("image");
			}
						
						// create a fich tech
						// FichTech(String os, String display, String cam, String battery, String processor, String memory)
			String os = request.getParameter("os");
			String display = request.getParameter("display");
			String cam = request.getParameter("cam");
			String battery = request.getParameter("battery");
			String processor = request.getParameter("processor");
			String memory = request.getParameter("memory");
						
			FichTech fich = new FichTech(os,  display,  cam,  battery,  processor,  memory);
			// creata product
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			Float price =  Float.parseFloat(request.getParameter("price"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			
			if(ProductBusiness.updateProduct(id, name, price, fich, imagePath, quantity)) {
				response.setStatus(200);
				response.sendRedirect("http://localhost:3000");
			}else{
				response.setStatus(300);
				out.print("Error");
			}
			
		}
		
	}

}
