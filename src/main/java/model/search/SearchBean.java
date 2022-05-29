package model.search;

public class SearchBean {
	private int IdOffer, IdOwner;
	private String DateStart, DateEnd, Location, Description;
	
	public String getLocation() {
		return Location;
	}
	public void setLocation(String location) {
		Location = location;
	}
	public String getDateStart() {
		return DateStart;
	}
	public void setDateStart(String dateStart) {
		DateStart = dateStart;
	}
	public String getDateEnd() {
		return DateEnd;
	}
	public void setDateEnd(String dateEnd) {
		DateEnd = dateEnd;
	}
	public int getIdOffer() {
		return IdOffer;
	}
	public void setIdOffer(int idOffer) {
		IdOffer = idOffer;
	}
	public int getIdOwner() {
		return IdOwner;
	}
	public void setIdOwner(int idOwner) {
		IdOwner = idOwner;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
}
