package com.model.payment;

public class Payment {
	
	private int payment_id;
	
	private String creditType;
	
	private String cardNo;
	
	private String expDate;
	
	private String cvv;
	
	private String cardHolder;
	
	private String accept;
	
	private double price;
	
	private String eventName;
	
	

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
	 * @return the payment_id
	 */
	public int getPayment_id() {
		return payment_id;
	}

	/**
	 * @param payment_id the payment_id to set
	 */
	public void setPayment_id(int payment_id) {
		this.payment_id = payment_id;
	}

	/**
	 * @return the cardHolder
	 */
	public String getCardHolder() {
		return cardHolder;
	}

	/**
	 * @param cardHolder the cardHolder to set
	 */
	public void setCardHolder(String cardHolder) {
		this.cardHolder = cardHolder;
	}

	/**
	 * @return the creditType
	 */
	public String getCreditType() {
		return creditType;
	}

	/**
	 * @param creditType the creditType to set
	 */
	public void setCreditType(String creditType) {
		this.creditType = creditType;
	}

	/**
	 * @return the cardNo
	 */
	public String getCardNo() {
		return cardNo;
	}

	/**
	 * @param cardNo the cardNo to set
	 */
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	/**
	 * @return the expDate
	 */
	public String getExpDate() {
		return expDate;
	}

	/**
	 * @param expDate the expDate to set
	 */
	public void setExpDate(String expDate) {
		this.expDate = expDate;
	}

	/**
	 * @return the cvv
	 */
	public String getCvv() {
		return cvv;
	}

	/**
	 * @param cvv the cvv to set
	 */
	public void setCvv(String cvv) {
		this.cvv = cvv;
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
