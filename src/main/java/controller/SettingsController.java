package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.SettingsBean;
import model.SettingsDao;

import java.io.IOException;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SettingsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getParameter("settings_email_btn") != null) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            try {
                MessageDigest md = MessageDigest.getInstance("SHA-512");
                byte[] messageDigest = md.digest(password.getBytes());
                BigInteger no = new BigInteger(1, messageDigest);
                String hashtext = no.toString(16);
                while (hashtext.length() < 32) {
                    hashtext = "0" + hashtext;
                }
                
                SettingsBean settingsBean = new SettingsBean();
	            settingsBean.setEmail(username);
	            settingsBean.setPassword(hashtext);
	            
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
            catch (NoSuchAlgorithmException e) {
                throw new RuntimeException(e);
            }
		}

		if (request.getParameter("settings_password_btn") != null) {
			String currentPassword = request.getParameter("current-password");
			String newPassword = request.getParameter("new-password");
			String newPasswordConfirmation = request.getParameter("new-password-confirmation");
			
			
			HttpSession session = request.getSession();
            String username = (String) session.getAttribute("username");
			
			if (newPassword.equals(newPasswordConfirmation)) {
				
				try {
		            MessageDigest md = MessageDigest.getInstance("SHA-512");
		            byte[] messageDigest = md.digest(newPassword.getBytes());
		            BigInteger no = new BigInteger(1, messageDigest);
		            String hashtext = no.toString(16);
		            while (hashtext.length() < 32) {
		                hashtext = "0" + hashtext;
		            }
		            
		            byte[] messageDigestCurrentPassword = md.digest(currentPassword.getBytes());
		            BigInteger noCurrentPassword = new BigInteger(1, messageDigestCurrentPassword);
		            String hashCurrentPassword = noCurrentPassword.toString(16);
		            while (hashCurrentPassword.length() < 32) {
		            	hashCurrentPassword = "0" + hashCurrentPassword;
		            }
		            
		            SettingsBean settingsBean = new SettingsBean();
					settingsBean.setPassword(hashtext);
					settingsBean.setEmail(username);
				
					SettingsDao settingsDao = new SettingsDao();
					String authorise = settingsDao.authoriseSettingsPassword(settingsBean, hashCurrentPassword);
				
					if (authorise.equals("Success")) {
						response.sendRedirect("index.jsp");
					}
					else {
						response.sendRedirect("settings.jsp");
					}
		        }
		        catch (NoSuchAlgorithmException e) {
		            throw new RuntimeException(e);
		        }
			}
			
		}
		
		if (request.getParameter("settings_info_btn") != null) {
			String newLastname = request.getParameter("lastname");
			String newFirstname = request.getParameter("firstname");
			
			HttpSession session = request.getSession();
            String currentLastname = (String) session.getAttribute("lastname");
            String currentFirstname = (String) session.getAttribute("firstname");
            String username = (String) session.getAttribute("username");
            String password = (String) session.getAttribute("password");
            
            String authoriseL = "";
            String authoriseF = "";
            
			if (newLastname != currentLastname && newLastname != "") {
				SettingsBean settingsBean = new SettingsBean();
				settingsBean.setLastname(newLastname);
				settingsBean.setEmail(username);
				settingsBean.setPassword(password);
				
				SettingsDao settingsDao = new SettingsDao();
				authoriseL = settingsDao.authoriseSettingsLastname(settingsBean, currentLastname);
				
				session.setAttribute("lastname", newLastname);
			}
			
			if (newFirstname != currentFirstname && newFirstname != "") {
				SettingsBean settingsBean = new SettingsBean();
				settingsBean.setFirstname(newFirstname);
				settingsBean.setEmail(username);
				settingsBean.setPassword(password);
				
				SettingsDao settingsDao = new SettingsDao();
				authoriseF = settingsDao.authoriseSettingsFirstname(settingsBean, currentFirstname);
				
				session.setAttribute("firstname", newFirstname);

			}
			
			if (authoriseL.equals("Success") && authoriseF.equals("Success")) {
				response.sendRedirect("index.jsp");
			}
			else {
				response.sendRedirect("settings.jsp");
			}
		}
	}
}
