package com.example.nucleus.controller;

import com.example.nucleus.model.RegisterBean;
import com.example.nucleus.model.RegisterDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/registerController")
public class RegisterController {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("register_btn") != null) {
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            RegisterBean registerBean = new RegisterBean();

            registerBean.setFirstname(firstname);
            registerBean.setLastname(lastname);
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
