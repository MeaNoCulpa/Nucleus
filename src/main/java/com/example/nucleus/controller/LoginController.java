package com.example.nucleus.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.example.nucleus.model.LoginBean;
import com.example.nucleus.model.LoginDao;

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
		if (request.getParameter("login_btn") != null) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            LoginBean loginBean = new LoginBean();

            loginBean.setUsername(username);
            loginBean.setPassword(password);

            LoginDao loginDao = new LoginDao();

            String authorise = loginDao.authoriseLogin(loginBean);
            String firstname = loginDao.getFirstnameFromDataBase(loginBean);
            String lastname = loginDao.getLastnameFromDataBase(loginBean);

            if (authorise.equals("SUCCESS LOGIN")) {
                HttpSession session = request.getSession();
                session.setAttribute("username", loginBean.getUsername());
                session.setAttribute("password", password);
                session.setAttribute("firstname", firstname);
                session.setAttribute("lastname", lastname);
                response.sendRedirect("index.jsp");
                //RequestDispatcher requestDispatcher = request.getRequestDispatcher("welcome.jsp");
                //requestDispatcher.forward(request, response);
            }

            else {
                request.setAttribute("WrongLoginMsg", authorise);
                request.setAttribute("WrongLoginMessage", "Le nom d'utilisateur ou le mot de passe est incorrect.");
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
                requestDispatcher.include(request, response);
            }
        }
		}


}
