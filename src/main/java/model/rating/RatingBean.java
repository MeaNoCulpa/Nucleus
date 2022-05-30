package model.rating;

import java.sql.Blob;
import java.util.List;

import jakarta.servlet.http.Part;

public class RatingBean {
	private String Date;
	private int ID_Rating, ID_Offer, ID_Member, Value;
	public String getDate() {
		return Date;
	}
	public void setDate(String date) {
		Date = date;
	}
	public int getID_Rating() {
		return ID_Rating;
	}
	public void setID_Rating(int iD_Rating) {
		ID_Rating = iD_Rating;
	}
	public int getID_Offer() {
		return ID_Offer;
	}
	public void setID_Offer(int iD_Offer) {
		ID_Offer = iD_Offer;
	}
	public int getID_Member() {
		return ID_Member;
	}
	public void setID_Member(int iD_Member) {
		ID_Member = iD_Member;
	}
	public int getValue() {
		return Value;
	}
	public void setValue(int value) {
		Value = value;
	}
	

}
