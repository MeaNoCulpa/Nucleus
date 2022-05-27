package model;

import jakarta.servlet.http.Part;

public class OfferBean {
	private String location, date_start, date_end, description;
	private String[] services, limitations;
	
	private Part offer_image;
	
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
	public String[] getServices() {
		return services;
	}
	public void setServices(String[] services) {
		this.services = services;
	}
	public String[] getLimitations() {
		return limitations;
	}
	public void setLimitations(String[] limitations) {
		this.limitations = limitations;
	}
	public Part getOffer_image() {
		return offer_image;
	}
	public void setOffer_image(Part offer_image) {
		this.offer_image = offer_image;
	}

}
