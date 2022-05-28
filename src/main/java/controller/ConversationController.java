package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import model.register.RegisterBean;
import model.messages.ConversationBean;
import model.messages.ConversationDao;
import model.messages.MessageBean;
import model.messages.MessageDao;

public class ConversationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public static String getAllConversations(int idCurrentMember) {
		ConversationDao conversationDao = new ConversationDao();
		List<ConversationBean> allConversations = conversationDao.getAllConversations(idCurrentMember);
		String outStr = "";
		for (ConversationBean conversation : allConversations) {
			String secondMember = getSecondMember(String.valueOf(conversation.getIdConversation()), idCurrentMember);
			int idConversation = conversation.getIdConversation();
			outStr += "<a href=\"conversations.jsp?idConversation=" + idConversation + "\">" + secondMember + "</a>";
		}
		return outStr;
	}
	
	public static String getSecondMember(String idConversationStr, int idCurrentMember) {
		if (idConversationStr == "null") {
			return "";
		}
		int idConversation = Integer.parseInt(idConversationStr);
		ConversationDao conversationDao = new ConversationDao();
		List<RegisterBean> members = conversationDao.getMembersConversation(idConversation);
		
		if(members.get(0).getIdMember() == idCurrentMember) {
			return members.get(1).getFirstname() + " " + members.get(1).getLastname(); 
		}
		return members.get(0).getFirstname() + " " + members.get(0).getLastname(); 
	}
	
	public static String getAllMessages(String idConversationStr, int idCurrentMember) {
		if (idConversationStr == "null") {
			return "";
		}
		int idConversation = Integer.parseInt(idConversationStr);
		MessageDao messageDao = new MessageDao();
		List<MessageBean> allMessagesConversation = messageDao.getAllMessages(idConversation);
		
		String outStr = "";
		for (MessageBean message : allMessagesConversation) {
			String style = idCurrentMember != message.getIdSender() ? " style='font-weight:bold;'" : "";
			outStr += "<p" + style + ">" + message.getContent() + "</p>"
					+ "<p>" + message.getTimestamp() + "</p>";
		}
		return outStr;
		//return outStr;
		
	}
	
 	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("content") != null) {
			String content = request.getParameter("content");
			int idConversation = Integer.parseInt(request.getParameter("idConversation"));
			HttpSession session = request.getSession();
			
			int idSender = (int) session.getAttribute("idMember");
			
			MessageBean messageBean = new MessageBean();
			messageBean.setIdConversation(idConversation);
			messageBean.setIdSender(idSender);
			messageBean.setContent(content);
			
			MessageDao messageDao = new MessageDao();
			messageDao.sendMessage(messageBean);
			response.sendRedirect("conversations.jsp?idConversation=" + idConversation);
		} else {
			response.sendRedirect("conversations.jsp");			
		}
	}
 	
 	public static String newConversation(int idMember1, int idMember2) {
 		ConversationBean conversationBean = new ConversationBean();
 		conversationBean.setIdMember1(idMember1);
 		conversationBean.setIdMember2(idMember2);
 		
 		int newIdConversation = ConversationDao.createConversation(conversationBean);
 		return String.valueOf(newIdConversation);
 	}
 	
 	public static String conversationWith(int idMember1, int idMember2) {
 		int idConversation = ConversationDao.conversationWithExist(idMember1, idMember2);
 		if (idConversation != -1) {
 			return String.valueOf(idConversation);
 		}
 		return newConversation(idMember1, idMember2);
 	}
}
