package controller;

import java.io.IOException;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.RegisterBean;
import model.RegisterDao;

/**
 * Servlet implementation class RegisterController
 */
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
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
		
	        if (request.getParameter("register_btn") != null) {
	            String firstname = request.getParameter("firstname");
	            String lastname = request.getParameter("lastname");
	            String email = request.getParameter("email");
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
	      
	                // return the HashText
	                //return hashtext;
	                RegisterBean registerBean = new RegisterBean();

		            registerBean.setFirstname(firstname);
		            registerBean.setLastname(lastname);
		            registerBean.setEmail(email);
		            registerBean.setPassword(hashtext);
	
		            RegisterDao registerDao = new RegisterDao();
	
		            String registerValidate = registerDao.authoriseRegister(registerBean);
	
		            if (registerValidate.equals("SUCCESS REGISTER")) {
		                request.setAttribute("RegisterSuccessMsg", registerValidate);
		                RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
		                requestDispatcher.forward(request, response);
		            }
	
		            else {
		                request.setAttribute("RegisterErrorMsg", registerValidate);
		                RequestDispatcher requestDispatcher = request.getRequestDispatcher("register.jsp");
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
