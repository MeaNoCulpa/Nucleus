package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDao {

	private final String DBURL = "jdbc:mysql://localhost:3306/NUCLEUS";
	private final String DBLOGIN = "root";
	private final String DBPASSWORD = "root";
	
	public String authoriseLogin(LoginBean loginBean) {
	    String username = loginBean.getUsername();
	    String password = loginBean.getPassword();

	    String dbUsername;
	    String dbPassword;

	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection dbconn = DriverManager.getConnection(DBURL, DBLOGIN, DBPASSWORD);
	        PreparedStatement preparedStatement = null;

	        preparedStatement = dbconn.prepareStatement("SELECT * FROM member WHERE Username=? AND Password=?");
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
	
	public String getFirstnameFromDataBase(LoginBean loginBean) {
		String username = loginBean.getUsername();
	    String password = loginBean.getPassword();
	    
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection dbconn = DriverManager.getConnection(DBURL, DBLOGIN, DBPASSWORD);
	        PreparedStatement preparedStatement = null;

	        preparedStatement = dbconn.prepareStatement("select Firstname from member where Username=? and Password=?");
	        preparedStatement.setString(1, username);
	        preparedStatement.setString(2, password);
	        ResultSet resultSet = preparedStatement.executeQuery();

	        while (resultSet.next()) {
	            String dbFirstname = resultSet.getString("Firstname");
	            return dbFirstname;
	        }
	        preparedStatement.close();
	        dbconn.close();

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return "null";
	}

	public String getLastnameFromDataBase(LoginBean loginBean) {
		String username = loginBean.getUsername();
	    String password = loginBean.getPassword();
	    
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection dbconn = DriverManager.getConnection(DBURL, DBLOGIN, DBPASSWORD);
	        PreparedStatement preparedStatement = null;

	        preparedStatement = dbconn.prepareStatement("SELECT Lastname FROM member WHERE Username=? AND Password=?");
	        preparedStatement.setString(1, username);
	        preparedStatement.setString(2, password);
	        ResultSet resultSet = preparedStatement.executeQuery();

	        while (resultSet.next()) {
	            String dbLastname = resultSet.getString("Lastname");
	            return dbLastname;
	        }
	        preparedStatement.close();
	        dbconn.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return "null";
	}
	
	public int getIdFromDataBase(LoginBean loginBean) {
		String username = loginBean.getUsername();
	    String password = loginBean.getPassword();
	    
	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        Connection dbconn = DriverManager.getConnection(DBURL, DBLOGIN, DBPASSWORD);
	        PreparedStatement preparedStatement = null;

	        preparedStatement = dbconn.prepareStatement("SELECT ID_Member FROM member WHERE Username=? AND Password=?");
	        preparedStatement.setString(1, username);
	        preparedStatement.setString(2, password);
	        ResultSet resultSet = preparedStatement.executeQuery();

	        while (resultSet.next()) {
	            return Integer.parseInt(resultSet.getString("ID_Member"));
	        }
	        preparedStatement.close();
	        dbconn.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return -1;
	}
}
