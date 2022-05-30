package model.rating;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.admin.MemberBean;
import model.login.LoginBean;
import model.offer.OfferBean;
import utility.DatabaseConnection;

public class RatingDao {
	private final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	
	
	
	public void createRating(RatingBean ratingBean) {
		Connection conn;
		Statement stmt;
		PreparedStatement pst = null;
		//HttpSession session = request.getSession();
		
		
        
        
        try {
            Class.forName(JDBC_DRIVER);
            conn = DatabaseConnection.initialiseDatabase();
            System.out.println("Database..");
            stmt = conn.createStatement();
            
            int id_offer = ratingBean.getID_Offer();
            int id_member = ratingBean.getID_Member();
            int value = ratingBean.getValue();
            
	        String sql_offer = "INSERT INTO Rating(ID_OFFER, ID_Member, VALUE) values(?,?,?)" ;
	        pst = conn.prepareStatement(sql_offer);
	        pst.setInt(1,id_offer);
	        pst.setInt(2, id_member);
	        pst.setInt(3, value);	       
	        
	        int row = pst.executeUpdate();
	        
        } catch (ClassNotFoundException e) {

            e.printStackTrace();
        } catch (SQLException e) {

            e.printStackTrace();
        }
	}
	
	
	
	public List<RatingBean> getAllRatings(int ID_Offer) { 
			ArrayList<RatingBean> ratingList = new ArrayList<>();
			
			try {
				Connection dbconn = DatabaseConnection.initialiseDatabase();
				PreparedStatement preparedStatement = null;
		        preparedStatement = dbconn.prepareStatement("SELECT * FROM RATING WHERE ID_OFFER = ?");
		        preparedStatement.setInt(1,ID_Offer);
		        
		        ResultSet resultSet = preparedStatement.executeQuery();
		        
		        if (resultSet  == null) {
		        	System.out.println("Null Result Set Output");
		        }
		        
		        while (resultSet.next()) {
		        	RatingBean rating = new RatingBean();
		        	rating.setID_Rating(resultSet.getInt("ID_Rating"));
		        	rating.setID_Offer(resultSet.getInt("ID_Offer"));
		        	rating.setID_Member(resultSet.getInt("ID_Member"));
		        	rating.setDate(resultSet.getDate("Date").toString());
		        	rating.setValue(resultSet.getInt("Value"));
		        	ratingList.add(rating);
		        }
		        preparedStatement.close();
	        	dbconn.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			return ratingList;
	}
	
	public int getAvgRating(List<RatingBean> ratingList) {
		int avgRating = 0;
		int sumRating = 0;
		int div = ratingList.size();
		for (RatingBean ratingBean : ratingList) {
			sumRating += ratingBean.getValue();
		}
		return (sumRating % div);
	}
	
}