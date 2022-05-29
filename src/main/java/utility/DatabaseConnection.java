package utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	
	public static Connection initialiseDatabase()  throws SQLException, ClassNotFoundException {
		String DBDRIVER = "com.mysql.cj.jdbc.Driver";
		String DBURL = "jdbc:mysql://localhost:3306/Nucleus";
		String DBLOGIN = "root";
		String DBPASSWORD = "root";
		
		Connection connection = null;
		
		Class.forName(DBDRIVER);
		connection = DriverManager.getConnection(DBURL, DBLOGIN, DBPASSWORD);
		
		return connection;
	}
}
