package com.shareit.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.shareit.dao.ShareCasesDAO;
import com.shareit.dao.UserDAO;
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

}
