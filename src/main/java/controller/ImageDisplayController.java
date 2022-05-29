package controller;

import jakarta.servlet.http.HttpServlet;

import java.sql.Statement;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ImageDisplay
 */
@WebServlet("/ImageDisplay")
public class ImageDisplayController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImageDisplayController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Blob image = null;
		Connection con = null;
		byte[ ] imgData = null ;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			String connectionUrl = "jdbc:mysql://localhost:3306/NUCLEUS";
			String userid = "root";
			String password = "root";
		    Class.forName("com.mysql.cj.jdbc.Driver");
		    con = DriverManager.getConnection(connectionUrl, userid, password);
		    stmt = con.createStatement();
		    rs = stmt.executeQuery("select OFFER_IMAGE_VALUE from OFFER_IMAGE ORDER BY ID_OFFER_IMAGE DESC LIMIT 1");
		    if (rs.next()) {
		    image = rs.getBlob(1);
		    imgData = image.getBytes(1,(int)image.length());
		    } 
		    else {
		    System.out.println("Display Blob Example");
		    System.out.println("image not found for given id>");
		    		
		    return;
		    }
		    // display the image
		    
		    response.setContentType("image/png");
		    OutputStream o = response.getOutputStream();
		    o.write(imgData);
		    o.flush();
		    o.close();
		    
		} catch (Exception e) {
		        System.out.println("Unable To Display image");
		    	System.out.println("Image Display Error=" + e.getMessage());
		    	return;
		    	
		    } 	finally {
		    
		    try {
			    rs.close();
			    stmt.close();
			    con.close();
			    
		    } catch (SQLException e) {
		    
		   		e.printStackTrace();
		    
		    }

		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
