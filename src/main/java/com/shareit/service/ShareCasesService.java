package com.shareit.service;

import java.util.List;

import com.shareit.model.ShareCase;
import com.shareit.model.ShareCaseType;

public interface ShareCasesService {

	ShareCase getShareCasesByUserId(int userId);
	
	List<ShareCase> getShareCasesByUserName(String userName);
	
	void insertShareCaseToDB(ShareCase shareCase);
	
	List<ShareCaseType> getAllShareCaseTypes();
	
	List<ShareCase> getAllRefugeeShareCases();
	
	List<ShareCase> getAllDonationShareCases();
	
	List<ShareCase> getAllSellShareCases();
	
	List<ShareCase> getAllBuyShareCases();
	
}
