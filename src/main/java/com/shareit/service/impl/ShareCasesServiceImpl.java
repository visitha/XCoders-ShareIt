package com.shareit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.shareit.dao.ShareCasesDAO;
import com.shareit.model.ShareCase;
import com.shareit.service.ShareCasesService;

public class ShareCasesServiceImpl implements ShareCasesService{

	@Autowired
	private ShareCasesDAO shareCasesDAO;
	
	@Override
	public ShareCase getShareCasesByUserId(int userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ShareCase> getShareCasesByUserName(String userName) {
		List<ShareCase> sharecase = shareCasesDAO.getShareCasesByUserName(userName);
		return sharecase;
	}

}
