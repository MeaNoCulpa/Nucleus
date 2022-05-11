package com.example.nucleus.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDao {
	public String authoriseLogin(LoginBean loginBean) {
	    String username = loginBean.getUsername();
	    String password = loginBean.getPassword();

	    String dbUsername;
	    String dbPassword;

	    String DBURL = "jdbc:mysql://localhost:3306/Nucleus"; // database connexion url string
	    String DBLOGIN = "root"; // database username
	    String DBPASSWORD = "root"; // database password

	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection dbconn = DriverManager.getConnection(DBURL, DBLOGIN, DBPASSWORD);

	        PreparedStatement preparedStatement = null;

	        preparedStatement = dbconn.prepareStatement("select * from member where Username=? and Password=?");
	        preparedStatement.setString(1, username);
	        preparedStatement.setString(2, password);
	        ResultSet resultSet = preparedStatement.executeQuery();

	        while (resultSet.next()) {
	            dbUsername = resultSet.getString("Username");
	            dbPassword = resultSet.getString("Password");

	            if (username.equals(dbUsername) && password.equals(dbPassword)) {
	                return "SUCCESS LOGIN";
	            }
	        }

	        preparedStatement.close();
	        dbconn.close();

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return "WRONG USERNAME AND PASSWORD";
	    }
}