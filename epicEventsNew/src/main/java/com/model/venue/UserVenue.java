package com.model.venue;

public class UserVenue {
	
	private int userId;	
	private int detailId;
	private int venueId;
	private String venueName;
	private String address;
	private int capacity;	
	private String venuePrice;
	private double venuePriceD;
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
	 * @return the venueName
	 */
	public String getVenueName() {
		return venueName;
	}
	/**
	 * @param venueName the venueName to set
	 */
	public void setVenueName(String venueName) {
		this.venueName = venueName;
	}
	
	/**
	 * @return the venueId
	 */
	public int getVenueId() {
		return venueId;
	}
	/**
	 * @param venueId the venueId to set
	 */
	public void setVenueId(int venueId) {
		this.venueId = venueId;
	}

	/**
	 * @return the userId
	 */
	public int getUserId() {
		return userId;
	}
	/**
	 * @param userId the userId to set
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}
	/**
	 * @return the detailId
	 */
	public int getDetailId() {
		return detailId;
	}
	/**
	 * @param detailId the detailId to set
	 */
	public void setDetailId(int detailId) {
		this.detailId = detailId;
	}
	/**
	 * @return the venuePrice
	 */
	public String getVenuePrice() {
		return venuePrice;
	}
	/**
	 * @param venuePrice the venuePrice to set
	 */
	public void setVenuePrice(String venuePrice) {
		this.venuePrice = venuePrice;
	}
	/**
	 * @return the venuePriceD
	 */
	public double getVenuePriceD() {
		return venuePriceD;
	}
	/**
	 * @param venuePriceD the venuePriceD to set
	 */
	public void setVenuePriceD(double venuePriceD) {
		this.venuePriceD = venuePriceD;
	}
		

}
