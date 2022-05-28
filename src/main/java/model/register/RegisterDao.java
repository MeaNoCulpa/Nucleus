package model.register;

import java.sql.Connection;
import java.sql.PreparedStatement;
import utility.DatabaseConnection;

public class RegisterDao {
	
	public String authoriseRegister(RegisterBean registerBean) {
		
        String firstname = registerBean.getFirstname();
        String lastname = registerBean.getLastname();
        String email = registerBean.getEmail();
        String password = registerBean.getPassword();

        try {
        	Connection connection = DatabaseConnection.initialiseDatabase();
            PreparedStatement preparedStatement = null;

            String query = "INSERT INTO member(Username,Password,Firstname,Lastname,Role) values(?,?,?,?,?)";
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
