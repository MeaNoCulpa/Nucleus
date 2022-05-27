package com.example.nucleus.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import com.example.nucleus.model.RegisterBean;
import com.example.nucleus.model.SettingsBean;
import com.example.nucleus.model.SettingsDao;
import com.example.nucleus.model.messages.ConversationDao;
import com.example.nucleus.model.messages.MessageBean;
import com.example.nucleus.model.messages.MessageDao;

public class ConversationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public static int getIdConversation() {
		// TODO getIdConversation
		return 1;
	}
	
	public static String getSecondMember(int idConversation, int idCurrentMember) {
		ConversationDao conversationDao = new ConversationDao();
		List<RegisterBean> members = conversationDao.getMembersConversation(idConversation);
		
		if(members.get(0).getIdMember() == idCurrentMember) {
			return members.get(1).getFirstname() + " " + members.get(1).getLastname(); 
		}
		return members.get(0).getFirstname() + " " + members.get(0).getLastname(); 
	}
	
	public static String getAllMessages() {
		
		return "<p></p>";
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
		}
		response.sendRedirect("conversations.jsp");
	}
}
