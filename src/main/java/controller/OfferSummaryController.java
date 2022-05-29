package controller;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.offer.OfferBean;
import model.offer.OfferDao;
import model.offer.RequestBean;
import utility.ServletUtility;

/**
 * Servlet implementation class OfferSummaryController
 */

public class OfferSummaryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OfferSummaryController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int idMember = (int) session.getAttribute("idMember");
		
		try {
			OfferDao offerDao = new OfferDao();
			List<OfferBean> offerBeanList = offerDao.getAllOffers(idMember);
			List<RequestBean> requestBeanList = offerDao.getAllRequests(idMember);
			request.setAttribute("offerBeanList", offerBeanList);
			request.setAttribute("requestBeanList", requestBeanList);
			
			ServletUtility.forward("offerSummary.jsp", request, response);
	        
	        
	        
	        
		} catch (Exception e) {
			System.out.println(e);
			throw e;
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	
}
