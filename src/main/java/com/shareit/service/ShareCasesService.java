package com.shareit.service;

import java.util.List;

import com.shareit.model.ShareCase;

public interface ShareCasesService {

	ShareCase getShareCasesByUserId(int userId);
	
	List<ShareCase> getShareCasesByUserName(String userName);
	
	void insertShareCaseToDB(ShareCase shareCase);
	
}
