package model.messages;

import java.sql.Date;

public class MessageBean {
	private int idConversation, idSender;
	private String content;
	private Date date;

    public int getIdConversation() {
        return idConversation;
    }

    public void setIdConversation(int IdConversation) {
        this.idConversation = IdConversation;
    }

    public int getIdSender() {
        return idSender;
    }

    public void setIdSender(int idSender) {
        this.idSender= idSender;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
