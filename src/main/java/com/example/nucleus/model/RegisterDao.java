package com.example.nucleus.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class RegisterDao {
    public String authoriseRegister(RegisterBean registerBean) {
        String firstname = registerBean.getFirstname();
        String lastname = registerBean.getLastname();
        String username = registerBean.getUsername();
        String password = registerBean.getPassword();

        String DBURL = "jdbc:mysql://localhost:3306/nucleus";
        String DBLOGIN = "root";
        String DBPASSWORD = "root";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DBURL, DBLOGIN, DBPASSWORD);

            PreparedStatement preparedStatement = null;

            preparedStatement = connection.prepareStatement("insert into member('Username', 'Password', 'Rank') values(?, ?, ?)");
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            preparedStatement.setString(3, "admin");
            preparedStatement.executeQuery();

            preparedStatement.close();

            connection.close();

            return "SUCCESS REGISTER";
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return "FAIL REGISTER";
    }
}
