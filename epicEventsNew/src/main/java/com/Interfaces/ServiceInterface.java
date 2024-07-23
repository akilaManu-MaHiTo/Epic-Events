package com.Interfaces;

import java.util.List;

import com.model.services.Services;

public interface ServiceInterface {
	
	public int addService(Services services) throws ClassNotFoundException;
	
	List<Services> getServices() throws ClassNotFoundException;
	
	public int updateService(Services services) throws ClassNotFoundException;
}
