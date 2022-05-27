package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SettingsDao {
		
	private final String DBURL = "jdbc:mysql://localhost:3306/NUCLEUS";
	private final String DBLOGIN = "root";
	private final String DBPASSWORD = "root";
    	
		public String authoriseSettings(SettingsBean settingsBean, String currentUsername) {
			
		    String username = settingsBean.getEmail();
		    String password = settingsBean.getPassword();
		    
		    

		    String dbUsername;
		    String dbPassword;
		    int dbID;
		    
		    try {
		        Class.forName("com.mysql.cj.jdbc.Driver");
		        Connection dbconn = DriverManager.getConnection(DBURL, DBLOGIN, DBPASSWORD);

		        PreparedStatement preparedStatement = null;

		        preparedStatement = dbconn.prepareStatement("SELECT * FROM member WHERE Username=? AND Password=?");
		        preparedStatement.setString(1, currentUsername);
		        preparedStatement.setString(2, password);
		        ResultSet resultSet = preparedStatement.executeQuery();

		        while (resultSet.next()) {
		            dbUsername = resultSet.getString("Username");
		            dbPassword = resultSet.getString("Password");
		            dbID = resultSet.getInt("ID_Member");

		            if (currentUsername.equals(dbUsername) && password.equals(dbPassword)) {
		            	String query = "UPDATE member SET Username=? WHERE ID_Member=?";
		            	preparedStatement = dbconn.prepareStatement(query);
		            	preparedStatement.setString(1, username);
		            	preparedStatement.setInt(2, dbID);
		            	preparedStatement.executeUpdate();
		            	
		            	preparedStatement.close();
		            	dbconn.close();
		            	
		            	return "SUCCESS";
		            }
		            else {
		            	preparedStatement.close();
		            	dbconn.close();
		            	return "FAIL";
		            }
		        }
		  
		    }
		    catch (Exception e) {
		        e.printStackTrace();
		    }

		    return "ERROR";
		    }

		public String authoriseSettingsPassword(SettingsBean settingsBean, String currentPassword) {
			String password = settingsBean.getPassword();
			String username = settingsBean.getEmail();
			
			String dbUsername;
			String dbPassword;
			int dbID;
		    
		    try {
		    	Class.forName("com.mysql.cj.jdbc.Driver");
		        Connection dbconn = DriverManager.getConnection(DBURL, DBLOGIN, DBPASSWORD);

		        PreparedStatement preparedStatement = null;
		        preparedStatement = dbconn.prepareStatement("SELECT * FROM member WHERE Username=? AND Password=?");
		        preparedStatement.setString(1, username);
		        preparedStatement.setString(2, currentPassword);
		        ResultSet resultSet = preparedStatement.executeQuery();
		        
		        while (resultSet.next()) {
		        	dbUsername = resultSet.getString("Username");
		            dbPassword = resultSet.getString("Password");
		            dbID = resultSet.getInt("ID_Member");
		            
		            if (username.equals(dbUsername) && currentPassword.equals(dbPassword)) {
		            	String query = "UPDATE member SET Password=? WHERE ID_Member=?";
		            	preparedStatement = dbconn.prepareStatement(query);
		            	preparedStatement.setString(1, password);
		            	preparedStatement.setInt(2, dbID);
		            	preparedStatement.executeUpdate();
		            	
		            	preparedStatement.close();
		            	dbconn.close();
		            	
		            	return "Success";
		            }
		            else {
		            	preparedStatement.close();
		            	dbconn.close();
		            	return "Fail";
		            }
		        }

		        
		    }
		    catch (Exception e) {
		    	e.printStackTrace();
		    }
			
			return "Error";
		}
		
		public String authoriseSettingsLastname(SettingsBean settingsBean, String currentLastname) {
			String password = settingsBean.getPassword();
			String username = settingsBean.getEmail();
			String newLastname = settingsBean.getLastname();
			
			String dbUsername;
			String dbPassword;
			int dbID;
		    
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
		            dbID = resultSet.getInt("ID_Member");
		            
		            if (username.equals(dbUsername) && password.equals(dbPassword)) {
		            	String query = "UPDATE member SET Lastname=? WHERE ID_Member=?";
		            	preparedStatement = dbconn.prepareStatement(query);
		            	preparedStatement.setString(1, newLastname);
		            	preparedStatement.setInt(2, dbID);
		            	preparedStatement.executeUpdate();
		            	
		            	preparedStatement.close();
		            	dbconn.close();
		            	
		            	return "Success";
		            }
		            else {
		            	preparedStatement.close();
		            	dbconn.close();
		            	return "Fail";
		            }
		        }
		    }
		    catch (Exception e) {
		    	e.printStackTrace();
		    }
		    
			return "Errare";
		}
		
		public String authoriseSettingsFirstname(SettingsBean settingsBean, String currentFirstname) {
			String password = settingsBean.getPassword();
			String username = settingsBean.getEmail();
			String newFirstname = settingsBean.getFirstname();
			
			String dbUsername;
			String dbPassword;
			int dbID;
		    
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
		            dbID = resultSet.getInt("ID_Member");
		            
		            if (username.equals(dbUsername) && password.equals(dbPassword)) {
		            	String query = "UPDATE member SET Firstname=? WHERE ID_Member=?";
		            	preparedStatement = dbconn.prepareStatement(query);
		            	preparedStatement.setString(1, newFirstname);
		            	preparedStatement.setInt(2, dbID);
		            	preparedStatement.executeUpdate();
		            	
		            	preparedStatement.close();
		            	dbconn.close();
		            	
		            	return "Success";
		            }
		            else {
		            	preparedStatement.close();
		            	dbconn.close();
		            	return "Fail";
		            }
		        }
		    }
		    catch (Exception e) {
		    	e.printStackTrace();
		    }
		    
			return "Errare";
		}
		
		public String getIDFromDataBase(SettingsBean settingsBean) {
			String username = settingsBean.getEmail();
		    String password = settingsBean.getPassword();
		    
		    try {
		        Class.forName("com.mysql.cj.jdbc.Driver");
		        Connection dbconn = DriverManager.getConnection(DBURL, DBLOGIN, DBPASSWORD);

		        PreparedStatement preparedStatement = null;

		        preparedStatement = dbconn.prepareStatement("select ID_Member from member where Username=? and Password=?");
		        preparedStatement.setString(1, username);
		        preparedStatement.setString(2, password);
		        ResultSet resultSet = preparedStatement.executeQuery();

		        while (resultSet.next()) {
		            String dbMember = resultSet.getString("ID_Member");
		            return dbMember;
		        }

		        preparedStatement.close();
		        dbconn.close();

		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    
		    return "ERROR";
		}
}
