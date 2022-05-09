package com.example.nucleus.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.example.nucleus.model.RegisterBean;
import com.example.nucleus.model.RegisterDao;

/**
 * Servlet implementation class RegisterController
 */
public class RegisterController extends HttpServlet{
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
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	        if (request.getParameter("register_btn") != null) {
	            //String firstname = request.getParameter("firstname");
	            //String lastname = request.getParameter("lastname");
	            String username = request.getParameter("username");
	            String password = request.getParameter("password");

	            RegisterBean registerBean = new RegisterBean();

	            //registerBean.setFirstname(firstname);
	            //registerBean.setLastname(lastname);
	            registerBean.setUsername(username);
	            registerBean.setPassword(password);

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
	}

}
