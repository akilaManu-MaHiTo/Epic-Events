package com.Interfaces;

import java.sql.SQLException;
import java.util.List;

import com.model.User;

public interface UserInterface {
	
	public int regUser(User user) throws ClassNotFoundException;
	public int addUserContact(String email,String contact) throws ClassNotFoundException;
	public boolean loggedUser(User user) throws ClassNotFoundException;
	public List<User> getUsersDetailsByEmail(String email) throws ClassNotFoundException;
	public User getUserDetailsByEmail(String email) throws ClassNotFoundException;
	public List<User> updateUser() throws ClassNotFoundException;
	public User deleteUser(int userID) throws ClassNotFoundException;
	public User updateUser(User user) throws ClassNotFoundException;
	public User deleteUserContact(int userID) throws ClassNotFoundException;
	public boolean adminLogging(User user) throws ClassNotFoundException, SQLException;
	
}
