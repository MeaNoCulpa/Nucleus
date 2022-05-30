package model.request;

import java.sql.Blob;
import java.util.List;

import jakarta.servlet.http.Part;

public class RequestBean {
	int id_request, id_requester, id_offer;
	String Date, Status, Description;
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
	public String getDate() {
		return Date;
	}
	public void setDate(String date) {
		Date = date;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	
	
}
