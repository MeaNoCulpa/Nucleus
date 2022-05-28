package controller;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.user.EditBean;
import model.user.EditDao;
import utility.ServletUtility;

/**
 * Servlet implementation class EditController
 */
public class EditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EditDao userModel = new EditDao();
		long id = Long.parseLong(request.getParameter("id"));
		  if (id > 0) {
			    EditBean userBean = null;
			    userBean = userModel.FindByPk(id);
			    request.setAttribute("bean", userBean);
		  }
		request.getRequestDispatcher("edit.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EditBean user = new EditBean();
	    user.setFirstname(request.getParameter("firstname"));
	    user.setLastname(request.getParameter("lastname"));
	    user.setEmail(request.getParameter("email"));
	    user.setRole(request.getParameter("role"));
	    user.setId(Long.parseLong(request.getParameter("id")));
	    
	    if (user.getId() > 0) {
	        //To Update the records
	         long i = EditDao.UpdateUser(user);
	            if (i > 0) {
	              ServletUtility.setSuccessMessage("L'utilisateur a bien été mis à jour", request);
	              
	            }
	            else {
	              ServletUtility.setErrorMessage("Non inséré", request);
	            }

	    }
	    request.getRequestDispatcher("edit.jsp").forward(request, response);
	}

}
