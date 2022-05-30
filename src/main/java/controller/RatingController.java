package controller;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.offer.OfferBean;
import model.rating.RatingBean;
import model.rating.RatingDao;
import utility.ServletUtility;

/**
 * Servlet implementation class RatingController
 */

public class RatingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RatingController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RatingDao ratingDao = new RatingDao();
		RatingBean ratingBean = new RatingBean();
		HttpSession session = request.getSession();
		OfferBean offerBean = (OfferBean) session.getAttribute("offerBean");
		int ratingValue = Integer.parseInt(request.getParameter("ratingValue"));
		ratingBean.setID_Offer(offerBean.getId_offer());
		ratingBean.setValue(ratingValue);
		ratingBean.setID_Member((int) session.getAttribute("idMember"));
		ratingDao.createRating(ratingBean);
		ServletUtility.forward("/offerSummaryController", request, response);
		
	}

}
