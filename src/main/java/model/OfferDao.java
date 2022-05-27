package model;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

public class OfferDao {
	private final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	private final String DBURL = "jdbc:mysql://localhost:3306/NUCLEUS";
    private final String DBLOGIN = "root";
    private final String DBPASSWORD = "root";
    
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
            conn = DriverManager.getConnection(DBURL, DBLOGIN, DBPASSWORD);
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
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
	}
	
	public Integer getcurrentAI(String Table) {
		Connection conn;
        Statement stmt;
        int ai_value = 1;
		try {
			Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(DBURL, DBLOGIN, DBPASSWORD);
            System.out.println("Database..");
            stmt = conn.createStatement();
		
			PreparedStatement pst = null;
	        
	        String sql_query_ai = "SELECT AUTO_INCREMENT FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'NUCLEUS' AND   TABLE_NAME   =" + Table;
	        
	        pst = conn.prepareStatement(sql_query_ai);
	        
	        ResultSet resultSet;
	        
	        resultSet = pst.executeQuery();
	        while(resultSet.next()){
	        	ai_value = resultSet.getInt("AUTO_INCREMENT");
	        }
        
        
		} catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
		return ai_value;
		
	}
}
