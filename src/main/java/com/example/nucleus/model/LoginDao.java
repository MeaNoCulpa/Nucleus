package com.example.nucleus.model;

import java.sql.*;

public class LoginDao {

    public String authoriseLogin(LoginBean loginBean) {
    String username = loginBean.getUsername();
    String password = loginBean.getPassword();

    String dbUsername = "";
    String dbPassword = "";

    String url = "jdbc:mysql://localhost:3306/db_login"; // database connexion url string
    String uname = "root"; // database username
    String pass = ""; // database password

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection dbconn = DriverManager.getConnection(url, uname, pass);

        PreparedStatement preparedStatement = null;

        preparedStatement = dbconn.prepareStatement("select * from user where username=? and password=?");
        preparedStatement.setString(1, username);
        preparedStatement.setString(2, password);
        ResultSet resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
            dbUsername = resultSet.getString("username");
            dbPassword = resultSet.getString("password");

            if (username.equals(dbUsername) && password.equals(dbPassword)) {
                return "SUCCESS LOGIN";
            }
        }

        preparedStatement.close();
        dbconn.close();

    } catch (Exception e) {
        e.printStackTrace();
    }

    return "WRONG USERNAME AND PASSWORD";
    }
}
