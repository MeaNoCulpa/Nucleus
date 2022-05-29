package model.search;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import utility.DatabaseConnection;

public class SearchDao {

	public List<SearchBean> getSearchResultFromLocation(String location) {
		
		ArrayList<SearchBean> searchResult = new ArrayList<>();
		
		try {
			Connection dbconn = DatabaseConnection.initialiseDatabase();
			PreparedStatement preparedStatement = null;
	        preparedStatement = dbconn.prepareStatement("SELECT * FROM offer WHERE Location=?");
	        preparedStatement.setString(1, location);
	        ResultSet resultSet = preparedStatement.executeQuery();
	        
	        if (resultSet  == null) {
	        	System.out.println("Query result is null");
	        }
	        
	        while (resultSet.next()) {
	        	SearchBean search = new SearchBean();
	        	search.setIdOffer(resultSet.getInt("ID_Offer"));
	        	search.setIdOwner(resultSet.getInt("ID_Owner"));
	        	search.setDateStart(resultSet.getString("Date_start"));
	        	search.setDateEnd(resultSet.getString("Date_end"));
	        	search.setLocation(resultSet.getString("Location"));
	        	search.setDescription(resultSet.getString("Description"));
	        	searchResult.add(search);
	        }
	        preparedStatement.close();
        	dbconn.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return searchResult;
		
	}
}
