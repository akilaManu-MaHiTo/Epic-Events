package com.model.plan;


public class Anniversary extends EventPlan{
	
	private int period;

	public Anniversary(String firstName, String lastName, String date, int period) {
		super(firstName, lastName, date);
		// TODO Auto-generated constructor stub
		this.period = period;
	}

	/**
	 * @return the period
	 */
	public int getPeriod() {
		return period;
	}

	/**
	 * @param period the period to set
	 */
	public void setPeriod(int period) {
		this.period = period;
	}

}
