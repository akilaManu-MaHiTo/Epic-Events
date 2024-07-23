package com.model.payment;

public class UserPaymentData {
	
	private int paymentId;
	
	private String paymentPrice;
	
	private String venueName;
	
	private String eventName;
	
	private String eventPerson;
	
	private String userName;
	
	private String accept;

	/**
	 * @return the paymentPrice
	 */
	public String getPaymentPrice() {
		return paymentPrice;
	}

	/**
	 * @param paymentPrice the paymentPrice to set
	 */
	public void setPaymentPrice(String paymentPrice) {
		this.paymentPrice = paymentPrice;
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
	 * @return the eventName
	 */
	public String getEventName() {
		return eventName;
	}

	/**
	 * @param eventName the eventName to set
	 */
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	/**
	 * @return the eventPerson
	 */
	public String getEventPerson() {
		return eventPerson;
	}

	/**
	 * @param eventPerson the eventPerson to set
	 */
	public void setEventPerson(String eventPerson) {
		this.eventPerson = eventPerson;
	}

	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @return the paymentId
	 */
	public int getPaymentId() {
		return paymentId;
	}

	/**
	 * @param paymentId the paymentId to set
	 */
	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
	}

	/**
	 * @return the accept
	 */
	public String getAccept() {
		return accept;
	}

	/**
	 * @param accept the accept to set
	 */
	public void setAccept(String accept) {
		this.accept = accept;
	}

}
