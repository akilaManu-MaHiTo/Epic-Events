package com.model.payment;

public class ServicePayment {
	
	private static int detailId;
	private static int userId;
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
		ServicePayment.detailId = detailId;
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
		ServicePayment.userId = userId;
	}
	
	

}
