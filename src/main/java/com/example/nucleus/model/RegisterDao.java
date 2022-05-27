package com.example.nucleus.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class RegisterDao {
	
	private final String DBURL = "jdbc:mysql://localhost:3306/NUCLEUS";
    private final String DBLOGIN = "root";
    private final String DBPASSWORD = "root";
    
	public String authoriseRegister(RegisterBean registerBean) {
		
        String firstname = registerBean.getFirstname();
        String lastname = registerBean.getLastname();
        String email = registerBean.getEmail();
        String password = registerBean.getPassword();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DBURL, DBLOGIN, DBPASSWORD);

            PreparedStatement preparedStatement = null;

            String query = "insert into member(Username,Password,Firstname,Lastname,Role) values(?,?,?,?,?)";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            preparedStatement.setString(3, firstname);
            preparedStatement.setString(4, lastname);
            preparedStatement.setString(5, "user");
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
