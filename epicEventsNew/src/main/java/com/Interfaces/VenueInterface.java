package com.Interfaces;

import java.sql.SQLException;
import java.util.List;

import com.model.venue.Venue;

public interface VenueInterface {

	public int addVenueDetails(Venue venue) throws ClassNotFoundException, SQLException;
	
	public int UpdateVenueDetails(Venue venue) throws ClassNotFoundException, SQLException;
	
	public List<Venue> getVenue() throws ClassNotFoundException;
}
