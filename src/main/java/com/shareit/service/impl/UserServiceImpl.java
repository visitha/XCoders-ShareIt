package com.shareit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.shareit.dao.ShareCasesDAO;
import com.shareit.dao.UserDAO;
import com.shareit.model.User;
import com.shareit.model.UserRole;
import com.shareit.service.UserService;

public class UserServiceImpl implements UserService{

	@Autowired
	private UserDAO userDAO;
	
	@Override
	public int getUserIdByName(String name) {
		// TODO Auto-generated method stub
		return this.userDAO.getUserByName(name);
	}

	@Override
	public String getUserNameById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserRole> getAllUserRoles() {
		// TODO Auto-generated method stub
		return userDAO.getAllUserRoles();
	}
	
	@Override
	public void saveUser(User user) {
		this.userDAO.saveUser(user);
	}
	
	@Override
	public void saveUserRole(String user, String role) {
		this.userDAO.saveUserRoles(user, role);
		
	}
	
	@Override
	public List<String> getUserRoles(String username) {
		return userDAO.getUserRoles(username);
	}
}
