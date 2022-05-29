package model.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import utility.DatabaseConnection;

public class MemberDao {
	
	public List<MemberBean> getAllMembers() {
		
		ArrayList<MemberBean> memberList = new ArrayList<>();
		
		try {
			Connection dbconn = DatabaseConnection.initialiseDatabase();
			PreparedStatement preparedStatement = null;
	        preparedStatement = dbconn.prepareStatement("SELECT * FROM member");
	        ResultSet resultSet = preparedStatement.executeQuery();
	        
	        if (resultSet  == null) {
	        	System.out.println("Query result is null");
	        }
	        
	        while (resultSet.next()) {
	        	MemberBean member = new MemberBean();
	        	member.setFirstname(resultSet.getString("Firstname"));
	        	member.setLastname(resultSet.getString("Lastname"));
	        	member.setUsername(resultSet.getString("Username"));
	        	member.setRole(resultSet.getString("Role"));
	        	member.setId(resultSet.getInt("ID_Member"));
	        	memberList.add(member);
	        }
	        preparedStatement.close();
        	dbconn.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return memberList;
	}
	
	
}
