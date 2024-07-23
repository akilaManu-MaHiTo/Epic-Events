package com.model.plan;


public class Graduation extends EventPlan{
	
	private int year;

	public Graduation(String firstName, String lastName, String date, int year) {
		super(firstName, lastName, date);
		// TODO Auto-generated constructor stub
		this.year = year; 
	}

	/**
	 * @return the year
	 */
	public int getYear() {
		return year;
	}

	/**
	 * @param year the year to set
	 */
	public void setYear(int year) {
		this.year = year;
	}

}
