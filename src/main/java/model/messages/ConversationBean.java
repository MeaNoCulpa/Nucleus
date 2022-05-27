package model.messages;

public class ConversationBean {
	private int idConversation, idMember1, idMember2;

    public int getIdMember1() {
        return idMember1;
    }

    public void setIdMember1(int idMember1) {
        this.idMember1 = idMember1;
    }

    public int getIdMember2() {
        return idMember2;
    }

    public void setIdMember2(int idMember2) {
        this.idMember2 = idMember2;
    }

	public int getIdConversation() {
		return idConversation;
	}

	public void setIdConversation(int idConversation) {
		this.idConversation = idConversation;
	}
}
