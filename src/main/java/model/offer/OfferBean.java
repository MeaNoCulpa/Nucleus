package model.offer;

import java.sql.Blob;
import java.util.List;

import jakarta.servlet.http.Part;

public class OfferBean {
	private String location, date_start, date_end, description;
	private List<String> services, limitations;
	private int id_owner, id_offer;
	private Part offer_image;
	private String offer_image_string;
	
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getDate_start() {
		return date_start;
	}
	public void setDate_start(String date_start) {
		this.date_start = date_start;
	}
	public String getDate_end() {
		return date_end;
	}
	public void setDate_end(String date_end) {
		this.date_end = date_end;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
	public List<String> getServices() {
		return services;
	}
	public void setServices(List<String> services) {
		this.services = services;
	}
	public List<String> getLimitations() {
		return limitations;
	}
	public void setLimitations(List<String> limitations) {
		this.limitations = limitations;
	}
	public Part getOffer_image() {
		return offer_image;
	}
	public void setOffer_image(Part offer_image) {
		this.offer_image = offer_image;
	}
	public int getId_owner() {
		return id_owner;
	}
	public void setId_owner(int id_owner) {
		this.id_owner = id_owner;
	}
	public int getId_offer() {
		return id_offer;
	}
	public void setId_offer(int id_offer) {
		this.id_offer = id_offer;
	}
	public String getOffer_image_string() {
		return offer_image_string;
	}
	public void setOffer_image_string(String offer_image_string) {
		this.offer_image_string = offer_image_string;
	}

}
