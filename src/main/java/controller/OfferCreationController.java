package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;



/**
 * Servlet implementation class Creation_query
 */
//TODO Améliorer l'image display
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class OfferCreationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
        
	 	static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	    static final String DB_URL = "jdbc:mysql://localhost:3306/NUCLEUS";
	    static final String USER = "root";
	    static final String PASS = "root";

	    protected void doPost(HttpServletRequest req, HttpServletResponse res)
	            throws ServletException, IOException {
	        Connection conn;
	        Statement stmt;
	        try {
	            Class.forName(JDBC_DRIVER);
	            conn = DriverManager.getConnection(DB_URL, USER, PASS);
	            System.out.println("Database..");
	            stmt = conn.createStatement();
	            


	            PrintWriter pw = res.getWriter();
	            res.setContentType("text/html");
	            
	            String location = req.getParameter("location");
	            String date_start = req.getParameter("date_start");
	            String date_end=req.getParameter("date_end");
	            String description=req.getParameter("description");
	            String []services = req.getParameterValues("services");
	            int service_binary=0;
	            
	            for (String service : services) {
		            System.out.println(service);
		            switch (service) {
		            	case "keep_pets":
		            		service_binary+=100;
		            		break;
		            	case "water_plants":
		            		service_binary+=10;
		            		break;
		            	case "clean_house":
		            		service_binary+=1;
		            		break;
		            }
	            }
	            
	            String []limitations = req.getParameterValues("limitations");
	            int limitation_binary=0;
	            
	            for (String limitation : limitations) {
		            System.out.println(limitation);
		            switch (limitation) {
		            	case "No_smoking":
		            		limitation_binary+=1000;
		            		break;
		            	case "No_night_disturbance":
		            		limitation_binary+=100;
		            		break;
		            	case "No_children":
		            		limitation_binary+=10;
		            		break;
		            	case "No_pets":
		            		limitation_binary+=1;
		            		break;	
		            }
	            }
	            
	            
	            InputStream inputStream = null; // input stream of the upload file
	            
	            // obtains the upload file part in this multipart request
	            Part filePart = req.getPart("offer_image");
	            if (filePart != null) {
	                // prints out some information for debugging
	                System.out.println(filePart.getName());
	                System.out.println(filePart.getSize());
	                System.out.println(filePart.getContentType());
	                 
	                // obtains input stream of the upload file
	                inputStream = filePart.getInputStream();
	            }
	            
	            PreparedStatement pst = null;
	            
	            String sql_query_ai = "SELECT AUTO_INCREMENT FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'NUCLEUS' AND   TABLE_NAME   = 'OFFER'";
	            
	            pst = conn.prepareStatement(sql_query_ai);
	            
	            ResultSet resultSet;
	            int ai_value = 1;
	            resultSet = pst.executeQuery();
	            while(resultSet.next()){
	             ai_value = resultSet.getInt("AUTO_INCREMENT");
	            System.out.println(ai_value + "boop");
	            }
	            
	            String sql_offer = "INSERT INTO OFFER(ID_Owner, Date_start, Date_end, Location, Description, Service_binary, Limitation_binary) values(?,?,?,?,?,?,?)" ;
	            pst = conn.prepareStatement(sql_offer);
	            pst.setInt(1,1);
	            pst.setDate(2, Date.valueOf(date_start));
	            pst.setDate(3, Date.valueOf(date_end));
	            pst.setString(4, location);
	            pst.setString(5, description);
	            pst.setInt(6,service_binary);
	            pst.setInt(7,limitation_binary);
	            
	            int row = pst.executeUpdate();
	            
	            String sql_image = "INSERT INTO OFFER_IMAGE(OFFER_IMAGE_VALUE, ID_OFFER, ID_MEMBER, DATE, SIZE) values(?,?,?,?,?)" ;
	            pst = conn.prepareStatement(sql_image);
	            
	            
	            if (inputStream != null) {
	                // fetches input stream of the upload file for the blob column
	                pst.setBlob(1, inputStream);
	            }
	            
	            pst.setInt(2, ai_value);
	            pst.setInt(3, 1);
	            pst.setDate(4, Date.valueOf(date_start));
	            pst.setInt(5, (int) filePart.getSize());
	            
	            row = pst.executeUpdate();
	            
	            
	            // rows affected
	            System.out.println(row); //1
	            res.sendRedirect(req.getContextPath() + "/offerCreated.jsp");

	        } catch (ClassNotFoundException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }

	    }

	}