package com.MVC.Model;

public class Feedback {
private String id;
private String Message;
private String Rating;
private String date;
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getMessage() {
	return Message;
}
public void setMessage(String message) {
	Message = message;
}
public String getRating() {
	return Rating;
}
public void setRating(String rating) {
	Rating = rating;
}
public String getDate() {
	return date;
}
public void setDate(String date) {
	this.date = date;
}
}
