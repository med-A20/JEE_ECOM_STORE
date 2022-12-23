package Models;

import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import beans.FichTech;
import beans.Product;
import database.connecteToDb;

public class ProductBusiness {
	
	public static ArrayList<Product> getProducts(){
		ArrayList<Product> products = new ArrayList<Product>();
		
		Connection con = connecteToDb.getConnection();
		
		// create statement
		Statement st = null;
		ResultSet rs = null;
		try {
			st = con.createStatement();
			
			// excute sql query
			rs = st.executeQuery("select * from products, fichetech where  ficheIdKey = fichId;");
			
			// loop over product
			while(rs.next()) {
				products.add(new Product(rs.getInt("proId"), rs.getString("name"), rs.getFloat("rate"), rs.getFloat("price"), new FichTech(rs.getString("os"), rs.getString("display"), rs.getString("cam"), rs.getString("battery"), rs.getString("processor"), rs.getString("memory")),rs.getString("image"), rs.getInt("quantity")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return products;
	}
	
	public static ArrayList<String> getCategorie(){
		ArrayList<String> cats = new ArrayList<String>();
		
		Connection con = connecteToDb.getConnection();
		
		// create statement
		Statement st = null;
		ResultSet rs = null;
		try {
			st = con.createStatement();
			
			// excute sql query
			rs = st.executeQuery("select distinct cat from category");
			
			// loop over product
			while(rs.next()) {
				cats.add(new String(rs.getString(1)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cats;
	}
	
	public static ArrayList<Product> getProductByCat(String cat){
		ArrayList<Product> products = new ArrayList<Product>();
		
		Connection con = connecteToDb.getConnection();
		
		// create statement
		Statement st = null;
		ResultSet rs = null;
		try {
			st = con.createStatement();
			
			// excute sql query
			rs = st.executeQuery("select * from products, category \r\n"
					+ "where products.catId = category.idcat \r\n"
					+ "and category.cat = '"+ cat +"'");
			
			// loop over product
			while(rs.next()) {
				products.add(new Product(rs.getInt("proId"), rs.getString("name"), rs.getFloat("rate"), rs.getFloat("price"), null, rs.getString("image"), rs.getInt("quantity")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return products;
	}
	
	
	public static Product getProductById(int _id) {
		Connection con = connecteToDb.getConnection();
		Product product = new Product();
		String SQL_QUERY = "SELECT * FROM products, fichetech WHERE ficheIdKey = fichId AND proId = ?";
		
		// create statement
		PreparedStatement pr = null;
		ResultSet rs = null;
		try {
			pr = con.prepareStatement(SQL_QUERY);
			pr.setInt(1, _id);
			
			rs = pr.executeQuery();
					
			rs.next();
			product = new Product(rs.getInt("proId"), rs.getString("name"), rs.getFloat("rate"), rs.getFloat("price"), new FichTech(rs.getString("os"), rs.getString("display"), rs.getString("cam"), rs.getString("battery"), rs.getString("processor"), rs.getString("memory")), rs.getString("image"), rs.getInt("quantity"));
	
			
		}catch (Exception e){
			System.out.println(e.getMessage());
		}
		return product;
	}
	
	// admin
	/*
	 * create product (fich, cat)
	 * read all products
	 * update product (fich, cat)
	 * delete product (fich)
	 */
	
	// create product
	public static Boolean createProduct(String name, float rate, float price,FichTech fich, int catId, String image, int quantity) {
		 int ficheIdKey = createFicheTech(fich.getOs(), fich.getDisplay(), fich.getCam(), fich.getBattery(), fich.getProcessor(), fich.getMemory());
	     String SQL_QUERY = "INSERT INTO products(name, rate, price, ficheIdKey, catId, image, quantity) VALUES (?, ?, ?, ?, ?, ?, ?)";
		if(ficheIdKey > 0) {
			Connection con = connecteToDb.getConnection();
			
			PreparedStatement pr;
			int rs = 0;
			
			try {
				pr = con.prepareStatement(SQL_QUERY);
				pr.setString(1, name);
				pr.setFloat(2, rate);
				pr.setFloat(3, price);
				pr.setInt(4, ficheIdKey);
				pr.setInt(5, catId);
				pr.setString(6, image);
				pr.setInt(7, quantity);
				
				rs = pr.executeUpdate();
				
				return rs != 0;
			} catch (Exception e) {
				// TODO: handle exception
			}
			
		}
		return false;
	}
	
	public static int createFicheTech(String os, String display, String cam, String battery, String processor,String memory) {
		
		// generate a random number 
		//Create a new SecureRandom object
		  SecureRandom secureRandom = new SecureRandom();
		//Generate a random integer between 100 and 999999 (inclusive)
		  int min = 100;
		  int max = 999999;
		  int idFich = secureRandom.nextInt((max - min) + 1) + min;
		String SQL_QUERY="insert into fichetech(fichId, os, display, cam, battery, processor, memory) values(?, ?, ?, ?, ?, ?, ?)";
		
		// connection 
		Connection con = connecteToDb.getConnection();
		
		// prepared Statement
		PreparedStatement pr;
		int rs ;
		try {
			pr = con.prepareStatement(SQL_QUERY);
			pr.setInt(1, idFich);
			pr.setString(2, os);
			pr.setString(3, display);
			pr.setString(4, cam);
			pr.setString(5, battery);
			pr.setString(6, processor);
			pr.setString(7, memory);
			
			rs = pr.executeUpdate();
			
			if(rs!=0) {
				return idFich;
			}
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		return -1;
	}

	// delete product
	public static Boolean deleteProductById(int _id) {
		String SQL_QUERY = "DELETE FROM products where proId = ?";
		Connection con = connecteToDb.getConnection();
		
		PreparedStatement pr;
		int rs = 0;
		
		try {
			pr = con.prepareStatement(SQL_QUERY);
			pr.setInt(1, _id);
			
			rs = pr.executeUpdate();
			return rs != 0;
		}catch (Exception e) {
			// TODO: handle exception
		}
		

		return false;
	}
	
	// update Product
	public static Boolean updateProduct(int _id, String name, float price, FichTech fiche, String image, int quantity) {
		// get fichIdKey
		int ficheIdKey = -2;
		String SQL = "select ficheIdKey from products where proId = ?";
		Connection con = connecteToDb.getConnection();
		
		// preparedstemenet 1
		try {
			PreparedStatement pr1 = con.prepareStatement(SQL);
			
			pr1.setInt(1, _id);
			ResultSet rs = pr1.executeQuery();
			
			while(rs.next()) {
				ficheIdKey = rs.getInt("ficheIdKey");
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		System.out.println(ficheIdKey);
		 // update product
	     String SQL_QUERY = "UPDATE products SET "
	     		+ "name = ?,"
	     		+ "price = ?,"
	     		+ "ficheIdKey = ?,"
	     		+ "image = ?,"
	     		+ "quantity = ?"
	     		+ "where proId = ?";
		
		
		PreparedStatement pr;
		int rs = 0;
		
		try {
			pr = con.prepareStatement(SQL_QUERY);
			
			pr.setInt(6, _id);
			pr.setString(1, name);
			pr.setFloat(2, price);
			pr.setInt(3, ficheIdKey);
			pr.setString(4, "images/"+image);
			pr.setInt(5, quantity);
			
			rs = pr.executeUpdate();
			System.out.println("update product" + rs);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		// update fiche Update
		String SQL_2 ="UPDATE fichetech SET "
	     		+ "os = ?,"
	     		+ "display = ?,"
	     		+ "cam = ?,"
	     		+ "battery = ?,"
	     		+ "processor = ?,"
	     		+ "memory = ?"
	     		+ "where fichId = ?";
		try {
			PreparedStatement pr_3 = con.prepareStatement(SQL_2);
			pr_3.setInt(7, ficheIdKey);
			pr_3.setString(1, fiche.getOs());
			pr_3.setString(2, fiche.getDisplay());
			pr_3.setString(3, fiche.getCam());
			pr_3.setString(4, fiche.getBattery());
			pr_3.setString(5, fiche.getProcessor());
			pr_3.setString(6, fiche.getMemory());
			
			rs = pr_3.executeUpdate();
			System.out.println("update "+ rs);
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
	
	}

}
