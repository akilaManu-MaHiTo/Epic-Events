package com.model.venue;

public class Venue {
	
	private int venueId;
	private String venue_name;
	private String address;
	private int capacity;
	private double price;
	/**
	 * @return the venue_name
	 */
	public String getVenue_name() {
		return venue_name;
	}
	/**
	 * @param venue_name the venue_name to set
	 */
	public void setVenue_name(String venue_name) {
		this.venue_name = venue_name;
	}
	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}
	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}
	/**
	 * @return the capacity
	 */
	public int getCapacity() {
		return capacity;
	}
	/**
	 * @param capacity the capacity to set
	 */
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	/**
	 * @return the price
	 */
	public double getPrice() {
		return price;
	}
	/**
	 * @param price the price to set
	 */
	public void setPrice(double price) {
		this.price = price;
	}
	/**
	 * @return the venuId
	 */
	public int getVenueId() {
		return venueId;
	}
	/**
	 * @param venuId the venuId to set
	 */
	public void setVenueId(int venueId) {
		this.venueId = venueId;
	}
}
