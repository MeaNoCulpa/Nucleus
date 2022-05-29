package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.login.LoginBean;
import model.login.LoginDao;
import java.io.IOException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


/**
 * Servlet implementation class LoginController
 */

public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
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
		if (request.getParameter("login_btn") != null) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            try {
                // getInstance() method is called with algorithm SHA-512
                MessageDigest md = MessageDigest.getInstance("SHA-512");
      
                // digest() method is called
                // to calculate message digest of the input string
                // returned as array of byte
                byte[] messageDigest = md.digest(password.getBytes());
      
                // Convert byte array into signum representation
                BigInteger no = new BigInteger(1, messageDigest);
      
                // Convert message digest into hex value
                String hashtext = no.toString(16);
      
                // Add preceding 0s to make it 32 bit
                while (hashtext.length() < 32) {
                    hashtext = "0" + hashtext;
                }
                
                LoginBean loginBean = new LoginBean();

	            loginBean.setUsername(username);
	            loginBean.setPassword(hashtext);
	
	            LoginDao loginDao = new LoginDao();
	
	            String authorise = loginDao.authoriseLogin(loginBean);
	            String firstname = loginDao.getFirstnameFromDataBase(loginBean);
	            String lastname = loginDao.getLastnameFromDataBase(loginBean);
	            int idMember = loginDao.getIdFromDataBase(loginBean);
	            loginBean.setId(idMember);
	
	            if (authorise.equals("SUCCESS LOGIN")) {
	                HttpSession session = request.getSession();
	                session.setAttribute("username", loginBean.getUsername());
	                session.setAttribute("password", hashtext);
	                session.setAttribute("firstname", firstname);
	                session.setAttribute("lastname", lastname);
	                session.setAttribute("idMember", idMember);
	                response.sendRedirect("index.jsp");
	                //RequestDispatcher requestDispatcher = request.getRequestDispatcher("welcome.jsp");
	                //requestDispatcher.forward(request, response);
	            }
	            if (authorise.equals("SUCCESS ADMIN LOGIN")) {
	            	HttpSession session = request.getSession();
	            	session.setAttribute("username", loginBean.getUsername());
	                session.setAttribute("password", hashtext);
	                session.setAttribute("firstname", firstname);
	                session.setAttribute("lastname", lastname);
	                session.setAttribute("idMember", idMember);
	                session.setAttribute("role", loginBean.getRole());
	                response.sendRedirect("index.jsp");
	            }
	            else {
	            	System.out.println("LOGIN UNSUCCESSFUL");
	            	RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
	                requestDispatcher.include(request, response);
	            }
            }
            // For specifying wrong message digest algorithms
            catch (NoSuchAlgorithmException e) {
                throw new RuntimeException(e);
            }
            
        }


}
}

