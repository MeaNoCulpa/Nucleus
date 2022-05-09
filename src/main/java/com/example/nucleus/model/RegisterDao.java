package com.example.nucleus.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class RegisterDao {
	public String authoriseRegister(RegisterBean registerBean) {
        //String firstname = registerBean.getFirstname();
        //String lastname = registerBean.getLastname();
        String username = registerBean.getUsername();
        String password = registerBean.getPassword();

        String DBURL = "jdbc:mysql://localhost:3306/Nucleus";
        String DBLOGIN = "root";
        String DBPASSWORD = "root";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DBURL, DBLOGIN, DBPASSWORD);

            PreparedStatement preparedStatement = null;

            String query = "insert into member(Username,Password,Role) values(?,?,?)";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            preparedStatement.setString(3, "user");
            preparedStatement.executeUpdate();

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
