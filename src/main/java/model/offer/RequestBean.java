package model.offer;

public class RequestBean {
	private String date, description, status;
	private int id_request, id_requester, id_offer;
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getId_request() {
		return id_request;
	}
	public void setId_request(int id_request) {
		this.id_request = id_request;
	}
	public int getId_requester() {
		return id_requester;
	}
	public void setId_requester(int id_requester) {
		this.id_requester = id_requester;
	}
	public int getId_offer() {
		return id_offer;
	}
	public void setId_offer(int id_offer) {
		this.id_offer = id_offer;
	}
	
}
