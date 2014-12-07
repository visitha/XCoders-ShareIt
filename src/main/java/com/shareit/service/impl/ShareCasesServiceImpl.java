package com.shareit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.shareit.dao.ShareCasesDAO;
import com.shareit.model.ShareCase;
import com.shareit.model.ShareCaseType;
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
	
	@Override
	public void insertShareCaseToDB(ShareCase shareCase) {
		this.shareCasesDAO.insertShareCase(shareCase);
		
	}

	@Override
	public List<ShareCaseType> getAllShareCaseTypes() {
		return this.shareCasesDAO.getAllShareCaseTypes();
	}
	
	@Override
	public List<ShareCase> getAllRefugeeShareCases() {
		return this.shareCasesDAO.getShareCasesByCaseType(4);
	}
	
	@Override
	public List<ShareCase> getAllBuyShareCases() {
		return this.shareCasesDAO.getShareCasesByCaseType(3);
	}
	
	@Override
	public List<ShareCase> getAllDonationShareCases() {
		return this.shareCasesDAO.getShareCasesByCaseType(1);
	}
	@Override
	
	public List<ShareCase> getAllSellShareCases() {
		return this.shareCasesDAO.getShareCasesByCaseType(2);
	}
	
	
}
