package com.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Interfaces.ServiceInterface;
import com.databaseUtility.DatabaseManager;
import com.model.services.Services;

public class ServiceData implements ServiceInterface {

	@Override
	public int addService(Services services) throws ClassNotFoundException {
		// TODO Auto-generated method stub
		String INSERT_SERVICE_DB = "INSERT INTO services" + "(ser_price,ser_dep,admin_id) VALUES" + "(?,?,?);" ;
		
		int result = 0;
		
		try (Connection connection = DatabaseManager.getConnection();
				
			     PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SERVICE_DB)) {
					
					//Services Services = new Services();
				    preparedStatement.setString(2, services.getDescription());
				    preparedStatement.setDouble(1, services.getPrice());
				    preparedStatement.setInt(3, 1);
	
				    System.out.println(preparedStatement);
	
				    result = preparedStatement.executeUpdate();
				    

			} catch(SQLException e) {
				
			    e.printStackTrace();
			    
			}
		
		return result;
	}
    
	public int updateService(Services services) throws ClassNotFoundException {
	    String UPDATE_SERVICES = "UPDATE services SET ser_dep = ?, ser_price = ? WHERE service_id = ?;";

	    try (Connection connection = DatabaseManager.getConnection();
	         PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_SERVICES)) {

	        
	        preparedStatement.setString(1, services.getDescription());
	        preparedStatement.setDouble(2, services.getPrice());
	        preparedStatement.setInt(3, services.getServiceId());

	        
	        int rowsUpdated = preparedStatement.executeUpdate();

	        return rowsUpdated;
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	        
	        return 0;
	    }
	}

    public List<Services> getServices() throws ClassNotFoundException {
    	
        String SELECT_SERVICES_DB = "SELECT * FROM services";
        List<Services> serviceList = new ArrayList<>();

        try (Connection connection = DatabaseManager.getConnection();
        		PreparedStatement preparedStatement = connection.prepareStatement(SELECT_SERVICES_DB);
        		ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
            	
                Services service = new Services();
                
                service.setServiceId(resultSet.getInt("service_id"));
                service.setPrice(resultSet.getDouble("ser_price"));
                service.setDescription(resultSet.getString("ser_dep"));
                
                serviceList.add(service);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exception
        }

        return serviceList;
    }
}


