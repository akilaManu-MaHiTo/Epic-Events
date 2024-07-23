package com.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.databaseUtility.DatabaseManager;
import com.model.SessionManager;
import com.model.services.UserService;

public class UserServiceData {
	
	
	public int addUserService(UserService userservice) throws ClassNotFoundException, SQLException{
	    // Define the SQL query
	    String INSERT_USER_SERVICE = "INSERT INTO user_choose (service_id, user_id, detail_id, service_price) VALUES (?, ?, ?, ?)";

	    try (Connection connection = DatabaseManager.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SERVICE)) {
	        // Set parameters of the prepared statement
	        preparedStatement.setInt(1, userservice.getServiceId());
	        preparedStatement.setInt(2, userservice.getUserId());
	        preparedStatement.setInt(3, userservice.getDetailId());
	        preparedStatement.setString(4, userservice.getServicePrice());

	        // Execute the SQL query
	        return preparedStatement.executeUpdate();
	    }
	}
	
	public List<UserService> getUserService() throws SQLException {
	    List<UserService> userServices = new ArrayList<>();
	    String GET_USER_SERVICE = "SELECT S.ser_dep, UC.service_price, UC.service_id " +
	                               "FROM services S " +
	                               "INNER JOIN user_choose UC ON S.service_id = UC.service_id " +
	                               "INNER JOIN event_details ED ON ED.detail_id = UC.detail_id " +
	                               "WHERE ED.detail_id = ?";

	    try (Connection connection = DatabaseManager.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(GET_USER_SERVICE)) {
	        
	        // Set the detail ID from SessionManager
	        preparedStatement.setInt(1, SessionManager.getDetailsID());

	        try (ResultSet resultSet = preparedStatement.executeQuery()) {
	            while (resultSet.next()) {
	                String serDep = resultSet.getString("ser_dep");
	                String servicePrice = resultSet.getString("service_price");
	                int serviceId = resultSet.getInt("service_id");

	                UserService userService = new UserService();
	                userService.setServiceDetails(serDep);
	                userService.setServicePrice(servicePrice);
	                userService.setServiceId(serviceId);
	                
	                userServices.add(userService);
	            }
	        }
	    }

	    return userServices;
	}
	
	public int deleteUserService(UserService userservice) throws ClassNotFoundException, SQLException{
		
	    String DELETE_USER_SERVICE = "DELETE FROM user_choose WHERE service_id = ? AND user_id = ? AND detail_id = ?";

	    try (Connection connection = DatabaseManager.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER_SERVICE)) {
	        // Set parameters of the prepared statement
	        preparedStatement.setInt(1, userservice.getServiceId());
	        preparedStatement.setInt(2, SessionManager.getUsersID());
	        preparedStatement.setInt(3, userservice.getDetailId());
	        
	        System.out.println(userservice.getServiceId()+SessionManager.getUsersID()+userservice.getDetailId());

	        // Execute the SQL query
	        return preparedStatement.executeUpdate();
	    }
	}
	
	public double sumOfServicePrice() {
		
	    double sumOfServicePrice = 0.0; // Initialize sumOfServicePrice variable

	    String SELECT_TOTAL_SERVICE_PRICE = "SELECT SUM(service_price) AS total_service_price " +
	                                        "FROM user_choose " +
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
	            	sumOfServicePrice = resultSet.getDouble("total_service_price");
	            }
	        }
	    } catch (SQLException e) {
	        // Handle SQL exception
	        e.printStackTrace();
	    }
	    return sumOfServicePrice; // Return the sum of service prices
	}
	
}



