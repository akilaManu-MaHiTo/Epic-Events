package com.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Interfaces.UserInterface;
import com.databaseUtility.DatabaseManager;
import com.model.SessionManager;
import com.model.User;

public class UserData implements UserInterface{
	
	public int regUser(User user) throws ClassNotFoundException {
		
		String INSERT_USER_DB = "INSERT INTO user" + "(email,password,first_name,admin_id,last_name,address) VALUES" + "(?,?,?,?,?,?);" ;
		
		int result = 0;
		
		Class.forName("com.mysql.jdbc.Driver");
		

		try (Connection connection = DatabaseManager.getConnection();
				
			     PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_DB)) {

				    preparedStatement.setString(1, user.getEmail());
				    preparedStatement.setString(3, user.getFirstName());
				    preparedStatement.setString(2, user.getPassword());				    
				    preparedStatement.setInt(4, 1);
				    preparedStatement.setString(5, user.getLastName());
				    preparedStatement.setString(6, user.getAddress());
	
				    System.out.println(preparedStatement);
	
				    result = preparedStatement.executeUpdate();
				    
				    if(result > 0) {				    	
				    	addUserContact(user.getEmail(),user.getContact());
				    }


			} catch(SQLException e) {
				
			    e.printStackTrace();
			    
			}
		
		return result;


	}
	
	public int addUserContact(String email,String contact) throws ClassNotFoundException {
	    String CHECK_EMAIL = "SELECT * FROM user WHERE email = ?";
	    User userDetails = null;
	    int result = 0;

	    try {
	        Class.forName("com.mysql.jdbc.Driver");

	        try (Connection connection = DatabaseManager.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(CHECK_EMAIL)) {

	            preparedStatement.setString(1, email);
	            ResultSet resultSet = preparedStatement.executeQuery();

	            if (resultSet.next()) {
	                // User found
	                userDetails = new User();
	                userDetails.setUserID(resultSet.getInt("user_id"));

	                String ADD_USER_CONTACT = "INSERT INTO user_contact (user_id, contact) VALUES (?, ?)";
	                
	                try (PreparedStatement contactStatement = connection.prepareStatement(ADD_USER_CONTACT)) {
	                	
	                	
	                    contactStatement.setInt(1, userDetails.getUserID());
	                    contactStatement.setString(2, contact); // Set the contact value here

	                    System.out.println(contactStatement);

	                    result = contactStatement.executeUpdate();
	                }
	            } else {
	                // User not found
	                // Handle this case as needed
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	            // Handle SQLException
	        }
	    } catch (ClassNotFoundException e) {
	        throw new ClassNotFoundException("MySQL JDBC Driver not found", e);
	    }
	    return result;
	}

	public boolean loggedUser(User user) throws ClassNotFoundException {
        String LOG_USER_QUERY = "SELECT * FROM user WHERE email = ? AND password = ?";
        boolean userFound = false;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            
    	    if (user.getEmail().equals("admin@epic.lk") || user.getPassword().equals("12345678")) {
    	        return false; // Not admin
    	    }
            
            try (Connection connection = DatabaseManager.getConnection();
                 PreparedStatement preparedStatement = connection.prepareStatement(LOG_USER_QUERY)) {
    
                preparedStatement.setString(1, user.getEmail());
                preparedStatement.setString(2, user.getPassword());
    
                ResultSet resultSet = preparedStatement.executeQuery();
    
                if (resultSet.next()) {
                    // User found
                	
                	userFound = true;
                	SessionManager.setUsersID(resultSet.getInt("user_id"));
                	
                    //int userID = resultSet.getInt("user_id");
                    //String UserName = resultSet.getString("first_name");
                    
                    
                } else {
                    // User not found
                     // Or any other appropriate indicator
                }
    
            } catch(SQLException e) {
                e.printStackTrace();
                 // Or any other appropriate indicator
            }
        } catch(ClassNotFoundException e) {
            throw new ClassNotFoundException("MySQL JDBC Driver not found", e);
        }
		return userFound;
    }
	
	public User getUserDetailsByEmail(String email) throws ClassNotFoundException {
	    String GET_USER_DETAILS_QUERY = "SELECT * FROM user WHERE email = ?";
	    User userDetails = null;

	    try {
	        Class.forName("com.mysql.jdbc.Driver");

	        try (Connection connection = DatabaseManager.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(GET_USER_DETAILS_QUERY)) {

	            preparedStatement.setString(1, email);
	            ResultSet resultSet = preparedStatement.executeQuery();

	            if (resultSet.next()) {
	                // User found
	                userDetails = new User();
	                userDetails.setEmail(resultSet.getString("email"));
	                userDetails.setFirstName(resultSet.getString("first_name"));
	                //userDetails.setUserID(resultSet.getInt("user_id"));
	                // Add more fields as needed
	            } else {
	                // User not found
	                // Handle this case as needed
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	            // Handle SQLException
	        }
	    } catch (ClassNotFoundException e) {
	        throw new ClassNotFoundException("MySQL JDBC Driver not found", e);
	    }

	    return userDetails;
	}
	
	public List<User> getUsersDetailsByEmail(String email) throws ClassNotFoundException {
	    String GET_USER_DETAILS_QUERY = "SELECT * FROM user WHERE email = ?";
	    List<User> userDetailsList = new ArrayList<>();

	    try {
	        Class.forName("com.mysql.jdbc.Driver");

	        try (Connection connection = DatabaseManager.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(GET_USER_DETAILS_QUERY)) {

	            preparedStatement.setString(1, email);
	            ResultSet resultSet = preparedStatement.executeQuery();

	            while (resultSet.next()) {
	                // User found
	                User userDetails = new User();
	                userDetails.setEmail(resultSet.getString("email"));
	                userDetails.setFirstName(resultSet.getString("first_name"));
	                // Add more fields as needed
	                userDetailsList.add(userDetails);
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	            // Handle SQLException
	        }
	    } catch (ClassNotFoundException e) {
	        throw new ClassNotFoundException("MySQL JDBC Driver not found", e);
	    }

	    return userDetailsList;
	}

	public List<User> updateUser() throws ClassNotFoundException {
	    String GET_ALL_USERS = "SELECT * FROM user WHERE user_id = ?";
	    String GET_USER_CONTACT_BY_ID = "SELECT contact FROM user_contact WHERE user_id = ?";
	    List<User> userList = new ArrayList<>();

	    try {
	        Class.forName("com.mysql.jdbc.Driver");

	        try (Connection connection = DatabaseManager.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_USERS)) {
	        	
	        	preparedStatement.setInt(1, SessionManager.getUsersID());        	
	            ResultSet resultSet = preparedStatement.executeQuery();
	            
	            System.out.print(SessionManager.getUsersID());
	            while (resultSet.next()) {
	                User userDetails = new User();
	                userDetails.setEmail(resultSet.getString("email"));
	                userDetails.setFirstName(resultSet.getString("first_name"));
	                userDetails.setLastName(resultSet.getString("last_name"));
	                userDetails.setPassword(resultSet.getString("password"));
	                userDetails.setAddress(resultSet.getString("address"));
	                int userID = resultSet.getInt("user_id");

	                // Retrieving user contact details
	                try (PreparedStatement contactStatement = connection.prepareStatement(GET_USER_CONTACT_BY_ID)) {
	                    contactStatement.setInt(1, userID);
	                    ResultSet contactResultSet = contactStatement.executeQuery();

	                    if (contactResultSet.next()) {
	                        userDetails.setContact(contactResultSet.getString("contact"));
	                    }
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                    // Handle SQLException for contact retrieval
	                }

	                userList.add(userDetails);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	            // Handle SQLException for user retrieval
	        }
	    } catch (ClassNotFoundException e) {
	        throw new ClassNotFoundException("MySQL JDBC Driver not found", e);
	    }

	    return userList;
	}
	
	public User updateUser(User user) throws ClassNotFoundException {
	    String UPDATE_USER_QUERY = "UPDATE user SET email=?, password=?, first_name=?, last_name=?, address=? WHERE user_id=?";

	    try {
	        Class.forName("com.mysql.jdbc.Driver");

	        try (Connection connection = DatabaseManager.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER_QUERY)) {
	        	
				preparedStatement.setString(1, user.getEmail());
				preparedStatement.setString(2, user.getPassword());
	            preparedStatement.setString(3, user.getFirstName());
	            preparedStatement.setString(4, user.getLastName());
	            preparedStatement.setString(5, user.getAddress());
	            preparedStatement.setInt(6, SessionManager.getUsersID());
	            
	             // Assuming SessionManager.getUsersID() returns the session manager's user ID

	            int rowsAffected = preparedStatement.executeUpdate();

	            if (rowsAffected > 0) {
	                // Update successful
	                return user;
	            } else {
	                // Update failed
	                // Handle this case as needed
	                return null;
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	            // Handle SQLException
	        }
	    } catch (ClassNotFoundException e) {
	        throw new ClassNotFoundException("MySQL JDBC Driver not found", e);
	    }

	    return null;
	}
	
	public User deleteUser(int userID) throws ClassNotFoundException {
		
	    String DELETE_USER = "DELETE FROM user WHERE user_id = ?";

	    try {
	        Class.forName("com.mysql.jdbc.Driver");

	        try (Connection connection = DatabaseManager.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER)) {

	        	preparedStatement.setInt(1, SessionManager.getUsersID());

	            int rowsAffected = preparedStatement.executeUpdate();

	            if (rowsAffected > 0) {
	                // Deletion successful
	                return new User(); // Or you can return some indication of success
	            } else {
	                // Deletion failed
	                // Handle this case as needed
	                return null;
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	            // Handle SQLException
	        }
	    } catch (ClassNotFoundException e) {
	        throw new ClassNotFoundException("MySQL JDBC Driver not found", e);
	    }

	    return null;
	}

	public User deleteUserContact(int userID) throws ClassNotFoundException {
	    String DELETE_USER_CONTACT = "DELETE FROM user_contact WHERE user_id = ?";

	    try {
	        Class.forName("com.mysql.jdbc.Driver");

	        try (Connection connection = DatabaseManager.getConnection();
	             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER_CONTACT)) {

	        	preparedStatement.setInt(1, SessionManager.getUsersID());

	            int rowsAffected = preparedStatement.executeUpdate();

	            if (rowsAffected > 0) {
	                // Deletion successful
	                return new User(); // Or you can return some indication of success
	            } else {
	                // Deletion failed
	                // Handle this case as needed
	                return null;
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	            // Handle SQLException
	        }
	    } catch (ClassNotFoundException e) {
	        throw new ClassNotFoundException("MySQL JDBC Driver not found", e);
	    }

	    return null;
	}

	public boolean adminLogging(User user) throws ClassNotFoundException, SQLException {
	    // Check if the email and password match the admin credentials
	    if (!user.getEmail().equals("admin@epic.lk") || !user.getPassword().equals("12345678")) {
	        return false; // Not admin
	    }

	    String LOG_ADMIN_QUERY = "SELECT * FROM user WHERE email = ? AND password = ?";
	    boolean adminFound = false;

	    try {
	        Class.forName("com.mysql.jdbc.Driver");
	    } catch (ClassNotFoundException e) {
	        throw new ClassNotFoundException("MySQL JDBC Driver not found", e);
	    }

	    try (Connection connection = DatabaseManager.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(LOG_ADMIN_QUERY)) {

	        preparedStatement.setString(1, user.getEmail());
	        preparedStatement.setString(2, user.getPassword());

	        try (ResultSet resultSet = preparedStatement.executeQuery()) {
	            if (resultSet.next()) {
	                // Admin found
	                adminFound = true;
	                SessionManager.setUsersID(resultSet.getInt("user_id"));
	                // You can retrieve other user information here if needed
	            } else {
	                // Admin not found
	                // Or any other appropriate indicator
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        // Or any other appropriate indicator
	        throw e;
	    }
	    return adminFound;
	}

}
