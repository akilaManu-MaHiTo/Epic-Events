package com.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.databaseUtility.DatabaseManager;
import com.model.SessionManager;
import com.model.venue.UserVenue;


public class UserVenueData {
	
	public int addUserVenue(UserVenue uservenue) throws ClassNotFoundException, SQLException {
				
	    String INSERT_USER_VENUE = "INSERT INTO user_venue (user_id, detail_id, venue_id, venue_price) VALUES (?, ?, ?, ?)";

	    try (Connection connection = DatabaseManager.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_VENUE)) {
	        // Set parameters of the prepared statement
	        preparedStatement.setInt(1, uservenue.getUserId());
	        preparedStatement.setInt(2, uservenue.getDetailId());
	        preparedStatement.setInt(3, uservenue.getVenueId());
	        preparedStatement.setString(4, uservenue.getVenuePrice());

	        // Execute the SQL query
	        return preparedStatement.executeUpdate();
	    } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	public List<UserVenue> getUserVenue() throws SQLException {
	    List<UserVenue> userVenue = new ArrayList<>();
	    String GET_USER_VENUE = "SELECT V.v_name, V.address, V.capacity, V.venue_price,V.venue_id " +
	                             "FROM venue V " +
	                             "INNER JOIN user_venue UV ON UV.venue_id = V.venue_id " +
	                             "INNER JOIN event_details ED ON ED.detail_id = UV.detail_id " +
	                             "WHERE ED.detail_id = ?";

	    try (Connection connection = DatabaseManager.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(GET_USER_VENUE)) {
	        
	        // Set the detail ID from SessionManager
	        preparedStatement.setInt(1, SessionManager.getDetailsID());

	        try (ResultSet resultSet = preparedStatement.executeQuery()) {
	            while (resultSet.next()) {
	            	
	                String venueName = resultSet.getString("v_name");
	                String venueAddress = resultSet.getString("address");
	                int venueCapacity = resultSet.getInt("capacity");
	                int venueID = resultSet.getInt("venue_id");
	                Double venuePrice = resultSet.getDouble("venue_price");

	                UserVenue userVenueItem = new UserVenue();
	                
	                userVenueItem.setVenueName(venueName);
	                userVenueItem.setVenueId(venueID);
	                userVenueItem.setAddress(venueAddress);
	                userVenueItem.setCapacity(venueCapacity);
	                userVenueItem.setVenuePriceD(venuePrice);
	                
	                userVenue.add(userVenueItem);
	            }
	        }
	    }

	    return userVenue;
	}

	public int deleteUserVenue(UserVenue uservenue) throws ClassNotFoundException, SQLException{
		
	    String DELETE_USER_SERVICE = "DELETE FROM user_venue WHERE venue_id = ? AND user_id = ? AND detail_id = ?";

	    try (Connection connection = DatabaseManager.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER_SERVICE)) {
	        // Set parameters of the prepared statement
	        preparedStatement.setInt(1, uservenue.getVenueId());
	        preparedStatement.setInt(2, SessionManager.getUsersID());
	        preparedStatement.setInt(3, uservenue.getDetailId());
	        
	        //System.out.println(userservice.getServiceId()+SessionManager.getUsersID()+userservice.getDetailId());

	        // Execute the SQL query
	        return preparedStatement.executeUpdate();
	    }
		
	}
	
	public double sumOfVenuePrice() {
		
	    double sumOfVenuePrice = 0.0; // Initialize sumOfServicePrice variable

	    String SELECT_TOTAL_SERVICE_PRICE = "SELECT SUM(venue_price) AS total_venue_price " +
	                                        "FROM user_venue " +
	                                        "WHERE user_id = ? AND detail_id = ?";

	    try (Connection connection = DatabaseManager.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TOTAL_SERVICE_PRICE)) {
	        // Set parameters of the prepared statement
	        preparedStatement.setInt(1, SessionManager.getUsersID());
	        preparedStatement.setInt(2, SessionManager.getDetailsID());

	        // Execute the SQL query
	        try (ResultSet resultSet = preparedStatement.executeQuery()) {
	            if (resultSet.next()) {
	                // Assign the result to sumOfServicePrice variable
	            	sumOfVenuePrice = resultSet.getDouble("total_venue_price");
	            }
	        }
	    } catch (SQLException e) {
	        // Handle SQL exception
	        e.printStackTrace();
	    }
	    return sumOfVenuePrice; // Return the sum of service prices
	}
	
	
}


