package com.databaseUtility;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseManager {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/epicevents?useSSL=false";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "akila";

    public static Connection getConnection() throws SQLException {
        try {
        	
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            return connection;
            
        } catch (ClassNotFoundException | SQLException e) {
        	
            e.printStackTrace();
            throw new SQLException("Failed to connect to the database.");
            
        }
    }

    public static void closeConnection(Connection connection) {
        try {
        	
            if (connection != null) {
                connection.close();
                
            }
            
        } catch (SQLException e) {
        	
            e.printStackTrace();
        }
    }
}

