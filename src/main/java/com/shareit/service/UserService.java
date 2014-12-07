package com.shareit.service;

import java.util.List;

import com.shareit.model.User;
import com.shareit.model.UserRole;

public interface UserService {

	int getUserIdByName(String name);
	
	String getUserNameById(int id);
	
	List<UserRole> getAllUserRoles();
	
	void saveUser(User user);
	
	void saveUserRole(String user, String role);
}
