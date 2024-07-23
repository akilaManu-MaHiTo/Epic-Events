package com.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Interfaces.PaymentInterface;
import com.databaseUtility.DatabaseManager;
import com.model.SessionManager;
import com.model.payment.Payment;
import com.model.payment.PaymentDetails;
import com.model.payment.ServicePayment;
import com.model.payment.UserPaymentData;
import com.model.services.Services;


public class PaymentData implements PaymentInterface {

	@Override
	public int addPayment(Payment pay) throws ClassNotFoundException {
	    // Define your SQL query
	    String INSERT_PAYMENT = "INSERT INTO payment (user_id, detail_id, event_id, price, card_holdername, card_type, cvv, expire_date, accept) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	    
	    try (Connection connection = DatabaseManager.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PAYMENT)) {
	        
	        // Set parameters for the PreparedStatement
	        preparedStatement.setInt(1, SessionManager.getUsersID());
	        preparedStatement.setInt(2, SessionManager.getDetailsID());
	        preparedStatement.setInt(3, 2);
	        preparedStatement.setDouble(4, SessionManager.getPaymentPrice());
	        preparedStatement.setString(5, pay.getCardHolder());
	        preparedStatement.setString(6, "VISA");
	        preparedStatement.setString(7, pay.getCvv());
	        preparedStatement.setString(8, pay.getExpDate());
	        preparedStatement.setString(9, "Pending");
	        
	        // Execute the query
	        int rowsAffected = preparedStatement.executeUpdate();
	        
	        // Return the number of rows affected (should be 1 if the insertion is successful)
	        return rowsAffected;
	        
	    } catch (SQLException e) {
	        // Handle any SQL exceptions
	        e.printStackTrace(); // Log the exception for debugging purposes
	        
	        // Optionally, you can throw an exception or return an error code to indicate failure
	        return -1; // Return -1 to indicate failure
	    }
	}

	public List<UserPaymentData> getUserPayments() throws SQLException {
		
        List<UserPaymentData> userPayments = new ArrayList<>();
        
        String GET_USER_PAYMENT = "SELECT " +
        		"p.accept, " +
                "p.payment_id, " +
                "p.price AS payment_price, " +
                "v.v_name AS venue_name, " +
                "e.event_name, " +
                "CONCAT(ed.first_name, ' ', ed.last_name) AS Event_Person, " +
                "u.first_name AS user_name " +
                "FROM " +
                "payment p " +
                "JOIN user_venue uv ON p.detail_id = uv.detail_id " +
                "JOIN venue v ON uv.venue_id = v.venue_id " +
                "JOIN event e ON p.event_id = e.event_id " +
                "JOIN user u ON p.user_id = u.user_id " +
                "JOIN event_details ed ON ed.detail_id = p.detail_id " +
                "WHERE p.user_id = ? " +
                "GROUP BY " +
                "p.payment_id, " +
                "p.price, " +
                "v.v_name, " +
                "e.event_name, " +
                "u.first_name, " +
                "u.last_name";

        try (Connection connection = DatabaseManager.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_USER_PAYMENT)) {

            preparedStatement.setInt(1, SessionManager.getUsersID()); // Set the user ID

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                	
                    UserPaymentData paydata = new UserPaymentData();
                    
                    paydata.setPaymentId(resultSet.getInt("payment_id"));
                    paydata.setPaymentPrice(resultSet.getString("payment_price"));
                    paydata.setVenueName(resultSet.getString("venue_name"));
                    paydata.setEventName(resultSet.getString("event_name"));
                    paydata.setEventPerson(resultSet.getString("Event_Person"));
                    paydata.setUserName(resultSet.getString("user_name"));
                    paydata.setAccept(resultSet.getString("accept"));
                    
                    userPayments.add(paydata);
                    
                    System.out.println();
                }
            }
        }
        
        return userPayments;
    }
	
	public int deletePayment(UserPaymentData delPay) throws ClassNotFoundException {
		
	    String DELETE_PAYMENT = "DELETE FROM payment WHERE payment_id = ?";
	    
	    try (Connection connection = DatabaseManager.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PAYMENT)) {
	        
	    	
	        preparedStatement.setInt(1, delPay.getPaymentId());
	        
	        int rowsAffected = preparedStatement.executeUpdate();
	        
	        
	        return rowsAffected;
	        
	    } catch (SQLException e) {
	        
	        e.printStackTrace();
	        
	        return -1;
	    }
		
	}
 
	public List<PaymentDetails> getUserPaymentsDetails() {
		
	    List<PaymentDetails> userPayments = new ArrayList<>();
	    
	    String GET_PAYMENT_DETAILS = "SELECT p.payment_id, p.price, u.email, b.age, e.event_name, v.v_name, ed.first_name, ed.last_name, p.accept, uc.contact, ed.detail_id, u.user_id " +
	            "FROM payment p " +
	            "JOIN user u ON p.user_id = u.user_id " +
	            "JOIN event_details ed ON ed.detail_id = p.detail_id " +
	            "JOIN user_contact uc ON u.user_id = uc.user_id " +
	            "JOIN bday b ON b.detail_id = ed.detail_id " +
	            "JOIN event e ON e.event_id = p.event_id " +
	            "JOIN user_venue uv ON uv.detail_id = ed.detail_id " +
	            "JOIN venue v ON uv.venue_id = v.venue_id";

	    try (Connection connection = DatabaseManager.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(GET_PAYMENT_DETAILS)) {
	        try (ResultSet resultSet = preparedStatement.executeQuery()) {
	            while (resultSet.next()) {
	            	
	            	
	            	
	                PaymentDetails paymentDetails = new PaymentDetails();
	                
	                paymentDetails.setUserId(resultSet.getInt("user_id"));
	                paymentDetails.setDetailId(resultSet.getInt("detail_id"));	                
	                paymentDetails.setPaymentId(resultSet.getInt("payment_id"));
	                paymentDetails.setPrice(resultSet.getString("price"));
	                paymentDetails.setEmail(resultSet.getString("email"));
	                paymentDetails.setAge(resultSet.getInt("age"));
	                paymentDetails.setEventName(resultSet.getString("event_name"));
	                paymentDetails.setVenuName(resultSet.getString("v_name"));
	                paymentDetails.setFirstName(resultSet.getString("first_name"));
	                paymentDetails.setLastName(resultSet.getString("last_name"));
	                paymentDetails.setAccept(resultSet.getString("accept"));
	                userPayments.add(paymentDetails);
	            }
	        }
	    } catch (SQLException e) {
	        // Handle or log the exception
	        e.printStackTrace();
	    }

	    return userPayments;
	}

	public int updatePayment(PaymentDetails upPay) throws ClassNotFoundException {
		
	    String UPDATE_PAYMENT = "UPDATE payment SET accept = ? WHERE payment_id = ?;";

	    try (Connection connection = DatabaseManager.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PAYMENT)) {

	        
	        preparedStatement.setString(1, upPay.getAccept());
	        preparedStatement.setInt(2, upPay.getPaymentId());
	        

	        
	        int rowsUpdated = preparedStatement.executeUpdate();

	        return rowsUpdated;
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	        
	        return 0;
	    }
	}

	public List<Services> viewServices() throws ClassNotFoundException {
	    List<Services> userServices = new ArrayList<>();
	    
	    String GET_SERVICE_DETAILS = "SELECT s.ser_dep " +
	                                  "FROM services s " +
	                                  "JOIN user_choose uc ON s.service_id = uc.service_id " +
	                                  "JOIN payment p ON uc.detail_id = p.detail_id " +
	                                  "WHERE uc.user_id = ? AND uc.detail_id = ?";

	    try (Connection connection = DatabaseManager.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(GET_SERVICE_DETAILS)) {
	        
	    	ServicePayment sp = new ServicePayment();
	    	
	        preparedStatement.setInt(1, sp.getUserId());
	        preparedStatement.setInt(2, sp.getDetailId());
	        
	        try (ResultSet resultSet = preparedStatement.executeQuery()) {
	            while (resultSet.next()) {
	                Services service = new Services();
	                service.setDescription(resultSet.getString("ser_dep"));
	                userServices.add(service);
	            }
	        }
	    } catch (SQLException e) {
	        // Handle or log the exception
	        e.printStackTrace();
	    }
	    
	    // Print out the retrieved services
	    for (Services service : userServices) {
	        System.out.println("Service Description: " + service.getDescription());
	    }

	    return userServices;
	}



}
