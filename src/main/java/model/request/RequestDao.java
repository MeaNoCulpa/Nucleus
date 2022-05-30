package model.request;

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
import model.request.RequestBean;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.admin.MemberBean;
import model.login.LoginBean;
import model.offer.OfferBean;
import utility.DatabaseConnection;

public class RequestDao {
	private final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	
	
	
	public void createRequest(RequestBean requestBean) {
		Connection conn;
		Statement stmt;
		PreparedStatement pst = null;
		//HttpSession session = request.getSession();
		
		
        
        
        try {
            Class.forName(JDBC_DRIVER);
            conn = DatabaseConnection.initialiseDatabase();
            System.out.println("Database..");
            stmt = conn.createStatement();
            
            int id_offer = requestBean.getId_offer();
            int id_requester = requestBean.getId_requester();
            String description = requestBean.getDescription();
            String status = "En cours";
            
	        String sql_offer = "INSERT INTO REQUEST(ID_OFFER, ID_REQUESTER, DESCRIPTION, STATUS) values(?,?,?,?)" ;
	        pst = conn.prepareStatement(sql_offer);
	        pst.setInt(1,id_offer);
	        pst.setInt(2, id_requester);
	        pst.setString(3, description);
	        pst.setString(4, status);
	        
	        int row = pst.executeUpdate();
	        
        } catch (ClassNotFoundException e) {

            e.printStackTrace();
        } catch (SQLException e) {

            e.printStackTrace();
        }
	}
	
	
	public List<RequestBean> getAllRequests(int ID_Owner) {
		ArrayList<RequestBean> requestList = new ArrayList<>();
		
		try {
			Connection dbconn = DatabaseConnection.initialiseDatabase();
			PreparedStatement preparedStatement = null;
	        preparedStatement = dbconn.prepareStatement("SELECT * FROM REQUEST WHERE ID_REQUESTER = ?");
	        preparedStatement.setInt(1,ID_Owner);
	        
	        ResultSet resultSet = preparedStatement.executeQuery();
	        
	        if (resultSet  == null) {
	        	System.out.println("Null Result Set Output");
	        }
	        
	        while (resultSet.next()) {
	        	RequestBean request = new RequestBean();
	        	request.setId_request(resultSet.getInt("ID_Request"));
	        	request.setId_requester(resultSet.getInt("ID_Requester"));
	        	request.setId_offer(resultSet.getInt("Id_offer"));
	        	request.setDate(resultSet.getDate("Date").toString());
	        	request.setDescription(resultSet.getString("Description"));
	        	requestList.add(request);
	        }
	        preparedStatement.close();
        	dbconn.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return requestList;
	}
	
	public void updateStatus(RequestBean requestBean) {
		String status = requestBean.getStatus();
		int id_request = requestBean.getId_request();
		Connection conn;
		Statement stmt;
		PreparedStatement pst = null;
		try {
			 
			
            Class.forName(JDBC_DRIVER);
            conn = DatabaseConnection.initialiseDatabase();
            System.out.println("Database..");
            stmt = conn.createStatement();
            
	        String sql_offer = "UPDATE REQUEST SET STATUS = ? WHERE ID_REQUEST = ?)" ;
	        pst = conn.prepareStatement(sql_offer);
	        pst.setString(1, status);
	        pst.setInt(2,id_request);
	        
	        
	        int row = pst.executeUpdate();
	        
        } catch (ClassNotFoundException e) {

            e.printStackTrace();
        } catch (SQLException e) {

            e.printStackTrace();
        }
	}
	
}