package com.model.services;

public class UserService {
	
	private int userId;
	private int serviceId;
	private int detailId;
	private String servicePrice;
	private double servicePriceD;
	/**
	 * @return the servicePriceD
	 */
	public double getServicePriceD() {
		return servicePriceD;
	}
	/**
	 * @param servicePriceD the servicePriceD to set
	 */
	public void setServicePriceD(double servicePriceD) {
		this.servicePriceD = servicePriceD;
	}
	/**
	 * @return the serviceDetails
	 */
	public String getServiceDetails() {
		return serviceDetails;
	}
	/**
	 * @param serviceDetails the serviceDetails to set
	 */
	public void setServiceDetails(String serviceDetails) {
		this.serviceDetails = serviceDetails;
	}
	private String serviceDetails;
	/**
	 * @return the servicePrice
	 */
	public String getServicePrice() {
		return servicePrice;
	}
	/**
	 * @param servicePrice the servicePrice to set
	 */
	public void setServicePrice(String servicePrice) {
		this.servicePrice = servicePrice;
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
	 * @return the serviceId
	 */
	public int getServiceId() {
		return serviceId;
	}
	/**
	 * @param serviceId the serviceId to set
	 */
	public void setServiceId(int serviceId) {
		this.serviceId = serviceId;
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
	
	

}
