package model.offer;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.admin.MemberBean;
import model.login.LoginBean;
import utility.DatabaseConnection;

public class OfferDao {
	private final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	public boolean authoriseCreation(OfferBean offerBean) {
		
		String[] services = offerBean.getServices();
        String[] limitations = offerBean.getLimitations();
        Part filePart = offerBean.getOffer_image();
        
        try {
        	createOffer(offerBean);
        	InputStream inputStream = null; // input stream of the upload file
        	if (filePart != null) {
                // prints out some information for debugging
                System.out.println(filePart.getName());
                System.out.println(filePart.getSize());
                System.out.println(filePart.getContentType());
                 
                // obtains input stream of the upload file
                inputStream = filePart.getInputStream();
            }

            return true;
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
	
	
	public void createOffer(OfferBean offerBean) {
		Connection conn;
		Statement stmt;
		PreparedStatement pst = null;
		//HttpSession session = request.getSession();
		
		String location = offerBean.getLocation();
        String date_start = offerBean.getDate_start();
        String date_end= offerBean.getDate_end();
        String description= offerBean.getDescription();
        int id_member = 1;//TODO Change to LOGINBEAN
        String username ;
        
        
        try {
            Class.forName(JDBC_DRIVER);
            conn = DatabaseConnection.initialiseDatabase();
            System.out.println("Database..");
            stmt = conn.createStatement();
        
        
	        String sql_offer = "INSERT INTO OFFER(ID_Owner, Date_start, Date_end, Location, Description) values(?,?,?,?,?,)" ;
	        pst = conn.prepareStatement(sql_offer);
	        pst.setInt(1,id_member);
	        pst.setDate(2, Date.valueOf(date_start));
	        pst.setDate(3, Date.valueOf(date_end));
	        pst.setString(4, location);
	        pst.setString(5, description);
	        
	        int row = pst.executeUpdate();
	        
        } catch (ClassNotFoundException e) {

            e.printStackTrace();
        } catch (SQLException e) {

            e.printStackTrace();
        }
	}
	
public List<OfferBean> getAllOffers(LoginBean loginBean) {
     	//TODO LoginBean 
		long ID_Owner = session.;
		ArrayList<OfferBean> offerList = new ArrayList<>();
		
		try {
			Connection dbconn = DatabaseConnection.initialiseDatabase();
			PreparedStatement preparedStatement = null;
	        preparedStatement = dbconn.prepareStatement("SELECT * FROM OFFER WHERE ID_OWNER IS ?");
	        preparedStatement.setLong(1,ID_Owner);
	        
	        ResultSet resultSet = preparedStatement.executeQuery();
	        
	        if (resultSet  == null) {
	        	System.out.println("Null Result Set Output");
	        }
	        
	        while (resultSet.next()) {
	        	OfferBean offer = new OfferBean();
	        	offer.setId_offer(resultSet.getInt("ID_Offer"));
	        	offer.setId_owner(resultSet.getInt("ID_Owner"));
	        	offer.setDate_start(resultSet.getDate("Date_start").toString());
	        	offer.setDate_end(resultSet.getDate("Date_end").toString());
	        	offer.setLocation(resultSet.getString("Location"));
	        	offer.setDescription(resultSet.getString("Description"));
	        	offerList.add(offer);
	        }
	        preparedStatement.close();
        	dbconn.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return offerList;
	}
}
