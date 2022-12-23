package Models;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.User;
import database.connecteToDb;


public class UserBusiness {
	
	public static Boolean SignUp(String firstName, String lastName, String email, String password) {
		Connection con = connecteToDb.getConnection();
		
		String sql = "INSERT INTO user (firstName, lastName, password, email) VALUES (?, ?, ?, ?)";
	      PreparedStatement preparedStatement = null;
		try {
			preparedStatement = con.prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	      try {
			preparedStatement.setString(1, firstName);
			preparedStatement.setString(2, lastName);
			preparedStatement.setString(3, password);
		    preparedStatement.setString(4, email);
		      
		    preparedStatement.executeUpdate();

		    System.out.println("Signup successful!");
		    return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	      
	}
	
	public static User SignIn(String email, String password) {
		User user = new User();
		Connection con = connecteToDb.getConnection();
		String sql = "SELECT * FROM user WHERE email = ? AND password = ?";
	      PreparedStatement preparedStatement;
	      ResultSet resultSet = null;
		try {
			preparedStatement = con.prepareStatement(sql);
			preparedStatement.setString(1, email);
		    preparedStatement.setString(2, password);
		      
		      resultSet = preparedStatement.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	      
	      
	      try {
			if (resultSet.next()) {
			    // Login successful
				user.setFirstName(resultSet.getString("firstName"));
				user.setLastName(resultSet.getString("lastName"));
				user.setEmail(resultSet.getString("email"));
				System.out.println("Login successful!");
			    return user;
			  } else {
			    // Login failed
			    System.out.println("Invalid username or password.");
			    return null;
			  }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public static ArrayList<User> getUsers(){
		ArrayList<User> users = new ArrayList<User>();
		String SQL = "SELECT firstName, lastName";
		return users;
	}
	public static void main(String ...args) {
		User user = SignIn("med@med.com","12345");
		if(user != null) {
			System.out.println(user.getFirstName());
		}else {
			System.out.println("not sign up");
		}
	}
}
