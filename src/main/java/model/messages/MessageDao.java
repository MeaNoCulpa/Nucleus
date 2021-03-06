package model.messages;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import utility.DatabaseConnection;

public class MessageDao {
    
	public String sendMessage(MessageBean messageBean) {
		int idConversation = messageBean.getIdConversation();
		int idSender= messageBean.getIdSender();
		String content = messageBean.getContent();

        try {
        	Connection connection = DatabaseConnection.initialiseDatabase();
            PreparedStatement preparedStatement = null;

            String query = "insert into message(ID_Conversation, ID_sender, Content) values(?,?,?)";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idConversation);
            preparedStatement.setInt(2, idSender);
            preparedStatement.setString(3, content);
            preparedStatement.executeUpdate();
            
            preparedStatement.close();
            connection.close();

            return "Message sent";
        }
        catch (Exception e) {
            e.printStackTrace();
        }
		return "Not sent";
	}

	public List<MessageBean> getAllMessages(int idConversation) {
        try {
        	Connection connection = DatabaseConnection.initialiseDatabase();
            PreparedStatement preparedStatement = null;

            String query = "SELECT * FROM message WHERE ID_Conversation = ? ORDER BY Date";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idConversation);
            ResultSet resultSet = preparedStatement.executeQuery();
            
            List<MessageBean> messagesList = new ArrayList<>();
            while(resultSet.next()) {
            	MessageBean message = new MessageBean();
            	message.setContent(resultSet.getString("content"));
            	message.setIdSender(resultSet.getInt("ID_Sender"));
            	message.setTimestamp(resultSet.getTimestamp("date"));
            	messagesList.add(message);
            }
            preparedStatement.close();
            connection.close();
            return messagesList;
        }
        catch (Exception e) {
            e.printStackTrace();
        }
		return null;
	}
}
