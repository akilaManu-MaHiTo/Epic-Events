package com.model.plan;


public abstract class EventPlan {
	
	private String firstName;
	
	private String lastName;
	
	private String date;
	
    public EventPlan(String firstName, String lastName, String date) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.date = date;
    }

	/**
	 * @return the firstName
	 */
	public String getFirstName() {
		return firstName;
	}

	/**
	 * @return the date
	 */
	public String getDate() {
		return date;
	}

	/**
	 * @param date the date to set
	 */
	public void setDate(String date) {
		this.date = date;
	}

	/**
	 * @param firstName the firstName to set
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	/**
	 * @return the lastName
	 */
	public String getLastName() {
		return lastName;
	}

	/**
	 * @param lastName the lastName to set
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
		 

}
