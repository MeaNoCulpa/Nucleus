package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.offer.OfferBean;
import model.offer.OfferDao;
import java.io.IOException;
import java.util.Arrays;
import utility.ServletUtility;




/**
 * Servlet implementation class Creation_query
 */

@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class OfferCreationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
        
	 	static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	    static final String DB_URL = "jdbc:mysql://localhost:3306/NUCLEUS";
	    static final String USER = "root";
	    static final String PASS = "root";

	    protected void doPost(HttpServletRequest req, HttpServletResponse res)
	            throws ServletException, IOException {	       
	    		HttpSession session = req.getSession();
	    	
	    		int id_owner = (int) session.getAttribute("idMember");
	            String location = req.getParameter("location");
	            String date_start = req.getParameter("date_start");
	            String date_end=req.getParameter("date_end");
	            String description=req.getParameter("description");
	            String[] services = req.getParameterValues("services");
	            String[] limitations = req.getParameterValues("limitations");
	            Part offer_image = (Part) req.getPart("offer_image");
	            
	            
	            OfferBean offerBean = new OfferBean();
	            offerBean.setId_owner(id_owner);
	            offerBean.setLocation(location);
	            offerBean.setDate_start(date_start);
	            offerBean.setDate_end(date_end);
	            offerBean.setDescription(description);
	            if (services!=null) {
	            offerBean.setServices(Arrays.asList(services));}
	            if (limitations!=null) {
	            offerBean.setLimitations(Arrays.asList(limitations));}
	            offerBean.setOffer_image(offer_image);
	            
	            OfferDao offerDao = new OfferDao();
	            offerDao.authoriseCreation(offerBean);
	            

	            ServletUtility.forward("offerSummaryController", req, res);


	    }

	}