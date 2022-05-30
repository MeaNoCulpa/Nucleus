package model.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import utility.DatabaseConnection;

public class EditDao {
	
	public static EditBean FindByPk(long id) {
	    Connection connection;
	    EditBean user = null;
	    
	    try {
	      connection = DatabaseConnection.initialiseDatabase();
	      PreparedStatement stmt = connection.prepareStatement("SELECT * FROM member WHERE ID_Member=?");
	      stmt.setLong(1,id);
	      ResultSet rs = stmt.executeQuery();
	      
	      if(rs.next()) {
	        user = new EditBean();
	        //System.out.println("ID: " + rs.getLong("ID_Member"));
	        user.setId(rs.getLong("ID_Member"));
	        user.setFirstname(rs.getString("Firstname"));
	        user.setLastname(rs.getString("Lastname"));
	        user.setEmail(rs.getString("Username"));
	        user.setRole(rs.getString("Role"));
	      }
	      
	    } catch (Exception e) {
	      e.printStackTrace();
	    }
	    
	    return user;
	  }
	
	public static long updateUser(EditBean user) {
    int i = 0;
    
    try {
      Connection connection = DatabaseConnection.initialiseDatabase();
      PreparedStatement stmt = connection.prepareStatement("UPDATE member SET Firstname=?, Lastname=?, Username=?, Role=? WHERE ID_Member=?");
      
      stmt.setString(1, user.getFirstname() );
      stmt.setString(2, user.getLastname() );
      stmt.setString(3, user.getEmail());
      stmt.setString(4, user.getRole());
      stmt.setLong(5, user.getId());
      i =   stmt.executeUpdate();
      
    } catch (Exception e) {
      e.printStackTrace();
    }
    return i;
  }
	
	public static long deleteUser(long id) {
	  int i = 0;
	  try {
	    Connection connection = DatabaseConnection.initialiseDatabase();
	    PreparedStatement stmt = connection.prepareStatement("DELETE FROM member WHERE ID_Member=?");
	    stmt.setLong(1, id);
	    i = stmt.executeUpdate();
	  } catch (Exception e) {
	    e.printStackTrace();
	  }
	  return i;
	}
}


