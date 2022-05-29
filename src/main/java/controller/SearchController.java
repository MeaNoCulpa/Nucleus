package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.search.SearchBean;
import model.search.SearchDao;
import utility.ServletUtility;

/**
 * Servlet implementation class SearchController
 */
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		String location = request.getParameter("location");
		SearchDao searchDao = new SearchDao();
		
		List<SearchBean> search = null;
		search = (List<SearchBean>) searchDao.getSearchResultFromLocation(location);
		
		if (search == null || search.size() == 0) {
			ServletUtility.setErrorMessage("Pas de résultat !", request);
		}
		
		ServletUtility.setList(search, request);
		ServletUtility.forward("search.jsp", request, response);
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
