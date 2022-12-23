package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class connecteToDb {
  private static final String URL = "jdbc:mysql://localhost:3306/ecomstore";
  private static final String USERNAME = "root";
  private static final String PASSWORD = "root";

  public static Connection getConnection() {
	  
	  try {
		  Class.forName("com.mysql.cj.jdbc.Driver");
	  } catch (ClassNotFoundException e) {
		  // TODO Auto-generated catch block
		  e.printStackTrace();
	  }
    try {
		return DriverManager.getConnection(URL, USERNAME, PASSWORD);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return null;
  }
  
  public static void main(String[] args) {
	  if(getConnection() != null) {
		  System.out.println("done");
	  }
  }
}
