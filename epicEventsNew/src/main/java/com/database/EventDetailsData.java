package com.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.SessionManager;
import com.model.plan.BdayPlan;
import com.model.plan.Birthday;
import com.Interfaces.EventPlanInterface;
import com.databaseUtility.DatabaseManager;

public class EventDetailsData implements EventPlanInterface{
	
	public int addEventDetails(Birthday birthday) throws ClassNotFoundException, SQLException{
	    // Define the SQL query
	    String INSERT_EVENT_DETAILS = "INSERT INTO event_details (d_date, first_name, last_name) VALUES (?, ?, ?)";

	    try (Connection connection = DatabaseManager.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(INSERT_EVENT_DETAILS)) {
	        // Set parameters of the prepared statement
	        preparedStatement.setString(1, birthday.getDate());
	        preparedStatement.setString(2, birthday.getFirstName());
	        preparedStatement.setString(3, birthday.getLastName());
	        
	        System.out.println(preparedStatement);
	        
	        return preparedStatement.executeUpdate();
	    }
	}
	
    public int getEventDetailId() throws ClassNotFoundException, SQLException {

    	String SELECT_MAX_DETAIL_ID = "SELECT MAX(detail_id) AS max_detail_id FROM event_details;";

        try (Connection connection = DatabaseManager.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_MAX_DETAIL_ID)) {

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int maxDetailId = resultSet.getInt("max_detail_id");
                SessionManager.setDetailsID(maxDetailId);
                //System.out.println(maxDetailId);
                return maxDetailId;
                
            } else {
                
                return -1;
            }
        }
    }
		
	public int addBirthdayDetails(Birthday birthday) throws ClassNotFoundException, SQLException {
	    String INSERT_EVENT_BDAY = "INSERT INTO bday (detail_id,age) VALUES (?, ?)";

	    try (Connection connection = DatabaseManager.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(INSERT_EVENT_BDAY)) {
	        // Set parameters of the prepared statement
	    	
	    	preparedStatement.setInt(1, SessionManager.getDetailsID());
	        preparedStatement.setInt(2, birthday.getAge());

	        
	        System.out.println(preparedStatement);
	        
	        return preparedStatement.executeUpdate();
	    }
	}
    
	public List<BdayPlan> getUserEventDetails() throws SQLException {

        List<BdayPlan> bdayPlans = new ArrayList<>();
        String GET_USER_EVENT_DETAILS = "SELECT DISTINCT ed.first_name, ed.last_name, ed.detail_id, ed.d_date, bd.age " +
                                        "FROM event_details AS ed " +
                                        "JOIN user_choose AS uc ON ed.detail_id = uc.detail_id " +
                                        "JOIN bday AS bd ON ed.detail_id = bd.detail_id " +
                                        "WHERE uc.user_id = ?";

        try (Connection connection = DatabaseManager.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_USER_EVENT_DETAILS)) {

            // Set the user ID from SessionManager
            preparedStatement.setInt(1, SessionManager.getUsersID()); // Assuming you have a method to get the user ID

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {

                    String firstName = resultSet.getString("first_name");
                    String lastName = resultSet.getString("last_name");
                    String detailId = resultSet.getString("detail_id");
                    String eventDate = resultSet.getString("d_date");
                    String age = resultSet.getString("age");
                    
                    Integer bdayIdInt = Integer.parseInt(detailId);
                    Integer bdayAgeInt = Integer.parseInt(age);

                    BdayPlan bdayPlan = new BdayPlan();

                    bdayPlan.setFirstName(firstName);
                    bdayPlan.setLastName(lastName);
                    bdayPlan.setDetailId(bdayIdInt);
                    bdayPlan.setEventdate(eventDate);
                    bdayPlan.setAge(bdayAgeInt);

                    bdayPlans.add(bdayPlan);
                }
            }
        }

        return bdayPlans;
    }

	public int updateEventDetails(BdayPlan bday) {
		
		String UPDATE_EVENT_DETAILS = "UPDATE event_details AS ed " +
                "JOIN bday AS bd ON ed.detail_id = bd.detail_id " +
                "SET " +
                "    ed.first_name = ?, " +
                "    ed.last_name = ?, " +
                "    ed.d_date = ?, " +
                "    bd.age = ? " +
                "WHERE " +
                "    ed.detail_id = ?;";

		try (Connection connection = DatabaseManager.getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_EVENT_DETAILS)) {
		
			// Set parameters for the prepared statement
			preparedStatement.setString(1, bday.getFirstName());
			preparedStatement.setString(2, bday.getLastName());
			preparedStatement.setString(3, bday.getEventdate());
			preparedStatement.setInt(4, bday.getAge());
			preparedStatement.setInt(5, bday.getDetailId());
			
			
			return preparedStatement.executeUpdate();
			
			} catch (SQLException e) {
				
				e.printStackTrace();
				
				return 0;
			}		
	}

	public int deleteEventDetails(BdayPlan bday) throws SQLException {
		
	    String DELETE_USER_CHOOSE = "DELETE FROM user_choose WHERE detail_id = ?";
	    String DELETE_USER_VENUE = "DELETE FROM user_venue WHERE detail_id = ?";
	    String DELETE_BDAY = "DELETE FROM bday WHERE detail_id = ?";
	    String DELETE_EVENT_DETAILS = "DELETE FROM event_details WHERE detail_id = ?";
	    String DELETE_PAYMENT = "DELETE FROM payment WHERE detail_id = ?";

	    int deletedRows = 0;

	    try (Connection connection = DatabaseManager.getConnection()) {
	        // Begin a transaction
	        connection.setAutoCommit(false);

	        // Check if there are related records in both payment and event_details tables
	        boolean relatedRecordsExist = false;
	        try (PreparedStatement pstmtCheck = connection.prepareStatement(
	                "SELECT COUNT(*) FROM payment WHERE detail_id = ? AND EXISTS (SELECT 1 FROM event_details WHERE detail_id = ?)")) {
	            int detailId = bday.getDetailId();
	            pstmtCheck.setInt(1, detailId);
	            pstmtCheck.setInt(2, detailId);
	            ResultSet resultSet = pstmtCheck.executeQuery();
	            if (resultSet.next()) {
	                relatedRecordsExist = resultSet.getInt(1) > 0;
	            }
	        }

	        // If related records exist in both tables, rollback the transaction
	        if (relatedRecordsExist) {
	            connection.rollback();
	            return 0; // Indicate that deletion was not successful
	        }

	        // Delete related records from each table
	        try (PreparedStatement pstmtUserChoose = connection.prepareStatement(DELETE_USER_CHOOSE);
	             PreparedStatement pstmtUserVenue = connection.prepareStatement(DELETE_USER_VENUE);
	             PreparedStatement pstmtBday = connection.prepareStatement(DELETE_BDAY);
	             PreparedStatement pstmtEventDetails = connection.prepareStatement(DELETE_EVENT_DETAILS);
	             PreparedStatement pstmtPayment = connection.prepareStatement(DELETE_PAYMENT)) {

	            // Set detail_id parameter for each prepared statement
	            int detailId = bday.getDetailId();
	            pstmtUserChoose.setInt(1, detailId);
	            pstmtUserVenue.setInt(1, detailId);
	            pstmtBday.setInt(1, detailId);
	            pstmtEventDetails.setInt(1, detailId);
	            pstmtPayment.setInt(1, detailId);

	            // Execute deletion queries
	            deletedRows += pstmtUserChoose.executeUpdate();
	            deletedRows += pstmtUserVenue.executeUpdate();
	            deletedRows += pstmtBday.executeUpdate();
	            deletedRows += pstmtEventDetails.executeUpdate();
	            deletedRows += pstmtPayment.executeUpdate();

	            // Commit the transaction if deletion is successful
	            connection.commit();
	        } catch (SQLException e) {
	            connection.rollback(); // Rollback if an exception occurs during deletion
	            throw e; // Re-throw the exception to be handled by the caller
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	        return 0; // Indicate that deletion was not successful
	    }

	    return deletedRows; // Return the number of deleted rows
	}

}


