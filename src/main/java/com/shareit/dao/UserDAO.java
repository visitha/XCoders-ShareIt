package com.shareit.dao;

import java.util.List;

import com.shareit.model.User;
import com.shareit.model.UserRole;

public interface UserDAO {

	int getUserByName(String name);
	
	List<UserRole> getAllUserRoles();
	
	void saveUser(User user);
	
	void saveUserRoles(String user, String springRole);
}
