package model.offer;

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
import utility.DatabaseConnection;

public class OfferDao {
	private final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	public boolean authoriseCreation(OfferBean offerBean) {
		
        try {
        	System.out.println("Créa Offre");
        	createOffer(offerBean);
        	System.out.println("Récup ID Offre");
        	offerBean.setId_offer(getCurrentID(offerBean));
        	System.out.println("Créa Image Offre");
        	createOfferImage(offerBean);
        	System.out.println("Créa Services Offre");
        	createServices(offerBean);
        	System.out.println("Créa Limitations Offre");
        	createLimitations(offerBean);

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
        int id_member = offerBean.getId_owner();
        
        
        try {
            Class.forName(JDBC_DRIVER);
            conn = DatabaseConnection.initialiseDatabase();
            System.out.println("Database..");
            stmt = conn.createStatement();
        
        
	        String sql_offer = "INSERT INTO OFFER(ID_Owner, Date_start, Date_end, Location, Description) values(?,?,?,?,?)" ;
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
	
	public void createServices(OfferBean offerBean) {
		Connection conn;
		Statement stmt;
		PreparedStatement pst = null;
		//HttpSession session = request.getSession();
		
		int id_offer = offerBean.getId_offer();
        String date_start = offerBean.getDate_start();
        List<String> services = offerBean.getServices();
        
        if (services !=null ) {
	        for (String service : services) {
	        
		        try {
		            Class.forName(JDBC_DRIVER);
		            conn = DatabaseConnection.initialiseDatabase();
		            System.out.println("Database..");
		            stmt = conn.createStatement();
		        
		        
			        String sql_offer = "INSERT INTO SERVICE(ID_OFFER, DATE, VALUE) values(?,?,?)" ;
			        pst = conn.prepareStatement(sql_offer);
			        pst.setInt(1,id_offer);
			        pst.setDate(2, Date.valueOf(date_start));
			        pst.setString(3, service);
			        
			        int row = pst.executeUpdate();
			        
		        } catch (ClassNotFoundException e) {
		
		            e.printStackTrace();
		        } catch (SQLException e) {
		
		            e.printStackTrace();
		        }
	        }
        }
	}

	public void createLimitations(OfferBean offerBean) {
		Connection conn;
		Statement stmt;
		PreparedStatement pst = null;
		//HttpSession session = request.getSession();
		
		int id_offer = offerBean.getId_offer();
        String date_start = offerBean.getDate_start();
        List<String> limitations = offerBean.getLimitations();
        
        if (limitations !=null ) {
	        for (String limitation : limitations) {
	        
		        try {
		            Class.forName(JDBC_DRIVER);
		            conn = DatabaseConnection.initialiseDatabase();
		            System.out.println("Database..");
		            stmt = conn.createStatement();
		        
		        
			        String sql_offer = "INSERT INTO LIMITATION(ID_OFFER, DATE, VALUE) values(?,?,?)" ;
			        pst = conn.prepareStatement(sql_offer);
			        pst.setInt(1,id_offer);
			        pst.setDate(2, Date.valueOf(date_start));
			        pst.setString(3, limitation);
			        
			        int row = pst.executeUpdate();
			        
		        } catch (ClassNotFoundException e) {
		
		            e.printStackTrace();
		        } catch (SQLException e) {
		
		            e.printStackTrace();
		        }
	        }
        }
	}

	
	
	public void createOfferImage(OfferBean offerBean) {
		Connection conn;
		Statement stmt;
		PreparedStatement pst = null;
		//HttpSession session = request.getSession();
		
		int id_offer = offerBean.getId_offer();
        String date_start = offerBean.getDate_start();
  
        try {
            Class.forName(JDBC_DRIVER);
            conn = DatabaseConnection.initialiseDatabase();
            System.out.println("Database..");
            stmt = conn.createStatement();
        
        
            InputStream inputStream = null; // input stream of the upload file
            
            // obtains the upload file part in this multipart request
            Part filePart = offerBean.getOffer_image();
            if (filePart != null) {
                // prints out some information for debugging
                System.out.println(filePart.getName());
                System.out.println(filePart.getSize());
                System.out.println(filePart.getContentType());
                 
                // obtains input stream of the upload file
                inputStream = filePart.getInputStream();
            }
            
            String sql_image = "INSERT INTO OFFER_IMAGE(OFFER_IMAGE_VALUE, ID_OFFER, DATE, SIZE) values(?,?,?,?)" ;
            pst = conn.prepareStatement(sql_image);
            
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                pst.setBlob(1, inputStream);
            }
            
            pst.setInt(2, id_offer);
            pst.setDate(3, Date.valueOf(date_start));
            pst.setInt(4, (int) filePart.getSize());
            
	        int row = pst.executeUpdate();
	        
        } catch (ClassNotFoundException e) {

            e.printStackTrace();
        } catch (SQLException e) {

            e.printStackTrace();
        } catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<OfferBean> getAllOffers(int ID_Owner) { 
			ArrayList<OfferBean> offerList = new ArrayList<>();
			
			try {
				Connection dbconn = DatabaseConnection.initialiseDatabase();
				PreparedStatement preparedStatement = null;
		        preparedStatement = dbconn.prepareStatement("SELECT * FROM OFFER WHERE ID_OWNER = ?");
		        preparedStatement.setInt(1,ID_Owner);
		        
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
		        	offer.setServices(getAllServices(resultSet.getInt("ID_Offer")));
		        	offer.setLimitations(getAllLimitations(resultSet.getInt("ID_Offer")));
		        	offer.setOffer_image_string(getOfferImageString(offer));
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
	
	
	public OfferBean getOffer(int ID_Offer) { 
		OfferBean offer = new OfferBean();
		
		try {
			Connection dbconn = DatabaseConnection.initialiseDatabase();
			PreparedStatement preparedStatement = null;
	        preparedStatement = dbconn.prepareStatement("SELECT * FROM OFFER WHERE ID_OFFER = ?");
	        preparedStatement.setInt(1,ID_Offer);
	        
	        ResultSet resultSet = preparedStatement.executeQuery();
	        
	        if (resultSet  == null) {
	        	System.out.println("Null Result Set Output");
	        }
	        
	        while (resultSet.next()) {
	        	offer.setId_offer(resultSet.getInt("ID_Offer"));
	        	offer.setId_owner(resultSet.getInt("ID_Owner"));
	        	offer.setDate_start(resultSet.getDate("Date_start").toString());
	        	offer.setDate_end(resultSet.getDate("Date_end").toString());
	        	offer.setLocation(resultSet.getString("Location"));
	        	offer.setDescription(resultSet.getString("Description"));
	        	offer.setServices(getAllServices(resultSet.getInt("ID_Offer")));
	        	offer.setLimitations(getAllLimitations(resultSet.getInt("ID_Offer")));
	        	offer.setOffer_image_string(getOfferImageString(offer));
	        }
	        preparedStatement.close();
        	dbconn.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return offer;
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
	        	request.setId_offer(resultSet.getInt("Id_owner"));
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
	
	public List<String> getAllServices(int ID_Offer) {
		List<String> serviceList = new ArrayList<>();
		
		try {
			Connection dbconn = DatabaseConnection.initialiseDatabase();
			PreparedStatement preparedStatement = null;
	        preparedStatement = dbconn.prepareStatement("SELECT * FROM SERVICE WHERE ID_OFFER = ?");
	        preparedStatement.setInt(1,ID_Offer);
	        
	        ResultSet resultSet = preparedStatement.executeQuery();
	        
	        if (resultSet  == null) {
	        	System.out.println("Null Result Set Output");
	        }
	        
	        while (resultSet.next()) {
	        	String service = resultSet.getString("Value");
	        	
	        	switch (service) {
	        	case "keep_pets":
	        		service = "S'occuper des animaux";
	        		break;
	        	case "water_plants":
	        		service = "Arroser les plantes";
	        		break;
	        	case "clean_house":
	        		service = "Nettoyer les lieux";
	        		break;
	        	case "keep_inventory":
	        		service = "Remplacer les denrées alimentaires";
	        		break;
	        	}
	        	
	        	
	        	
	        	serviceList.add(service);
	        }
	        preparedStatement.close();
        	dbconn.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return serviceList;
	}
	
	public List<String> getAllLimitations(int ID_Offer) {
		List<String> limitationList = new ArrayList<>();
		
		try {
			Connection dbconn = DatabaseConnection.initialiseDatabase();
			PreparedStatement preparedStatement = null;
	        preparedStatement = dbconn.prepareStatement("SELECT * FROM LIMITATION WHERE ID_OFFER = ?");
	        preparedStatement.setInt(1,ID_Offer);
	        
	        ResultSet resultSet = preparedStatement.executeQuery();
	        
	        if (resultSet  == null) {
	        	System.out.println("Null Result Set Output");
	        }
	        
	        while (resultSet.next()) {
	        	String limitation = resultSet.getString("Value");
	        	
	        	switch (limitation) {
	        	case "No_smoking":
	        		limitation = "Non fumeur";
	        		break;
	        	case "No_night_disturbance":
	        		limitation = "Pas de bruit passé 23h";
	        		break;
	        	case "No_children":
	        		limitation = "Pas d'enfant de moins de 2 ans";
	        		break;
	        	case "No_pets":
	        		limitation = "Pas d'animal";
	        		break;
	        	case "No_party":
	        		limitation = "Pas de fêtes";
	        		break;
	        			
	        	}
	        	
	        	
	        	
	        	
	        	limitationList.add(limitation);
	        }
	        preparedStatement.close();
        	dbconn.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return limitationList;
	}
	
	public String getOfferImageString(OfferBean offerBean) {
		Blob offerImageBlob = null;
		byte[] imgData = null;
		String offerImageString = null;
		int id_offer = offerBean.getId_offer();
		
		try {
			Connection dbconn = DatabaseConnection.initialiseDatabase();
			PreparedStatement preparedStatement = null;
	        preparedStatement = dbconn.prepareStatement("SELECT OFFER_IMAGE_VALUE FROM OFFER_IMAGE WHERE ID_OFFER = ?");
	        
	        preparedStatement.setInt(1,id_offer);
	        
	        ResultSet resultSet = preparedStatement.executeQuery();
	        
	        if (resultSet  == null) {
	        	System.out.println("Null Result Set Output");
	        }
	        
	        while (resultSet.next()) {
	        	offerImageBlob = resultSet.getBlob("OFFER_IMAGE_VALUE");
	        	imgData = offerImageBlob.getBytes(1,(int)offerImageBlob.length());
	        	offerImageString = new String(Base64.getEncoder().encode(imgData) , "UTF-8");
	        }
	        preparedStatement.close();
        	dbconn.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return offerImageString;
	}
	
	public int getCurrentID(OfferBean offerBean) {
		int currentID=1;
		String location = offerBean.getLocation();
        String date_start = offerBean.getDate_start();
        String date_end= offerBean.getDate_end();
        String description= offerBean.getDescription();
        int id_member = offerBean.getId_owner();
		
		
		try {
			Connection dbconn = DatabaseConnection.initialiseDatabase();
			PreparedStatement preparedStatement = null;
	        preparedStatement = dbconn.prepareStatement("SELECT ID_OFFER FROM OFFER WHERE ID_OWNER = ? AND DATE_START = ? AND DATE_END = ? AND LOCATION = ? AND DESCRIPTION = ?");
	        
	        preparedStatement.setInt(1,id_member);
	        preparedStatement.setDate(2, Date.valueOf(date_start));
	        preparedStatement.setDate(3, Date.valueOf(date_end));
	        preparedStatement.setString(4, location);
	        preparedStatement.setString(5, description);
	        
	        
	        ResultSet resultSet = preparedStatement.executeQuery();
	        
	        if (resultSet  == null) {
	        	System.out.println("Null Result Set Output");
	        }
	        
	        while (resultSet.next()) {
	        	currentID = resultSet.getInt("ID_Offer");
	        }
	        preparedStatement.close();
        	dbconn.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return currentID;
	}
}
