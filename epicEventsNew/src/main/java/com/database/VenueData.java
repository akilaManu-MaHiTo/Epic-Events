package com.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Interfaces.VenueInterface;
import com.databaseUtility.DatabaseManager;
import com.model.venue.Venue;

public class VenueData implements VenueInterface{
	
	
	public int addVenueDetails(Venue venue) throws ClassNotFoundException, SQLException{

	    // Define the SQL query
	    String INSERT_VENUE_DETAILS = "INSERT INTO venue"+ " (v_name, address, capacity, venue_price) VALUES (?, ?, ?, ?)";

	    try (Connection connection = DatabaseManager.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(INSERT_VENUE_DETAILS)) {
	        // Set parameters of the prepared statement
	        preparedStatement.setString(1, venue.getVenue_name());
	        preparedStatement.setString(2, venue.getAddress());
	        preparedStatement.setInt(3, venue.getCapacity());
	        preparedStatement.setDouble(4, venue.getPrice());

	        // Execute the SQL query
	        return preparedStatement.executeUpdate();
	    }
	}
	
	public int UpdateVenueDetails(Venue venue) throws ClassNotFoundException, SQLException{
		
	    String UPDATE_VENUE = "UPDATE venue SET v_name = ?,address = ?,capacity = ?,venue_price = ? WHERE venue_id = ?;";

	    try (Connection connection = DatabaseManager.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_VENUE)) {

	        
	        preparedStatement.setString(1, venue.getVenue_name());
	        preparedStatement.setString(2, venue.getAddress());
	        preparedStatement.setInt(3, venue.getCapacity());
	        preparedStatement.setDouble(4, venue.getPrice());
	        preparedStatement.setInt(5, venue.getVenueId());

	        
	        int rowsUpdated = preparedStatement.executeUpdate();

	        return rowsUpdated;
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	        
	        return 0;
	    }
				
	}
	
    public List<Venue> getVenue() throws ClassNotFoundException {
    	
        String SELECT_VENUE_DB = "SELECT * FROM venue";
        List<Venue> venueList = new ArrayList<>();

        try (Connection connection = DatabaseManager.getConnection();
        		PreparedStatement preparedStatement = connection.prepareStatement(SELECT_VENUE_DB);
        		ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
            	
            	Venue venue = new Venue();
                
            	
            	venue.setVenueId(resultSet.getInt("venue_id"));
            	venue.setVenue_name(resultSet.getString("v_name"));
            	venue.setAddress(resultSet.getString("address"));
            	venue.setCapacity(resultSet.getInt("capacity"));
            	venue.setPrice(resultSet.getDouble("venue_price"));
            	
                
            	venueList.add(venue);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exception
        }

        return venueList;
    } 
}

