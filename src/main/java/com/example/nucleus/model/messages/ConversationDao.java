package com.example.nucleus.model.messages;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.example.nucleus.model.RegisterBean;

public class ConversationDao {
    String DBURL = "jdbc:mysql://localhost:3306/Nucleus";
    String DBLOGIN = "root";
    String DBPASSWORD = "root";

	public int createConversation(ConversationBean conversationBean) {
		int idMember1 = conversationBean.getIdMember1();
		int idMember2 = conversationBean.getIdMember2();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DBURL, DBLOGIN, DBPASSWORD);
            PreparedStatement preparedStatement = null;

            String query = "INSERT INTO conversation(ID_Member_1, ID_Member_2) VALUES(?,?)";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idMember1);
            preparedStatement.setInt(2, idMember2);
            preparedStatement.executeUpdate();
            preparedStatement.close();
            
            query = "SELECT LAST(ID_Conversation) FROM conversation ";
            preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            int idConversation = resultSet.getInt("ID_Conversation");
            preparedStatement.close();
            connection.close();

            return idConversation;
        }
        catch (Exception e) {
            e.printStackTrace();
        }
		return -1;
	}
	
	public List<RegisterBean> getMembersConversation(int idConversation) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DBURL, DBLOGIN, DBPASSWORD);
            PreparedStatement preparedStatement = null;

            String query = "SELECT * FROM member INNER JOIN conversation ON member.ID_Member=conversation.ID_Member1 OR member.ID_Member=conversation.ID_Member2 WHERE ID_Conversation = ?;";
            // TODO ajouter membre 2
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idConversation);
            ResultSet resultSet = preparedStatement.executeQuery();
            
            List<RegisterBean> membersConversation = new ArrayList<>();
            while(resultSet.next()) {
            	RegisterBean member = new RegisterBean();
            	member.setFirstname(resultSet.getString("firstname"));
            	member.setLastname(resultSet.getString("lastname"));
            	member.setIdMember(resultSet.getInt("ID_Member"));
            	membersConversation.add(member);
            }
            preparedStatement.close();
            connection.close();
            return membersConversation;
        }
        catch (Exception e) {
            e.printStackTrace();
        }
		
		return new ArrayList<RegisterBean>();
	} 
}