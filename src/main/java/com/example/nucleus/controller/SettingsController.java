package com.example.nucleus.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import com.example.nucleus.model.SettingsBean;
import com.example.nucleus.model.SettingsDao;

public class SettingsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getParameter("settings_email_btn") != null) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            SettingsBean settingsBean = new SettingsBean();
            settingsBean.setEmail(username);
            settingsBean.setPassword(password);
            
            HttpSession session = request.getSession();
            String currentUsername = (String) session.getAttribute("username");
            System.out.println(currentUsername);
            
            SettingsDao settingsDao = new SettingsDao();
            //settingsDao.getIDFromDataBase(settingsBean);
            
            String authorise = settingsDao.authoriseSettings(settingsBean, currentUsername);
            System.out.println(authorise);
            
            if (authorise.equals("SUCCESS")) {
                session.setAttribute("username", settingsBean.getEmail());
                response.sendRedirect("index.jsp");
                //RequestDispatcher requestDispatcher = request.getRequestDispatcher("welcome.jsp");
                //requestDispatcher.forward(request, response);
            }
            else {
            	response.sendRedirect("settings.jsp");
                //request.setAttribute("WrongLoginMsg", authorise);
                //RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
                //requestDispatcher.include(request, response);
            }
		}

		if (request.getParameter("settings_password_btn") != null) {
			String currentPassword = request.getParameter("current-password");
			String newPassword = request.getParameter("new-password");
			String newPasswordConfirmation = request.getParameter("new-password-confirmation");
			
			HttpSession session = request.getSession();
            String username = (String) session.getAttribute("username");
			
			if (newPassword.equals(newPasswordConfirmation)) {
				SettingsBean settingsBean = new SettingsBean();
				settingsBean.setPassword(newPassword);
				settingsBean.setEmail(username);
			
				SettingsDao settingsDao = new SettingsDao();
				String authorise = settingsDao.authoriseSettingsPassword(settingsBean, currentPassword);
			
				if (authorise.equals("Success")) {
					response.sendRedirect("index.jsp");
				}
				else {
					response.sendRedirect("settings.jsp");
				}
			}
			
		}
		
		if (request.getParameter("settings_lname_btn") != null) {
			String newLastname = request.getParameter("lastname");
			
			HttpSession session = request.getSession();
            String currentLastname = (String) session.getAttribute("lastname");
            String username = (String) session.getAttribute("username");
            String password = (String) session.getAttribute("password");
            
            String authoriseL = "";
            
			if (newLastname != currentLastname && newLastname != "") {
				SettingsBean settingsBean = new SettingsBean();
				settingsBean.setLastname(newLastname);
				settingsBean.setEmail(username);
				settingsBean.setPassword(password);
				
				SettingsDao settingsDao = new SettingsDao();
				authoriseL = settingsDao.authoriseSettingsLastname(settingsBean, currentLastname);
				
				session.setAttribute("lastname", newLastname);
			}
			
			if (authoriseL.equals("Success")) {
				response.sendRedirect("index.jsp");
			}
			else {
				response.sendRedirect("settings.jsp");
			}
			
		}
		
		if (request.getParameter("settings_fname_btn") != null) {
			String newFirstname = request.getParameter("firstname");
			
			HttpSession session = request.getSession();
			String currentFirstname = (String) session.getAttribute("firstname");
            String username = (String) session.getAttribute("username");
            String password = (String) session.getAttribute("password");
            
            String authoriseF = "";
            
            if (newFirstname != currentFirstname && newFirstname != "") {
				SettingsBean settingsBean = new SettingsBean();
				settingsBean.setFirstname(newFirstname);
				settingsBean.setEmail(username);
				settingsBean.setPassword(password);
				
				SettingsDao settingsDao = new SettingsDao();
				authoriseF = settingsDao.authoriseSettingsFirstname(settingsBean, currentFirstname);
				
				session.setAttribute("firstname", newFirstname);

			}
            
            if (authoriseF.equals("Success")) {
				response.sendRedirect("index.jsp");
			}
			else {
				response.sendRedirect("settings.jsp");
			}
		}
	}
}