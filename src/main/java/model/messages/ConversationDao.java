package model.messages;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.register.RegisterBean;
import utility.DatabaseConnection;

public class ConversationDao {

	public int createConversation(ConversationBean conversationBean) {
		int idMember1 = conversationBean.getIdMember1();
		int idMember2 = conversationBean.getIdMember2();

        try {
        	Connection connection = DatabaseConnection.initialiseDatabase();
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
        	Connection connection = DatabaseConnection.initialiseDatabase();
            PreparedStatement preparedStatement = null;

            String query = "SELECT * FROM member INNER JOIN conversation ON member.ID_Member=conversation.ID_Member1 OR member.ID_Member=conversation.ID_Member2 WHERE ID_Conversation = ?;";
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
	
	public List<ConversationBean> getAllConversations(int idCurrentMember) {
		try {
			Connection connection = DatabaseConnection.initialiseDatabase();
            PreparedStatement preparedStatement = null;

            String query = "SELECT * FROM conversation WHERE ID_Member1 = ? OR ID_Member2 = ?;";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idCurrentMember);
            preparedStatement.setInt(2, idCurrentMember);
            ResultSet resultSet = preparedStatement.executeQuery();
            
            List<ConversationBean> allConversations = new ArrayList<>();
            while(resultSet.next()) {
            	ConversationBean conversation = new ConversationBean();
            	conversation.setIdConversation(resultSet.getInt("ID_Conversation"));
            	conversation.setIdMember1(resultSet.getInt("ID_Member1"));
            	conversation.setIdMember2(resultSet.getInt("ID_Member2"));
            	allConversations.add(conversation);
            }
            preparedStatement.close();
            connection.close();
            return allConversations;
        }
        catch (Exception e) {
            e.printStackTrace();
        }
		
		return null;
	}
}
