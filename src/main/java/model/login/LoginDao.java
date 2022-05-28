	package model.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import utility.DatabaseConnection;

public class LoginDao {
	
	public String authoriseLogin(LoginBean loginBean) {
	    String username = loginBean.getUsername();
	    String password = loginBean.getPassword();

	    String dbUsername;
	    String dbPassword;
	    String dbRole;
	    
	    try {
	        Connection dbconn = DatabaseConnection.initialiseDatabase();
	        PreparedStatement preparedStatement = null;

	        preparedStatement = dbconn.prepareStatement("SELECT * FROM member WHERE Username=? AND Password=?");
	        preparedStatement.setString(1, username);
	        preparedStatement.setString(2, password);
	        ResultSet resultSet = preparedStatement.executeQuery();

	        while (resultSet.next()) {
	            dbUsername = resultSet.getString("Username");
	            dbPassword = resultSet.getString("Password");
	            dbRole = resultSet.getString("Role");

	            if (username.equals(dbUsername) && password.equals(dbPassword)) {
	            	if (dbRole.equals("admin")) {
	            		loginBean.setRole("admin");
	            		return "SUCCESS ADMIN LOGIN";
	            	}
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
	    	Connection dbconn = DatabaseConnection.initialiseDatabase();
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
	    	Connection dbconn = DatabaseConnection.initialiseDatabase();
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
	    	Connection dbconn = DatabaseConnection.initialiseDatabase();
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
