package com.example.nucleus.model.messages;

import java.sql.Date;

public class Message {

    private final int idSender;
    private final String content;
    private final Date date;

    public Message(int idSender, String content, Date date) {
        this.idSender = idSender;
        this.content = content;
        this.date = date;
    }

    public int getIdSender() { return idSender; }
    public String getContent() { return content; }
    public Date getDate() { return date; }
}