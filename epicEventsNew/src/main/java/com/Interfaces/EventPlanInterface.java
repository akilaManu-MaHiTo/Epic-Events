package com.Interfaces;

import java.sql.SQLException;
import java.util.List;

import com.model.plan.BdayPlan;
import com.model.plan.Birthday;

public interface EventPlanInterface {
	
	public int addEventDetails(Birthday birthday) throws ClassNotFoundException, SQLException;
	
	public int getEventDetailId() throws ClassNotFoundException, SQLException;
	
	public int addBirthdayDetails(Birthday birthday) throws ClassNotFoundException, SQLException;
	
	public List<BdayPlan> getUserEventDetails() throws SQLException;
	
	public int updateEventDetails(BdayPlan bday);
	
	public int deleteEventDetails(BdayPlan bday) throws SQLException;
	
}
