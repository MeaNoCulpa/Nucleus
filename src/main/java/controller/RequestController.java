package controller;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.offer.OfferBean;
import model.offer.OfferDao;
import model.request.RequestBean;
import model.request.RequestDao;
import utility.ServletUtility;

/**
 * Servlet implementation class RequestController
 */

public class RequestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequestController() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int idMember = (int) session.getAttribute("idMember");
		String description = request.getParameter("reqTest");
		OfferBean offerBean = (OfferBean) session.getAttribute("offerBean");
		
		RequestDao requestDao = new RequestDao();
		RequestBean requestBean = new RequestBean();
		
		requestBean.setDescription(description);
		requestBean.setId_requester(idMember);
		requestBean.setId_offer(offerBean.getId_offer());
		requestDao.createRequest(requestBean);
		ServletUtility.redirect("offerSummaryController.jsp", request, response);
	}

}
